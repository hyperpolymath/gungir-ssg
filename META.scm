;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — gungir-ssg

(define-module (gungir-ssg meta)
  #:export (architecture-decisions development-practices design-rationale))

(define architecture-decisions
  '((adr-001
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "SSG adapter collection in the hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers" "Multi-platform CI")))
    (adr-002
     (title . "poly-ssg-mcp Integration")
     (status . "accepted")
     (date . "2025-12-17")
     (context . "Need unified interface for 28 SSGs across multiple languages")
     (decision . "Consume adapters from poly-ssg-mcp hub via MCP protocol")
     (consequences . ("Deno runtime" "MCP compatibility" "Consistent adapter API")))))

(define development-practices
  '((code-style (languages . ("JavaScript" "Deno")) (formatter . "deno fmt") (linter . "deno lint"))
    (security (sast . "CodeQL") (credentials . "env vars only") (command-injection . "sanitise all inputs"))
    (testing (coverage-minimum . 70))
    (versioning (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-rsr "RSR ensures consistency, security, and maintainability.")
    (why-deno "Deno provides secure-by-default runtime with TypeScript support.")
    (why-mcp "MCP protocol enables AI-native tool integration.")))
