<p align="center">
  <a href="https://discord.gg/Ut7Ws4rm8Q">
    <img src="https://img.shields.io/discord/1131539039665791077?label=Join%20Discord&logo=discord&logoColor=white&style=for-the-badge" alt="Join Discord">
  </a>
  <a href="https://runwhen.slack.com/join/shared_invite/zt-1l7t3tdzl-IzB8gXDsWtHkT8C5nufm2A">
    <img src="https://img.shields.io/badge/Join%20Slack-%23E01563.svg?&style=for-the-badge&logo=slack&logoColor=white" alt="Join Slack">
  </a>
</p>
<a href='https://codespaces.new/runwhen-contrib/codecollection-template?quickstart=1'><img src='https://github.com/codespaces/badge.svg' alt='Open in GitHub Codespaces' style='max-width: 100%;'></a>


# codecollection-template
A hello-world-style template for codecollection authors to get started writing codebundles. This template contains the minimum file structure expected by the RunWhen platform.

[![Build](https://github.com/runwhen-contrib/codecollection-template/actions/workflows/build.yaml/badge.svg)](https://github.com/runwhen-contrib/codecollection-template/actions/workflows/build.yaml)

## Getting Started
Looking to be a contributor for CodeCollections or start your own? We'd love to collaborate! Head on over to our [public docs](https://docs.runwhen.com/public/runwhen-authors/getting-started-with-codecollection-development) to get started.

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
