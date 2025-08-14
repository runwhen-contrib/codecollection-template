<p align="center">
  <a href="https://runwhen.slack.com/join/shared_invite/zt-1l7t3tdzl-IzB8gXDsWtHkT8C5nufm2A">
    <img src="https://img.shields.io/badge/Join%20Slack-%23E01563.svg?&style=for-the-badge&logo=slack&logoColor=white" alt="Join Slack">
  </a>
</p>
<a href='https://codespaces.new/runwhen-contrib/codecollection-template?quickstart=1'><img src='https://github.com/codespaces/badge.svg' alt='Open in GitHub Codespaces' style='max-width: 100%;'></a>


# codecollection-template
A hello-world-style template for codecollection authors to get started writing codebundles. This template contains the minimum file structure expected by the RunWhen platform.

[![Build](https://github.com/runwhen-contrib/codecollection-template/actions/workflows/build.yaml/badge.svg)](https://github.com/runwhen-contrib/codecollection-template/actions/workflows/build.yaml)

# Before you start

## Setup a docker container to run the CC
run the following commands on your bash shell
```bash
gcloud config set project runwhen-nonprod-shared
gcloud auth configure-docker us-docker.pkg.dev

# remember to add the platform flag to the base image in Dockerfile if already not done so: `FROM --platform=linux/amd64 us-docker.pkg.dev.....`

# build command
docker buildx build --platform=linux/amd64 -t rw_cli:latest --load . 
# replace "rw_cli" and "latest" with your desired image name and tag

# run the container
docker run --platform=linux/amd64 --name rw_cli_container -it rw_cli:latest 
# replace "rw_cli","latest" and "rw_cli_container" with your 
# desired image name,tag and container name respectively
```

## Getting Started
Looking to be a contributor for CodeCollections or start your own? We'd love to collaborate! Head on over to our [public docs](https://docs.runwhen.com/public/v/runwhen-authors/codecollection-development/getting-started/running-your-first-codebundle) to get started.

File Structure overview of devcontainer:
```
-/app/
    |- auth/ #store secrets here, it should already be properly gitignored for you
    |- codecollection/
    |   |- codebundles/ # stores codebundles that can be run
    |   |- libraries/ # stores python keyword libraries used by codebundles
    |- dev_facade/ # provides interfaces equivalent to those used on the platform, but just dry runs the keywords to assist with development
    ...
```

The included script `ro` wraps the `robot` RobotFramework binary, and includes some extra functionality to write logs to a consistent location for viewing in a HTTP server at http://localhost:3000/ that is always running as part of the devcontainer.

### Quickstart

Navigate to the codebundle directory
`cd codecollection/codebundles/hello_world/`

Run the codebundle
`ro sli.robot`

## Print Debugging
- print statements inside libraries imported in your `.robot` files won't work.
  - unless you run the `ro` or `robot` command with `--loglevel TRACE`
  - a better alternative: instead of `print("content to print")`, use:
  ```python
  from robot.libraries.BuiltIn import BuiltIn
  ...
  
  BuiltIn.log_to_console("content to print")
  ```