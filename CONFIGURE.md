# Configuration

Aspelllint offers multiple ways to resolve preferences:

1. Command-line flags (`aspelllint -i`)
2. Dotfiles (`.aspelllintignore`)
3. Built-in defaults (`DEFAULT_IGNORES`)

Any command-line flags that are present override the same settings in dotfiles and built-in defaults.

# Command-line flags

Run `aspelllint -h` or `aspelllint --help` for a full list, or refer to the source code for `bin/aspelllint`.

```
$ aspelllint -h
Usage: aspelllint [options] [<files>]
    -i, --ignore pattern             Ignore file pattern (fnmatch)
    -h, --help                       Print usage info
    -v, --version                    Print version info
```

# Dotfiles

Aspelllint automatically applies any `.aspelllintignore` configuration files in the same directory as a file being scanned, or a parent directory (`../.aspelllintignore`), up to `$HOME/.aspelllintignore`, if any such files exist.

## `.aspelllintignore`

Samples:

* [examples/.aspelllintignore](https://github.com/mcandre/aspelllint/blob/master/examples/.aspelllintignore)

An `.aspelllintignore` may contain fnmatch patterns of files and/or folders to exclude from scanning, one pattern per line.
