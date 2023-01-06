# codecollection-template
A hello-world-style template for codecollection authors to get started writing codebundles. This template contains the minimum file structure expected by the RunWhen platform.

## Setup
If you're under the `runwhen-contrib` organization you'll be able to use the template as-is when creating a new repo. Otherwise you'll have to clone and do some brief cleanup:

```
git clone git@github.com:runwhen-contrib/codecollection-template.git
rm -rf codecollection-template/.git
```
From this point you can rename the directory to your desired name, and push it to a remote following that solutions instructions.
eg: [GitHub Instructions](https://docs.github.com/en/get-started/importing-your-projects-to-github/importing-source-code-to-github/adding-locally-hosted-code-to-github#adding-a-local-repository-to-github-using-git)
> Note: only public GitHub repos are supported at this time, but support for other version control solutions are on the way.

### Dependencies
- pip install --user -r requirements.txt

### Python Paths
There are a few key points regarding python paths:
- `libraries` must be on the pythonpath
- `codebundles` must be on the pythonpath
- The above pythonpaths must also be included in the robot language server configuration.

> Note: While authors may wish to setup their own dev environment and manage their own dependencies, pythonpaths, etc, the RunWhen team does have a devtool image used for codecollection development that we can provide - just ask us in the public slack!
