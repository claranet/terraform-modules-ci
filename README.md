# Terraform Azure modules - Generic CI

## Usage

### CI for Terraform module

This CI pipeline does the following:
* Check the Terraform files format and syntax validation
* Lint the module, eventual sub-modules and examples with [TFLint](https://github.com/terraform-linters/tflint) tool.
* Code analysis with [tfsec](https://github.com/aquasecurity/tfsec)
* Check that the `README.md` file content match the module variables, requirements and examples. 
* Validate the module for every compatible Terraform version and minimum and latest provider versions

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

#### Notes

* Ref `main` can be changed for testing purpose
