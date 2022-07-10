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
| references    | []      | List of references links list, generated with integer indexes from 1..n to easy manage links on context. Always predefinied link is a `[repo_url]`.          |
| deprecated    | ""      | this flag accept all content. This is no metter, if script find this flag, will add infromation about deprecation.    |
