;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; ECOSYSTEM.scm — gungir-ssg
;;; Position in hyperpolymath ecosystem and relationship mappings

(define-module (gungir-ssg ecosystem)
  #:export (ecosystem project-graph dependency-map integration-points))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; ECOSYSTEM DEFINITION
;;;; ═══════════════════════════════════════════════════════════════════════════

(define ecosystem
  '((version . "1.0.0")
    (name . "gungir-ssg")
    (type . "satellite")
    (tier . "production")
    (purpose . "Unified SSG adapter collection for polyglot static site generation")

    (position-in-ecosystem .
      "Satellite project consuming poly-ssg-mcp adapters. Acts as the canonical
       collection of 28 SSG adapters spanning 17 programming languages. Follows
       RSR Gold guidelines and integrates with MCP protocol for AI-native tooling.")

    (what-this-is .
      ("SSG adapter collection supporting 28 static site generators"
       "MCP-compatible tool interface for AI assistants"
       "Polyglot bridge across 17 programming languages"
       "RSR Gold compliant satellite project"))

    (what-this-is-not .
      ("NOT a standalone SSG - uses poly-ssg-mcp hub"
       "NOT exempt from RSR compliance"
       "NOT a replacement for individual SSG documentation"
       "NOT responsible for SSG binary installation"))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; PROJECT GRAPH
;;;; ═══════════════════════════════════════════════════════════════════════════

(define project-graph
  '((hub
     (project
       (name . "poly-ssg-mcp")
       (url . "https://github.com/hyperpolymath/poly-ssg-mcp")
       (relationship . "hub")
       (description . "Unified MCP server for 28 SSGs - provides adapter interface")
       (sync-direction . "hub → satellite")
       (differentiation .
         "poly-ssg-mcp = Hub providing SSG adapters via MCP protocol
          gungir-ssg = Satellite consuming adapters for unified SSG operations")))

    (standard
     (project
       (name . "rhodium-standard-repositories")
       (url . "https://github.com/hyperpolymath/rhodium-standard-repositories")
       (relationship . "standard")
       (description . "RSR compliance guidelines and templates")
       (compliance-target . "Gold")))

    (siblings
     ((project
        (name . "noteg-ssg")
        (url . "https://github.com/hyperpolymath/noteg-ssg")
        (relationship . "sibling-satellite")
        (description . "Note G language SSG implementation"))
      (project
        (name . "ada-ssg")
        (url . "https://github.com/hyperpolymath/ada-ssg")
        (relationship . "sibling-satellite")
        (description . "Ada/SPARK SSG implementation"))))

    (tooling
     ((project
        (name . "mcp-sdk")
        (relationship . "dependency")
        (description . "Model Context Protocol SDK"))
      (project
        (name . "deno")
        (relationship . "runtime")
        (version . ">=1.40.0")
        (description . "Secure TypeScript/JavaScript runtime"))))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; DEPENDENCY MAP
;;;; ═══════════════════════════════════════════════════════════════════════════

(define dependency-map
  '((runtime
     ((name . "deno")
      (version . ">=1.40.0")
      (purpose . "Secure JS/TS runtime")
      (install . "asdf install deno")))

    (ssg-binaries
     ;; These are runtime dependencies installed by users
     ((rust . ("zola" "cobalt" "mdbook"))
      (haskell . ("stack" "hakyll" "ema"))
      (elixir . ("mix" "serum" "tableau"))
      (clojure . ("lein" "bb" "cryogen"))
      (julia . ("julia" "franklin" "documenter"))
      (racket . ("raco" "frog" "pollen"))
      (other . ("see adapters/README.md for full list"))))

    (dev-dependencies
     ((just . "command runner")
      (asdf . "version manager")
      (podman . "containerisation")
      (gh . "GitHub CLI")))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; INTEGRATION POINTS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define integration-points
  '((mcp-protocol
     (description . "Model Context Protocol for AI tool integration")
     (entry-point . "adapters/*.js")
     (schema . "JSON Schema tool definitions")
     (discovery . "export const tools = [...]"))

    (cli-interface
     (description . "Command-line interface via justfile")
     (entry-point . "justfile")
     (commands . ("build" "test" "lint" "fmt" "sync")))

    (ci-cd
     (description . "GitHub Actions CI/CD pipeline")
     (entry-point . ".github/workflows/")
     (triggers . ("push" "pull_request" "schedule")))

    (sync-mechanism
     (description . "Adapter synchronisation from poly-ssg-mcp")
     (command . "just sync")
     (script . "scripts/sync-adapters.sh")
     (frequency . "on-demand"))))
