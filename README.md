# OpenTofu Azure modules - Generic CI

## Usage

### CI for OpenTofu module

This CI pipeline does the following:

* Check the OpenTofu files format and syntax validation
* Lint the module, eventual sub-modules and examples with [TFLint](https://github.com/terraform-linters/tflint)
* Check that the `README.md` file content matches the module variables, requirements and examples (via [terraform-docs](https://github.com/terraform-docs/terraform-docs))
* Validate the module examples with OpenTofu and TFLint

In the remote project add this in `.github/workflows/github-ci.yml`:

```yaml
---
name: CI
on: [push]
jobs:
  ci:
    uses: claranet/terraform-modules-ci/.github/workflows/ci-modules.yaml@{latest-tag-sha-full-hash}
...
```

### Tool versions

| Tool | Version |
|------|---------|
| [OpenTofu](https://opentofu.org/) | `1.11.5` |
| [TFLint](https://github.com/terraform-linters/tflint) | `v0.52.0` |
| [terraform-docs](https://github.com/terraform-docs/terraform-docs) | `0.21.0` |
