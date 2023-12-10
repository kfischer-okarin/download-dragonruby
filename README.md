# Download DragonRuby

An action for downloading binaries (and if necessary C headers) of the
[DragonRuby Game Toolkit](https://dragonruby.org/toolkit/game) to run tests and/or build C Extensions.

## Usage

See [action.yml](action.yml)

```yaml
steps:
- uses: kfischer-okarin/download-dragonruby@v1
  with:
    # Version to download.
    # See https://github.com/kfischer-okarin/dragonruby-for-ci/releases for available versions.
    # Possible values:
    # - Specific version like '5.11'
    # - 'latest' for latest version
    version: 'latest'

    # Which license tier to download.
    # Pro version also includes C headers.
    # Possible values:
    # - 'standard'
    # - 'pro'
    license_tier: 'standard'
```
