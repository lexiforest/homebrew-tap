Formulae for the impersonate suite.

Install on macOS or Linux (ARM64 or x86-64):

```sh
brew install lexiforest/tap/curl-impersonate
brew install lexiforest/tap/curl-cffi
```

Linux packages use the GNU/glibc builds and manylinux wheels.

Update `curl-impersonate` downloads and checksums for both operating systems:

```sh
./script/update-curl-impersonate --dry-run
./script/update-curl-impersonate
```
