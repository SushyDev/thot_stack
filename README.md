# thot_stack

A modern web framework stack combining **T**ailwind CSS, **H**TMX, **O**Caml, and **T**yxml for building interactive web applications.

## Stack

- **OCaml**: Functional programming language for the backend
- **Dream**: Web framework for OCaml
- **Tyxml**: Type-safe HTML generation
- **HTMX**: For dynamic, interactive UIs without JavaScript
- **Tailwind CSS**: Utility-first CSS framework
- **Vite**: Fast build tool and dev server

## Prerequisites

- OCaml 5.3
- Node.js and Yarn
- Dune build system

## Installation

1. Install dependencies:

```bash
opam install . --deps-only
npm run ci
```

## Build

```bash
npm run build
dune build
```

## Develop

Run the development server:

```bash
npm run serve
```

This will start the server with hot reloading enabled.

## Usage

After building, run the application:

```bash
dune exec thot_stack
```

The server will start on the default port (usually 8080).
