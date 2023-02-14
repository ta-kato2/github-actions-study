#!/usr/bin/env bash

TOKEN=$(curl -s -X POST -H "Authorization: token dummy" "https://api.github.com/repos/ta-kato2/github-actions-study/actions/runners/registration-token" | jq -r .token)
/actions-runner/config.sh --url https://github.com/ta-kato2/github-actions-study --token ${TOKEN} --unattended

/usr/bin/supervisord

/actions-runner/config.sh remove --token ${TOKEN}