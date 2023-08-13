# thot_stack

- (T)ailwindcss
- (H)thmx
- (O)caml
- (T)yxml

(We leave out the rest for the purpose of funny)

## Build
```bash
yarn --frozen-lockfile
yarn build
dune build
dune exec thot_stack
```

## Develop
```bash
yarn --frozen-lockfile
yarn watch
dune exec -w thot_stack
```
