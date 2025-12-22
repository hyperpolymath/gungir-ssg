;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — gungir-ssg
;;; Architectural decisions, development practices, and design rationale

(define-module (gungir-ssg meta)
  #:export (architecture-decisions development-practices design-rationale
            component-registry language-matrix security-model))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; ARCHITECTURE DECISION RECORDS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define architecture-decisions
  '((adr-001
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "SSG adapter collection in the hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers"
                      "Multi-platform CI" "Signed commits" "Dependabot enabled")))

    (adr-002
     (title . "poly-ssg-mcp Integration")
     (status . "accepted")
     (date . "2025-12-17")
     (context . "Need unified interface for 28 SSGs across multiple languages")
     (decision . "Consume adapters from poly-ssg-mcp hub via MCP protocol")
     (consequences . ("Deno runtime" "MCP compatibility" "Consistent adapter API"
                      "Tool schema validation" "Async execution model")))

    (adr-003
     (title . "Deno Runtime Selection")
     (status . "accepted")
     (date . "2025-12-17")
     (context . "Need secure, TypeScript-native runtime for adapters")
     (decision . "Use Deno as primary runtime over Node.js")
     (consequences . ("Secure by default" "No node_modules" "Native TypeScript"
                      "Built-in tooling" "Permission model")))

    (adr-004
     (title . "Command Execution Security")
     (status . "accepted")
     (date . "2025-12-22")
     (context . "Adapters execute external SSG binaries with user-provided args")
     (decision . "Use Deno.Command with array args, never shell interpolation")
     (consequences . ("No shell injection" "Explicit permissions" "Auditable"
                      "Path validation required")))

    (adr-005
     (title . "Adapter Interface Contract")
     (status . "accepted")
     (date . "2025-12-22")
     (context . "28 adapters need consistent API for MCP integration")
     (decision . "Standard exports: name, language, description, connect, disconnect, isConnected, tools")
     (consequences . ("Uniform discovery" "Hot-reload capable" "Schema-driven tools"
                      "Lifecycle management")))

    (adr-006
     (title . "Build System: just + must")
     (status . "accepted")
     (date . "2025-12-22")
     (context . "Need cross-platform, documented build automation")
     (decision . "Use justfile for commands, Mustfile for mandatory checks")
     (consequences . ("No Makefile" "Self-documenting recipes" "Composable tasks"
                      "CI/CD integration")))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; DEVELOPMENT PRACTICES
;;;; ═══════════════════════════════════════════════════════════════════════════

(define development-practices
  '((code-style
     (languages . ("JavaScript" "TypeScript" "Deno"))
     (formatter . "deno fmt")
     (linter . "deno lint")
     (line-length . 100)
     (indent . 2)
     (quotes . "double"))

    (security
     (sast . "CodeQL")
     (credentials . "env-vars-only")
     (command-injection . "array-args-only")
     (path-traversal . "validate-cwd")
     (permissions . "explicit-deno-flags"))

    (testing
     (framework . "deno test")
     (coverage-minimum . 70)
     (e2e . "integration tests per adapter")
     (property-based . "fast-check for schemas"))

    (versioning
     (scheme . "SemVer 2.0.0")
     (changelog . "keep-a-changelog")
     (tags . "v-prefixed"))

    (documentation
     (format . "AsciiDoc")
     (api . "JSDoc + TypeDoc")
     (readme . "README.adoc")
     (examples . "required per adapter"))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; DESIGN RATIONALE
;;;; ═══════════════════════════════════════════════════════════════════════════

(define design-rationale
  '((why-rsr
     "RSR ensures consistency, security, and maintainability across all
      hyperpolymath projects. Gold tier compliance is mandatory.")

    (why-deno
     "Deno provides secure-by-default runtime with native TypeScript,
      no dependency hell, and explicit permission model for CLI tools.")

    (why-mcp
     "Model Context Protocol enables AI-native tool integration, allowing
      LLMs to discover and invoke SSG operations with schema validation.")

    (why-28-adapters
     "Polyglot SSG support enables users to leverage language-specific
      strengths: Haskell for Hakyll, Rust for Zola, Elixir for Serum, etc.")

    (why-satellite-pattern
     "Satellite consumes hub (poly-ssg-mcp) adapters, enabling independent
      versioning while maintaining upstream sync capability.")))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; COMPONENT REGISTRY (44/44 Template Mapping)
;;;; ═══════════════════════════════════════════════════════════════════════════

(define component-registry
  '((adapters
     (count . 28)
     (location . "adapters/")
     (items . ("babashka" "cobalt" "coleslaw" "cryogen" "documenter" "ema"
               "fornax" "franklin" "frog" "hakyll" "laika" "marmot" "mdbook"
               "nimble-publisher" "nimrod" "orchid" "perun" "pollen" "publish"
               "reggae" "scalatex" "serum" "staticwebpages" "tableau" "wub"
               "yocaml" "zola" "zotonic")))

    (build-system
     (justfile . "justfile")
     (mustfile . "Mustfile")
     (recipes . ("fmt" "lint" "test" "test-e2e" "check" "build" "clean"
                 "sync" "verify" "ci" "release")))

    (documentation
     (readme . "README.adoc")
     (cookbook . "cookbook.adoc")
     (security . "SECURITY.md")
     (contributing . "CONTRIBUTING.md")
     (changelog . "CHANGELOG.md"))

    (scm-files
     (meta . "META.scm")
     (ecosystem . "ECOSYSTEM.scm")
     (state . "STATE.scm")
     (playbook . "PLAYBOOK.scm")
     (agentic . "AGENTIC.scm")
     (neurosym . "NEUROSYM.scm"))

    (ci-cd
     (workflows . ".github/workflows/")
     (codeql . "codeql.yml")
     (ci . "ci.yml")
     (release . "release.yml"))

    (configuration
     (deno . "deno.json")
     (env-example . ".env.example")
     (tool-versions . ".tool-versions"))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; LANGUAGE MATRIX
;;;; ═══════════════════════════════════════════════════════════════════════════

(define language-matrix
  '((rust . ("zola" "cobalt" "mdbook"))
    (haskell . ("hakyll" "ema"))
    (elixir . ("serum" "nimble-publisher" "tableau"))
    (clojure . ("cryogen" "perun" "babashka"))
    (julia . ("franklin" "documenter" "staticwebpages"))
    (racket . ("frog" "pollen"))
    (scala . ("laika" "scalatex"))
    (common-lisp . ("coleslaw"))
    (fsharp . ("fornax"))
    (kotlin . ("orchid"))
    (swift . ("publish"))
    (nim . ("nimrod"))
    (crystal . ("marmot"))
    (ocaml . ("yocaml"))
    (d . ("reggae"))
    (tcl . ("wub"))
    (erlang . ("zotonic"))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; SECURITY MODEL
;;;; ═══════════════════════════════════════════════════════════════════════════

(define security-model
  '((threat-model
     (command-injection . "mitigated: array args, no shell")
     (path-traversal . "mitigated: cwd validation")
     (credential-leak . "mitigated: env vars only")
     (supply-chain . "mitigated: SHA-pinned, dependabot"))

    (permissions
     (deno-run . "required for SSG binaries")
     (deno-read . "required for project files")
     (deno-write . "required for output directories")
     (deno-net . "optional for dev servers"))

    (audit
     (codeql . "weekly scan")
     (dependabot . "weekly updates")
     (spdx . "all files licensed"))))
