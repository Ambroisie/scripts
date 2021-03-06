#!/bin/sh

FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch --env-filter '
OLD_EMAIL="brunobelanyi@gmail.com"
CORRECT_NAME="Bruno BELANYI"
CORRECT_EMAIL="bruno@belanyi.fr"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]; then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]; then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
