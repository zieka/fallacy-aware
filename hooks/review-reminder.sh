#!/usr/bin/env bash
# Points review commands and skills at fallacy-aware:review. Skill descriptions alone
# rarely fire mid-review, so this names the skill when a review starts.
# WARNING: exit 2 blocks the user's command or Skill call; hooks.json maps any failure to exit 1.
set -u
LC_ALL=C # NOTE: byte matching, so input that's invalid in the user's locale can't fail =~ silently

input=$(cat)

# NOTE: bash regex, not jq, so bash is the only dependency.
# REGEX: string value of the first "<key>": "<value>" pair
field() {
  local re="\"$1\"[[:space:]]*:[[:space:]]*\"([^\"]*)\""
  [[ $input =~ $re ]] && printf '%s' "${BASH_REMATCH[1]}"
}

event=$(field hook_event_name)
case "$event" in
  UserPromptExpansion) name=$(field command_name) ;; # typed /command; bypasses PreToolUse
  PreToolUse) name=$(field skill) ;;
  *) exit 0 ;;
esac

[[ $name == fallacy-aware:* ]] && exit 0

# REGEX: "review" or "pr-comments" as a whole name segment (code-review, pr-review-toolkit:review-pr, leave-pr-comments), not "preview"
re='(^|[:_-])(review|pr-comments)([:_-]|$)'
[[ $name =~ $re ]] || exit 0

printf '{"hookSpecificOutput":{"hookEventName":"%s","additionalContext":"%s"}}\n' "$event" \
  'Review starting: invoke the fallacy-aware:review skill before reporting findings.'
