
# README generator [![WeSupportUkraine](https://raw.githubusercontent.com/Infrastrukturait/WeSupportUkraine/main/banner.svg)](https://github.com/Infrastrukturait/WeSupportUkraine)
## About

This is a simple templating method that allows us to standardize way to create README.md in our organization.
Idea was *taken* from cloudposse and them [build-harness](https://github.com/cloudposse/build-harness).
## License

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

```text
GNU GENERAL PUBLIC LICENSE
Version 3, 29 June 2007

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
## Authors
- Rafał Masiarek | [website](https://masiarek.pl) | [email](mailto:rafal@masiarek.pl) | [github](https://github.com/rafalmasiarek)
## Variables

| Name          | ""      | Main pretty name of repository                                                                                     |
|---------------|---------|--------------------------------------------------------------------------------------------------------------------|
| repo_name     | ""      |                                                                                                                    |
| repo_url      | ""      | Url to repository                                                                                                  |
| license       | GPLv3   | License Type. Available licenses: `APACHE2`, `CC-BY-NC-SA-4.0`, `MIT`, `ISC`, `GPLv3`.                             |
| logo          | ""      | Logo from  url that will be added under name of repository in README file                                           |
| badges        | [{}]    | Array with badges will be added on the same line with name of repository in README file.                            |
| includes      | []      | List of path to extra RAW markdown files that be included                                                           |
| authors       | [{}]    | List of authors. Contributes at this moment you can add by includes block from external markdown file.              |
| context       | []      | block of text with multiple lines                                                                                  |
| deprecated    | ""      | this flag accept all content. This is no metter, if script find this flag, will add infromation about deprecation.    |
|               |         |                                                                                                                    |

## Requirements
- [gomplate](https://gomplate.ca)

## Examples
This [README.md](README.md) was generated by this script with above configuration:
```
{
  "name": "README generator",
  "repo_url": "https://github.com/InfrastrukturaIT/readmegen",
  "license": "GPLv3",
  "includes": [
    "docs/vars.md",
    "docs/requirements.md"
  ],
  "badges": [
    {
      "name": "WeSupportUkraine",
      "image": "https://raw.githubusercontent.com/Infrastrukturait/WeSupportUkraine/main/banner.svg",
      "url": "https://github.com/Infrastrukturait/WeSupportUkraine"
    }
  ],
  "authors": [
    {
      "name": "Rafał Masiarek",
      "email": "rafal@masiarek.pl",
      "github": "rafalmasiarek",
      "website": "https://masiarek.pl"
    }
  ],
  "context": [
  "## About\n",
  "This is a simple templating method that allows us to standardize way to create README.md in our organization.",
  "Idea was *taken* from cloudposse and them [build-harness](https://github.com/cloudposse/build-harness)."
  ]
}
```

