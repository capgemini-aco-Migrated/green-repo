# Workflows

These workflow use third party actions and software which
are governed by separate terms of service, privacy policy,
and support documentation. Always consider supply chain
security, the safety & compliance of sources.

Version pining preference commit SHA over Tags, Tags over branches.

- Commit SHA version is the safest for stability and security.
- Tags although offer a pinned version can be overwritten. When using
tags consider major version pinning to get security updates.
- Branches may be convenient but can be fluid resulting in breaking changes.

See [Security Hardening for GitHub Actions Documentation](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions)

The events that can trigger workflows can be found in the [GitHub documentation for workflow event types](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows)

## Secrets & Variables

| Secret Key                   | Scope       | Description                                                                                              |
|------------------------------|-------------|----------------------------------------------------------------------------------------------------------|
| AUTOMATION_GITHUB_TOKEN      | Repository  | Github Token to allow automated workflows to create PR's, create tags and modify files i.e. changelogs   |
| AUTOMATION_SSH_PRIVATE_KEY   | Repository  | (Optional) SSH Private Key for accessing other repositories include key headers along with the key - instead of token access. This approach can reach across organisations unlike tokens currently |

| Variable Key                 |  Scope      | Description                                                                               |
|------------------------------|-------------|-------------------------------------------------------------------------------------------|
|-|-|-|

## Configured Workflows
<!-- BEGIN_COMPONENT_MD -->

**Available workflows**:

- [Common Source Workflow](#common-source-workflow) (_[basic-pull-request.yaml](.github/workflows/basic-pull-request.yaml)_)
- [Pull Request Labeling](#pull-request-labeling) (_[label-pull-request.yaml](.github/workflows/label-pull-request.yaml)_)
- [Scheduled Updates](#scheduled-updates) (_[schedule-updates.yaml](.github/workflows/schedule-updates.yaml)_)
- [Semantic Release](#semantic-release) (_[semantic-release.yaml](.github/workflows/semantic-release.yaml)_)

---

### Common Source Workflow

Common source workflow runs the basic actions i.e. basic-src-security and basic-src-linting. Additionally any standard actions required upon a pull request are included such as the Pull Request title validation.

Filename: [.github/workflows/basic-pull-request.yaml](.github/workflows/basic-pull-request.yaml)

### Events

- workflow_call
- workflow_dispatch
- pull_request

#### Secrets

|Name|Type|Description|Required|Default|
|-|-|-|-|-|
|GH_APP_VERSIONING_ID|repository|-|undefined|-|
|GH_APP_VERSIONING_PRIVATE_KEY|repository|-|undefined|-|
|GITHUB_TOKEN|repository|-|undefined|-|

---

### Pull Request Labeling

Pull request labelling workflow ensures that Pull Requests (PR) is labelled correctly. It also provides the ability to run automation activities by setting a specific label to trigger specific workflows. This pattern can be extended and labels adjusted using the [labeler.yaml](../labeler.yaml) file. Ensure the labels are created within the repository other wise an error comment is added to the PR when it attempts to use an invalid label.

Filename: [.github/workflows/label-pull-request.yaml](.github/workflows/label-pull-request.yaml)

### Events

- pull_request

#### Secrets

|Name|Type|Description|Required|Default|
|-|-|-|-|-|
|GITHUB_TOKEN|repository|-|undefined|-|

---

### Scheduled Updates

Scheduled update workflow for components that require regular updates that are not included with dependabot i.e. av definitions, pre-commit

Filename: [.github/workflows/schedule-updates.yaml](.github/workflows/schedule-updates.yaml)

### Events

- workflow_call
- workflow_dispatch
- schedule

#### Secrets

|Name|Type|Description|Required|Default|
|-|-|-|-|-|
|GITHUB_TOKEN|repository|-|undefined|-|

---

### Semantic Release

This semantic workflow utilises the semantic versioning standard to ensure automated, consistent and meaningful version numbers upon merging pull request changes into the code base. It is fully customisable and can be adjusted to meet specific needs if desired. The actions analyses the commits in a Git repository since the last release, and determine the next version number based on the types of commits. [Semantic release documentation](https://semantic-release.gitbook.io/semantic-release/usage/configuration) [Capgemini AXIS version documentation](https://literate-garbanzo-g337mpm.pages.github.io/docs/best-practices/versioning/)

Filename: [.github/workflows/semantic-release.yaml](.github/workflows/semantic-release.yaml)

### Events

- push

#### Secrets

|Name|Type|Description|Required|Default|
|-|-|-|-|-|
|GH_APP_VERSIONING_ID|repository|-|undefined|-|
|GH_APP_VERSIONING_PRIVATE_KEY|repository|-|undefined|-|
|GITHUB_TOKEN|repository|-|undefined|-|
|GH_APP_VERSIONING_INSTALLATION_ID|repository|-|undefined|-|
<!-- END_COMPONENT_MD -->

## CLI Execution

The GitHub cli command can be used to execute workflows rather than using the UI.

```bash
echo '{"name":"mona", "greeting":"hello"}' | gh workflow run greet.yml --json
```

Alternatively the GitHub REST api can be used [See Documentation](https://docs.github.com/en/rest/actions/workflow-runs?apiVersion=2022-11-28)
