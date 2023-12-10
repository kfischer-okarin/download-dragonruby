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

## Example Workflows

### Run tests for your DragonRuby project
```yaml
name: Tests

on:
  push:

jobs:
  test:
    strategy:
      matrix:
        dr_version:
          - '5.3'
          - 'latest'
        runner:
          - windows-2022
          - macos-12
          - ubuntu-22.04
      fail-fast: false
    runs-on: ${{ matrix.runner }}
    defaults:
      run:
        shell: bash
    steps:
      - uses: actions/checkout@v4
      - uses: kfischer-okarin/download-dragonruby@v1
        with:
          version: ${{ matrix.dr_version }}
      - name: Run tests
        env:
          SDL_VIDEODRIVER: dummy
          SDL_AUDIODRIVER: dummy
        run: |
          ./dragonruby mygame --test tests.rb | tee tests.log
          grep '\[Game\] 0 test(s) failed.' tests.log
```
