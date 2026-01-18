;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 hyperpolymath
;; META.scm - Meta-level information for gungir-ssg

(meta
  (media-type "application/meta+scheme")
  (version "1.0")

  (architecture-decisions
    (adr-001
      (title "Use ReScript as primary language")
      (status "accepted")
      (date "2024-12-28")
      (context "Need a type-safe language that compiles to JavaScript for Deno runtime")
      (decision "Use ReScript for ML-family type inference with JS interop")
      (consequences
        (positive
          ("Sound type system catches errors at compile time")
          ("Excellent JS interop for ecosystem libraries")
          ("Readable compiled output"))
        (negative
          ("Smaller community than TypeScript")
          ("Learning curve for non-ML developers"))))
    (adr-002
      (title "Target Deno runtime")
      (status "accepted")
      (date "2024-12-28")
      (context "Need a JavaScript runtime for compiled ReScript output")
      (decision "Use Deno instead of Node.js per RSR language policy")
      (consequences
        (positive
          ("Built-in TypeScript/JSX support")
          ("Security-first with explicit permissions")
          ("No node_modules bloat"))
        (negative
          ("Some npm packages need compatibility layer"))))
    (adr-003
      (title "Functional content pipeline")
      (status "accepted")
      (date "2024-12-28")
      (context "Design pattern for content transformation")
      (decision "Use pure functional transformations with immutable data")
      (consequences
        (positive
          ("Predictable data flow")
          ("Easy to test and reason about")
          ("Natural fit for ReScript"))
        (negative
          ("May require more memory for large sites")))))

  (development-practices
    (code-style
      (formatter "ReScript built-in formatter")
      (naming-convention "camelCase for values, PascalCase for types/modules")
      (documentation "Doc comments on public API"))
    (testing
      (framework "ReScript test utilities")
      (coverage-target "80%")
      (test-location "test/"))
    (versioning
      (scheme "semantic")
      (changelog "CHANGELOG.adoc"))
    (documentation
      (format "AsciiDoc")
      (api-docs "generated from source")
      (examples "examples/"))
    (branching
      (strategy "trunk-based")
      (main-branch "main")
      (feature-prefix "feat/")))

  (design-rationale
    (why-rescript
      "ReScript provides the type safety of ML languages while compiling to clean, 
       readable JavaScript. Unlike TypeScript, the type system is sound - if it 
       compiles, type errors cannot occur at runtime. This makes it ideal for 
       build tools where reliability matters.")
    (why-functional
      "Static site generation is fundamentally a data transformation problem: 
       take source content, apply transformations, emit output files. Functional 
       programming with pure functions and immutable data models this naturally.")
    (why-deno
      "Deno aligns with RSR language policy (no Node/npm). It provides better 
       security defaults, native ES modules, and eliminates node_modules sprawl.
       ReScript's ES6 output works directly with Deno's module system.")))
