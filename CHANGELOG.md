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
