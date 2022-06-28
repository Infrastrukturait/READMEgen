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