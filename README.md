# V docker action

This action compiles a V project

## Inputs

### `file` (optional)

The file to build (defaults to `.`)

### `args` (optional)

Additional arguments for the compiler

### `compiler` (optional)

Version of the V compiler to use. This can be anything you can pass to `git checkout`.  
(commit hash, tag or branch)  
Defaults to `master`

## Example usage
```yaml
uses: nzbr/vlang-action@v2
with:
  file: "program.v"
```
