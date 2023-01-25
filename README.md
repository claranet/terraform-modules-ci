# Terraform Azure Generic CI

## Usage

### CI for Terraform module

This CI pipeline does the following:
* Check the Terraform files format
* Lint the module, eventual sub-modules and examples with [TFLint](https://github.com/terraform-linters/tflint) tool.
* Check that the `README.md` file content match the module variables, requirements and examples. 
* Validate the module for every compatible Terraform version and minimum and latest provider versions

In the remote project, specify the minimum Terraform and provider versions in order to test them along with the next 
versions. You can do this by adding this in the `.github/variables/versions.env` file:

```bash
TF_MIN_VERSION=X.XX
TF_MAX_VERSION=X.XX
AZURERM_PROVIDER_MIN_VERSION=X.XX
```

### CI for Terraform projects

In the remote project add this in `.github/variables/workflows/github-ci.yml`:

```yaml
---
name: CI
on: [push]
jobs:
  ci:
    uses: claranet/terraform-modules-ci/.github/workflows/ci-modules.yaml@main
...
```

This will trigger `terraform fmt` and `terraform validate` on every stack found by the Claranet `tfwrapper` with its `foreach` command.

#### Notes

* Ref `main` can be changed for testing purpose
