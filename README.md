github surface audit.

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
