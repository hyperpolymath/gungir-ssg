;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — gungir-ssg

(ecosystem
  (version "1.0.0")
  (name "gungir-ssg")
  (type "satellite")
  (purpose "Unified SSG adapter collection for polyglot static site generation")

  (position-in-ecosystem
    "Satellite project consuming poly-ssg-mcp adapters. Follows RSR guidelines.")

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (description "Unified MCP server for 28 SSGs - provides adapter interface")
      (differentiation
        "poly-ssg-mcp = Hub providing SSG adapters via MCP protocol
         gungir-ssg = Satellite consuming adapters for unified SSG operations"))
    (project (name "rhodium-standard-repositories")
             (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
             (relationship "standard")))

  (what-this-is "SSG adapter collection supporting 28 static site generators across 15+ languages")
  (what-this-is-not "- NOT a standalone SSG - uses poly-ssg-mcp hub
                     - NOT exempt from RSR compliance"))
