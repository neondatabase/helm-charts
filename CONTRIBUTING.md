# Contributing Guidelines

Contributions are welcome via GitHub pull requests. This document outlines the process to help get your contribution accepted.

## How to Contribute

1. Fork this repository, develop, and test your changes
1. Submit a pull request

***NOTE***: In order to make testing and merging of PRs easier, please submit changes to multiple charts in separate PRs.

### Technical Requirements

* Must follow [Charts best practices](https://helm.sh/docs/topics/chart_best_practices/)
* Must pass CI jobs for linting and installing changed charts with the [chart-testing](https://github.com/helm/chart-testing) tool
* Any change to a chart requires a version bump following [semver](https://semver.org/) principles. See [Immutability](#immutability) and [Versioning](#versioning) below

Once changes have been merged, the release job will automatically run to package and release changed charts.

### Immutability

Chart releases must be immutable. Any change to a chart warrants a chart version bump even if it is only changed to the documentation.

### Versioning

The chart `version` should follow [semver](https://semver.org/).

Charts should start at `1.0.0`. Any breaking (backwards incompatible) changes to a chart should:

1. Bump the MAJOR version in the respective `Chart.yaml`
2. Generate docs using [helm-docs](https://github.com/norwoodj/helm-docs).
   NB: CI requires specific `helm-docs` version to pass, so if you generate docs with a different one it may still fail
   The easiest way to generate proper `README.md` is to run generation the same way as it's done in CI, i.e.:
   ```bash
   docker run --rm --volume "$(pwd):/helm-docs" -u "$(id -u)" jnorwood/helm-docs:v1.14.2
   ```
