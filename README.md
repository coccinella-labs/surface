<p align="center">
  <img src="https://raw.githubusercontent.com/Coccinella-Labs/surface/main/.github/assets/thumbnail.png" alt="surface" width="100%">
</p>

rule:

- lowercase fragments
- no emoji
- no brackets
- no slogans
- no title-case marketing
- period at the end
- sparse active pins

run:

```sh
scripts/audit-github-surface.sh harpertoken
scripts/audit-github-surface.sh bniladridas
```
