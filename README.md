# Bare Repository Template

Templated repository providing a starting foundation for environment
configuration. This repository is an experimental structure for being
able to separate environment configuration from infrastructure code as
a standardised platform control workflow for developing with terraform
and other technologies in GitHub using the DRY pattern.

This template is to be used in conjunction with new repositories
to align the ways of working defined in the AXIS project.

- [Getting Started](#using-this-template)
- [Repository Structure](#repository-structure)
- [Development Environment](#development-environment)
- [CI/CD Workflows](#workflows)

---

## Repository Structure

This repository doesn't contain any example structures as it's intention
is to provide the base development and validation steps.

---

## Development Environment

### Devcontainer

This repository contains a .devcontainer specification which provides an
environment based on configuration as code this is achieved by using a
container definition either directly via the devcontainer.json or via
a Dockerfile. [Please refer to the developer guide on using
.devcontainer environment](https://literate-garbanzo-g337mpm.pages.github.io/docs/concepts/local-development/)

``` text
.devcontainer
  ∟ .devcontainer.json
platform.code-workspace
```

### Technology Stack

- [terragrunt](https://terragrunt.gruntwork.io/docs/)
- [terraform](https://www.terraform.io/)
- [awscli](https://aws.amazon.com/cli/)
- [kubernetes](https://kubernetes.io/docs)
- [kubectl](https://kubernetes.io/docs/reference/kubectl/)
- [argo-cd](https://argo-cd.readthedocs.io/en/stable/)
- [karpenter](https://karpenter.sh/)

### Code Workspace

This repository uses .code-workspace file to group together the
project repositories that makeup the platform.

[platform.code-workspace](platform.code-workspace)

### Submodules

This repository uses git submodules, which allows including the
repositories that makeup the platform as a subdirectory.

To checkout with submodules (Always check the submodules
are checked out at the correct branch or tag)

``` bash
  git clone --recurse-submodules git@github.com:capgemini-axis/bare-repositrory-template.git
```

To create a submodule in a repository use following steps:

1. Navigate to the directory where you want to add the submodule.
2. Run the following command to add the submodule, replacing the
`<submodule-url>` with the URL of the submodule repository and
replacing `<branch-name>` with the name of the branch for the
submodule.

```text
git submodule add -b <branch-name> <submodule-url>
```

This will add the submodule to your repository and create a new
commit with the submodule changes.

It's important to note the submodule will be added as a commit in
your main repository, but the actual code from the submodule will be
stored in a separate repository.

When you clone the main repository you'll also need to to initialize
and update the submodule in order to checkout the code from the submodule
repository. You can do this by running the following commands after
cloning the main repository:

```text
git submodule init
git submodule update
```

---

## Using this template

- [ ] Create repository from this template
- [ ] Update repository ownership add appropriate teams
- [ ] Add repository description
- [ ] Remove any redundant configuration or content i.e. images
- [ ] Replace repository README.md
- [ ] Update repository SECURITY.md
- [ ] Follow GHPO Policies
- [ ] Ensure repositories are registered via GHPO portal
- [ ] Replace .code-workspace file
- [ ] Refresh container tooling & versions

---

## Workflows

GitHub workflows provide a self-contained configuration as code CI/CD approach using GitHub. Combined with environments configured in GitHub they can be used to trigger validation and code roll outs manually or automatically. The standard terraform workflow would be linting -> validation -> plan --> apply. [See Workflows](docs/workflows.md)

---

### Act

Act provides the capability to simulate most workflow activities from the local machine.

> Be aware that this also includes release and deployment workflows. Caution is advised.

``` bash
act -l  # List workflow jobs
```

---

## Precommit (optional)

pre-commit provides local hooks that can be executed prior to code commit. The .devcontainer has this installed and the .pre-commit-config.yaml has some generic precommits configured to ensure keys or secrets aren’t saved and that the code aligns with terraform practices. However this configuration should be tailored to product or project requirements.

``` bash
[INFO] Installing environment for https://github.com/pre-commit/pre-commit-hooks.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
check yaml...............................................................Passed
check json...............................................................Passed
fix end of files.........................................................Passed
trim trailing whitespace.................................................Passed
mixed line ending........................................................Passed
check for case conflicts.................................................Passed
check for merge conflicts................................................Passed
check that executables have shebangs.................(no files to check)Skipped
detect aws credentials...................................................Passed
detect private key.......................................................Passed
codespell................................................................Passed
Test shell scripts with shellcheck...................(no files to check)Skipped
Terraform fmt............................................................Passed
Terraform validate.......................................................Passed
Terraform validate with tflint...........................................Passed
Terraform validate with tfsec............................................Passed
Terraform docs...........................................................Passed
Checkov..................................................................Passed
Infracost breakdown.....................................................Skipped
```

---

## Local Development

> Be aware of the automated environment variables [See devcontainer readme](.devcontainer/README.md)
> Default values are set i.e. DEVELOP which uses the local directories instead of the remote git repository
> this results in a single version checked out rather than the multiple tagged versions used by capabilities.

[See deployment documentation for local instructions](docs/deployment.md#local-terragrunt-approach)

---

## Automatic Versioning

This repository uses automatic versioning. Ensure commits align with commitlint message format. [See documentation](https://literate-garbanzo-g337mpm.pages.github.io/docs/best-practices/versioning/)

---

<!--Where users can get help with your project-->
## Problems

Any issues [please raise a ticket](/../../issues)

---

<!--Who maintains and contributes to the project-->
## Maintainers

This repository is maintained as part of the capgemini-axis organisation. [See capgemini-axis](https://github.com/capgemini-axis)

---

## Contributing

Contributions are welcome. Ensure documentation is updated when contributing to the repository.

---
