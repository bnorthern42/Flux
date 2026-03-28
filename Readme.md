Here’s a tightened version of your `README.md` with your exact intent baked in—no fluff, no fake completeness:

---

# flux

A minimal GUI text editor built in Odin.

No IDE bloat. No framework hell. Just a fast, hackable editor with a real build system.

---

## Philosophy

flux follows the spirit of GNU software:

* simple tooling over complex ecosystems
* explicit over magic
* hackable over polished
* makefiles over “modern” build abstraction layers

If you can’t understand how it builds in under a minute, it’s too complicated.

---

## Current State

Very early.

Things work. Many things don’t.

There are… a lot of TODOs. You’ll see.

---

## Features (Current / Direction)

* minimal GUI editor (SDL backend)
* fast startup
* modal *inspired* editing (not a vim clone, not even close yet)
* command-style interactions planned

Most of this is still in motion.

---

## Build

Requirements:

* Odin compiler
* `make`
* SDL (depending on current backend)

### Build

```bash
make
```

### Run

```bash
make run
```

That’s it.

---

## Why Make?

Because it works.

Make is:

* ubiquitous
* transparent
* debuggable
* stable

No generators. No abstraction layers. No guessing what your build system is doing.

---

## Project Structure

TBD.

Right now it’s whatever it needs to be while things are being figured out.

---

## Roadmap

TBD.

There is direction, but nothing formal enough to pretend this is planned out.

---

## Contributing

See `CONTRIBUTING.md`.

Short version:

* keep it simple
* don’t overengineer
* don’t turn this into a framework
* also ARE YOU CRAZY. This is below Alpha, it's like negative alpha atm

---

## Non-Goals

flux is **not**:

* a full IDE
* a plugin-heavy ecosystem
* a vim clone
* a framework

---

## Notes

There are a lot of TODOs in the codebase.

Not curated. Not tracked. Just… there.

---

## Inspiration

* UNIX philosophy
* GNU tools
* vim (ideas, not replication)
* suckless (mentality)

---

## License

MIT

---
## Deps

- odin - dev-2026-03:1a5126c6b
- sdl3 - 3.4.2-1.1
- sdl3_ttf - 3.2.2-3.2
