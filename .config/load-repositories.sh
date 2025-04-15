#!/bin/bash
for repo in $(grep -o "\"path\": \".*\"" platform.code-workspace | awk -F: '{print $2}' | tr -d '"')
do
    if [[ "${repo}" != "." ]]
    then
        if [[ ! -d "${repo}" ]]
        then
                git clone "git@github.com:capgemini-aco/${repo}.git"
        else
            if [ "$(ls -A "${repo}")" ]; then
                echo "$repo repository exists"
	        else
                rm -r "${repo}"
                git clone "git@github.com:capgemini-aco/${repo}.git"
	        fi
        fi
    fi
done
