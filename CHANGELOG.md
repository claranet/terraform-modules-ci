# v1.2.0 - 2026-08-20

Added
  * Add modules `v9.x.x` row (OpenTofu `1.12.x`, AzureRM `>= 5.0`) to the `terraform-docs` versioning table
  * Verify the TFLint AzureRM ruleset signature via PGP instead of GitHub attestation

Changed
  * Align tool versions with the GitLab CI repository for modules v9: OpenTofu `1.12.5`, terraform-docs `0.24.0`, TFLint `0.64.0`
  * Bump the `terraform-docs` container image to `0.24.0-amd64` in the documentation workflow
  * Use `prek` as git hooks runner instead of `pre-commit`, aligned with the GitLab CI repository
  * Align `.pre-commit-config.yaml` with the GitLab CI repository (`default_install_hook_types`, explicit hook
    stages, `--maxkb=15000` for `check-added-large-files`)

Fixed
  * Drop the leftover Alpine `apk` calls from the `lint` and `examples` jobs, which have been running directly
    on `ubuntu-latest` since the move to `mise` and were failing on the missing `apk` command

# v1.1.0 - 2026-03-25

Added
  * Use `mise` to install and manage OpenTofu and TFLint instead of curl/setup actions
  * Use `mise` for `fmt` and `validate` steps
  * Bump OpenTofu to v1.11 in CI examples check
  * Add `committed` config for conventional commit enforcement
  * Add mise `tools-versions` config

Changed
  * Drop legacy `tfsec` security tool
  * Drop TFLint setup-action in favor of mise
  * Use SHA commits for actions instead of tags for improved security
  * Update TFLint rules configuration
  * Bump TFDocs action version (v0.19)
  * Bump mise tools versions
  * Upgrade pre-commit hooks

Fixed
  * Use full commit hash for action references
  * Fix CI example script and config
  * Use `call_module_type` instead of deprecated `module` attribute in TFLint config

# v1.0.2 - 2023-12-15

Fixed
  * AZ-1290: Fix TF_MAX_VERSION export to env var GITHUB_ENV
  * AZ-1290: Fix TF version for examples task

# v1.0.1 - 2023-12-05

Fixed
  * AZ-1290: Fix TF docker image version to `< 1.6`

# v1.0.0 - 2023-02-20

Added
  * AZ-986: First release, Github actions CI
