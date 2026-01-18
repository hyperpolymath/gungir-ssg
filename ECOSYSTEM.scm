;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 hyperpolymath
;; ECOSYSTEM.scm - Project ecosystem positioning for gungir-ssg

(ecosystem
  (version "1.0")
  (name "gungir-ssg")
  (type "ssg-engine")
  (purpose "Type-safe static site generation using ReScript and ML-family type inference")

  (position-in-ecosystem
    (role "satellite")
    (hub "poly-ssg-mcp")
    (category "functional-typed-ssgs")
    (uniqueness "ReScript's ML-type system with JavaScript ecosystem access"))

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (relationship "hub")
      (description "Central MCP orchestrator for all SSG engines")
      (integration "Provides gungir adapter for unified SSG access"))
    (project
      (name "rescribe-ssg")
      (relationship "sibling")
      (description "Another ReScript SSG with different architecture")
      (shared-aspects ("ReScript" "Deno runtime" "type-safe templates")))
    (project
      (name "sparkle-ssg")
      (relationship "sibling")
      (description "Gleam-based SSG")
      (shared-aspects ("functional paradigm" "type safety" "BEAM ecosystem alternative")))
    (project
      (name "anvil-ssg")
      (relationship "sibling")
      (description "Rust-based SSG")
      (shared-aspects ("strong typing" "performance focus")))
    (project
      (name "casket-ssg")
      (relationship "sibling")
      (description "Crystal-based SSG")
      (shared-aspects ("Ruby-like syntax" "compiled performance"))))

  (what-this-is
    ("A static site generator written in ReScript")
    ("Part of the poly-ssg ecosystem of language-diverse SSGs")
    ("Demonstrates ML-family type inference in web tooling")
    ("MCP-compatible for AI-assisted site generation")
    ("Compiles to JavaScript, runs on Deno"))

  (what-this-is-not
    ("Not a general-purpose web framework")
    ("Not a CMS with database backend")
    ("Not a JavaScript/TypeScript SSG")
    ("Not tied to Node.js ecosystem")))
