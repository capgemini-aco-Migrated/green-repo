# Devcontainer

## Configuration

To use a Devcontainer, you need first to authenticate your Docker client with GitHub Personal Access Token to access the image stored in GitHub Container Registry (GHCR).

### Steps to authenticate with GHCR.

Steps to generate GitHub Personal Access Token (classic) with required permissions to access packages and authenticate with GHCR.

1. Go to the `Settings` page of your GitHub account.
2. Click on `Developer settings`in the sidebar, then click on `Personal access tokens`.
3. Click on `Token (classic)`  and the `Generate new token` button.
4. Give your token a descriptive name and check the `read:packages` scope.
5. Click the `Generate token` button at the bottom of the page.
6. Copy the token value that is displayed. Note that you won't be able to see it again after you leave this page.
7. Click on Configure SSO and authorise one organisation (it can be any from your list of organisations).
8. Open a terminal windows and run the following command to log into to the GHCR:
`docker login ghcr.io`.
9. Enter your GitHub username and use the GitHub Token (classic) generated in previous steps as a password and hit enter.

### Test Access to GHCR container packages

The most common problem when users attempt to download the image is
forgetting to add the `read:packages` scope or approving SSO access.
Unlike the `docker login` or `docker pull` command which may return
"permission denied" or "Error response from daemon: denied". The
below command will either return a list of the container images or a
more detailed error message.

 > Don't forget to replace \<YOUR-TOKEN> with the real PAT token generated following the above steps.

``` bash
curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer <YOUR-TOKEN>" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/orgs/capgemini-axis/packages?package_type=container
```

## Local Development

As a precaution the default devcontainer configuration is configured to set two environment variables a `DEVELOP=local` and `PREFIX=<USERNAME>`. The example terragrunt code is also configured to detect these variables.

* `DEVELOP` - If the develop variable is detected it will make the terragrunt code use local copies of code instead or remote git repositories this can be useful when wanting to test code locally before committing. Be aware of the risks and limitations.

  * Ensure `terragrunt init` is run when updating code to ensure the .terragruntcache is up to date. Beware of the .terragruntcache ideally remove this to run a fresh execution unless making incremental changes
  * Ensure the submodules have checked out the expected versions. (Submodules are for the convenience of the developer but commit as specific versions in the repo `git submodule update --remote` or cd into submodule `git checkout <branch or tag>`)
  * Use remote versions `unset DEVELOP`
  * Terragrunt code should be configured to use the `DEVELOP` to override source

* `PREFIX` - If the prefix variable is set the terragrunt code is configured to prefix the environment variable with the username. This makes the environment variable unique when building components. Be aware of the risks and limitations.

  * Terragrunt code should be configured to use the `PREFIX` to override environment variable
  * Running against a live environment would require this variable to be unset `unset PREFIX`

### Live Environment Change

Executing a change locally against a real environment the recommendation would be to run the following commands:

``` bash
unset PREFIX  # Remove user prefix from environment value
unset DEVELOP # Remove the use of local blueprint directories
```
