# READMEgen





[![Release](https://img.shields.io/github/v/release/Infrastrukturait/READMEgen)](https://github.com/Infrastrukturait/READMEgen/releases)












## About

READMEgen is a small README generation standard based on `gomplate`.

It provides a reusable `README.md.template`, a simple `readmegen` CLI helper, and a GitHub Actions workflow for keeping generated README files up to date across repositories.



## Features

- Standardized README generation
- JSON and YAML configuration support
- Optional markdown includes
- Built-in license sections
- Local and remote template support
- CLI helper for local usage, hooks, and CI
- Reusable GitHub Actions workflow for scheduled README regeneration







## License


[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

```text
GNU GENERAL PUBLIC LICENSE
Version 3, 29 June 2007

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or at your option
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY.

Source: https://opensource.org/license/gpl-3-0/
```









## Authors


- Rafał Masiarek | [website](https://masiarek.pl) | [email](mailto:rafal@masiarek.pl) | [github](https://github.com/rafalmasiarek)









## Usage

READMEgen can be used directly with `gomplate` or through the `readmegen` CLI helper.

## Using gomplate directly

Generate `README.md` from a JSON config:

```bash
curl -fsSL https://raw.githubusercontent.com/Infrastrukturait/READMEgen/main/README.md.template \
  | gomplate -d config=./README.json > README.md
```

Generate `README.md` from a YAML config:

```bash
curl -fsSL https://raw.githubusercontent.com/Infrastrukturait/READMEgen/main/README.md.template \
  | gomplate -d config=./README.yaml > README.md
```

Use a pinned template release:

```bash
curl -fsSL https://raw.githubusercontent.com/Infrastrukturait/READMEgen/v1.0.0/README.md.template \
  | gomplate -d config=./README.yaml > README.md
```

Use a local template file:

```bash
gomplate \
  -d config=./README.yaml \
  -f ./README.md.template \
  -o README.md
```

## Using readmegen CLI

Generate `README.md` from the first existing config file:

1. `README.yaml`
2. `README.yml`
3. `README.json`

```bash
readmegen
```

Use a specific config file:

```bash
readmegen --config README.json
```

Use a specific output file:

```bash
readmegen --output docs/README.md
```

Use a pinned template release:

```bash
readmegen --version v1.0.0
```

Use a local template file:

```bash
readmegen --template ./README.md.template
```

Use a custom remote template URL:

```bash
readmegen --template-url https://raw.githubusercontent.com/Infrastrukturait/READMEgen/main/README.md.template
```

Check whether the generated README is up to date:

```bash
readmegen --check
```

## Example Makefile

```makefile
READMEGEN_VERSION ?= main
READMEGEN_CONFIG ?=
READMEGEN_OUTPUT ?= README.md

.PHONY: readme
readme:
	readmegen \
		$(if $(READMEGEN_CONFIG),--config $(READMEGEN_CONFIG),) \
		--output $(READMEGEN_OUTPUT) \
		--version $(READMEGEN_VERSION)

.PHONY: check-readme
check-readme:
	readmegen \
		$(if $(READMEGEN_CONFIG),--config $(READMEGEN_CONFIG),) \
		--output $(READMEGEN_OUTPUT) \
		--version $(READMEGEN_VERSION) \
		--check
```

Examples:

```bash
make readme
make readme READMEGEN_CONFIG=README.yaml
make readme READMEGEN_VERSION=v1.0.0
make check-readme
```





## Requirements

READMEgen requires:

- [`gomplate`](https://gomplate.ca)
- `curl`, when using a remote template URL
- `bash`, when using the `readmegen` CLI helper

## Optional tools

The following tools are optional:

- `make`, when using the example `Makefile`
- GitHub Actions, when using the scheduled README generation workflow

## Installation

Install `gomplate` using the method preferred for your system.

Example for Linux:

```bash
GOMPLATE_VERSION="v4.3.3"

curl -fsSL \
  "https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64" \
  -o /usr/local/bin/gomplate

chmod +x /usr/local/bin/gomplate

gomplate --version
```

## READMEgen CLI

The `readmegen` CLI helper is optional. It wraps `curl` and `gomplate` and adds:

- automatic config file detection,
- YAML support,
- custom output file support,
- local or remote template support,
- check mode for CI and hooks.

Install the CLI from a release:

```bash
CLI_VERSION="cli-v1.1.0"

curl -fsSLO "https://github.com/Infrastrukturait/READMEgen/releases/download/${CLI_VERSION}/readmegen-cli"
curl -fsSLO "https://github.com/Infrastrukturait/READMEgen/releases/download/${CLI_VERSION}/readmegen-cli.md5"

md5sum -c readmegen-cli.md5

sudo install -m 0755 readmegen-cli /usr/local/bin/readmegen

rm -f readmegen-cli readmegen-cli.md5

readmegen --help
```





## Configuration

READMEgen reads configuration from one of the following files:

1. `README.yaml`
2. `README.yml`
3. `README.json`

When using `gomplate` directly, pass the selected file as the `config` datasource:

```bash
gomplate -d config=./README.yaml -f README.md.template -o README.md
```

When using the `readmegen` CLI, the config file is detected automatically unless `--config` is provided.

## Variables

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string | `""` | Main repository or project name displayed as the README title. |
| `repo_url` | string | `""` | Repository URL. Used to generate the predefined `[repo_link]` reference. |
| `license` | string | `""` | License identifier. Supported values: `APACHE2`, `Apache-2.0`, `MIT`, `ISC`, `GPLv3`, `GPL-3.0`. |
| `logo` | string | `""` | Optional logo URL or path displayed below the title and badges. |
| `badges` | array | `[]` | List of badges displayed below the title. |
| `context` | array | `[]` | List of markdown blocks rendered before the license section. |
| `authors` | array | `[]` | List of project authors or maintainers. |
| `includes` | array | `[]` | List of raw markdown files to append to the README. |
| `references` | array | `[]` | List of reference links generated as `[1]`, `[2]`, etc. |
| `deprecated` | object | unset | Marks the repository as deprecated. Can contain a custom `notice`. |

## License values

Supported license values:

```text
APACHE2
Apache-2.0
MIT
ISC
GPLv3
GPL-3.0
```

The template renders a short license notice, keeps the `Source:` URL, and links to the first existing license file in this order:

1. `LICENSE.md`
2. `LICENSE`

## Badges

Example:

```yaml
badges:
  - name: Build
    image: https://github.com/example/project/actions/workflows/test.yml/badge.svg
    url: https://github.com/example/project/actions/workflows/test.yml
```

Without a URL:

```yaml
badges:
  - name: Status
    image: https://img.shields.io/badge/status-active-brightgreen
```

## Authors

Example:

```yaml
authors:
  - name: Rafał Masiarek
    email: rafal@example.com
    github: rafalmasiarek
    website: https://example.com
```

Rendered as:

```markdown
- Rafał Masiarek | [website](https://example.com) | [email](mailto:rafal@example.com) | [github](https://github.com/rafalmasiarek)
```

## Context

`context` is an array of markdown blocks rendered before the license section.

Example:

```yaml
context:
  - |
    ## About

    This project standardizes README generation across repositories.

  - |
    ## Features

    - Markdown template rendering
    - JSON and YAML config support
    - Optional includes
```

## Includes

`includes` appends raw markdown files to the generated README.

Example:

```yaml
includes:
  - docs/terraform.md
  - docs/contributors.md
```

This is useful for generated documentation from other tools, such as Terraform docs or contributors lists.

## References

`references` generates numbered markdown references.

Example:

```yaml
references:
  - https://cloudposse.com
  - https://github.com/cloudposse/build-harness
```

Rendered as:

```markdown
[1]: https://cloudposse.com
[2]: https://github.com/cloudposse/build-harness
```

The following reference is always generated:

```markdown
[repo_link]: <repo_url>
```

## Deprecated repositories

Default deprecation notice:

```yaml
deprecated: {}
```

Custom deprecation notice:

```yaml
deprecated:
  notice: |
    ### **THIS REPOSITORY IS NO LONGER MAINTAINED**

    This project has been replaced by another repository.
```

## Full YAML example

```yaml
name: READMEgen
repo_url: https://github.com/Infrastrukturait/READMEgen
license: GPL-3.0

badges:
  - name: Release
    image: https://img.shields.io/github/v/release/Infrastrukturait/READMEgen
    url: https://github.com/Infrastrukturait/READMEgen/releases

context:
  - |
    ## About

    READMEgen is a simple templating method for standardizing README files.

includes:
  - docs/usage.md
  - docs/requirements.md

authors:
  - name: Rafał Masiarek
    github: rafalmasiarek
    website: https://masiarek.pl

references:
  - https://gomplate.ca
```

## Full JSON example

```json
{
  "name": "READMEgen",
  "repo_url": "https://github.com/Infrastrukturait/READMEgen",
  "license": "GPL-3.0",
  "badges": [
    {
      "name": "Release",
      "image": "https://img.shields.io/github/v/release/Infrastrukturait/READMEgen",
      "url": "https://github.com/Infrastrukturait/READMEgen/releases"
    }
  ],
  "context": [
    "## About\n\nREADMEgen is a simple templating method for standardizing README files."
  ],
  "includes": [
    "docs/usage.md",
    "docs/requirements.md"
  ],
  "authors": [
    {
      "name": "Rafał Masiarek",
      "github": "rafalmasiarek",
      "website": "https://masiarek.pl"
    }
  ],
  "references": [
    "https://gomplate.ca"
  ]
}
```









<!-- references -->

[repo_link]: https://github.com/Infrastrukturait/READMEgen


[1]: https://gomplate.ca

[2]: https://github.com/hairyhenderson/gomplate

[3]: https://github.com/Infrastrukturait/READMEgen/releases


