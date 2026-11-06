#!/usr/bin/env bash
# Run: bash tests/review-reminder.test.sh
set -u
hook="$(cd "$(dirname "$0")/.." && pwd)/hooks/review-reminder.sh"
context='Review starting: invoke the fallacy-aware:review skill before reporting findings.'
fails=0

check() { # <want: inject|silent> <event> <name>
  local input want out status
  case "$2" in
    # NOTE: args precede skill so a parser that reads escaped quotes picks up the decoy
    PreToolUse) input='{"session_id":"s","hook_event_name":"PreToolUse","tool_name":"Skill","tool_input":{"args":"see \"skill\": \"code-review\"","skill":"'"$3"'"}}' ;;
    UserPromptExpansion) input='{"session_id":"s","hook_event_name":"UserPromptExpansion","expansion_type":"slash_command","command_name":"'"$3"'","command_source":"plugin","prompt":"/'"$3"'"}' ;;
  esac
  want=''
  [[ $1 == inject ]] && want="{\"hookSpecificOutput\":{\"hookEventName\":\"$2\",\"additionalContext\":\"$context\"}}"
  out=$(printf '%s' "$input" | bash "$hook")
  status=$?
  # WARNING: a non-zero exit shows a hook error on every Skill call, so silent cases must exit 0
  if [[ $status -ne 0 || $out != "$want" ]]; then
    echo "FAIL: $2 $3 -> want ${want:-<nothing>} (exit 0), got: ${out:-<nothing>} (exit $status)"
    fails=$((fails + 1))
  fi
}

check inject PreToolUse code-review
check inject PreToolUse pr-review-toolkit:review-pr
check inject UserPromptExpansion review-n-pr
check inject UserPromptExpansion leave-pr-comments
check silent PreToolUse fallacy-aware:review           # no self-reminder loop
check silent UserPromptExpansion fallacy-aware:review  # typed names keep the plugin prefix
check silent PreToolUse markdown-preview               # "preview" isn't a review
check silent PreToolUse smash-merge                    # escaped "skill" text in args must not match

[[ $fails -eq 0 ]] && echo "ok" || exit 1
