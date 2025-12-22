;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; STATE.scm — gungir-ssg
;;; Project state tracking with 44/44 component model

(define-module (gungir-ssg state)
  #:export (metadata current-position component-status blockers-and-issues
            critical-next-actions session-history state-summary))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; METADATA
;;;; ═══════════════════════════════════════════════════════════════════════════

(define metadata
  '((version . "0.3.0")
    (updated . "2025-12-22")
    (project . "gungir-ssg")
    (phase . "v0.3 - Full SCM Implementation")
    (rsr-tier . "Gold")))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; CURRENT POSITION (44/44 Component Model)
;;;; ═══════════════════════════════════════════════════════════════════════════

(define current-position
  '((phase . "v0.3 - Full SCM Implementation")
    (overall-completion . 75)
    (component-count . "34/44")))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; COMPONENT STATUS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define component-status
  '(;; ─────────────────────────────────────────────────────────────────────────
    ;; 1. ADAPTERS (28/28) ✓
    ;; ─────────────────────────────────────────────────────────────────────────
    (adapters
     ((total . 28) (complete . 28) (status . "complete"))
     (items
      ((babashka    ((status . "complete") (language . "Clojure")))
       (cobalt      ((status . "complete") (language . "Rust")))
       (coleslaw    ((status . "complete") (language . "Common Lisp")))
       (cryogen     ((status . "complete") (language . "Clojure")))
       (documenter  ((status . "complete") (language . "Julia")))
       (ema         ((status . "complete") (language . "Haskell")))
       (fornax      ((status . "complete") (language . "F#")))
       (franklin    ((status . "complete") (language . "Julia")))
       (frog        ((status . "complete") (language . "Racket")))
       (hakyll      ((status . "complete") (language . "Haskell")))
       (laika       ((status . "complete") (language . "Scala")))
       (marmot      ((status . "complete") (language . "Crystal")))
       (mdbook      ((status . "complete") (language . "Rust")))
       (nimble-publisher ((status . "complete") (language . "Elixir")))
       (nimrod      ((status . "complete") (language . "Nim")))
       (orchid      ((status . "complete") (language . "Kotlin")))
       (perun       ((status . "complete") (language . "Clojure")))
       (pollen      ((status . "complete") (language . "Racket")))
       (publish     ((status . "complete") (language . "Swift")))
       (reggae      ((status . "complete") (language . "D")))
       (scalatex    ((status . "complete") (language . "Scala")))
       (serum       ((status . "complete") (language . "Elixir")))
       (staticwebpages ((status . "complete") (language . "Julia")))
       (tableau     ((status . "complete") (language . "Elixir")))
       (wub         ((status . "complete") (language . "Tcl")))
       (yocaml      ((status . "complete") (language . "OCaml")))
       (zola        ((status . "complete") (language . "Rust")))
       (zotonic     ((status . "complete") (language . "Erlang"))))))

    ;; ─────────────────────────────────────────────────────────────────────────
    ;; 2. BUILD SYSTEM (4/4) ✓
    ;; ─────────────────────────────────────────────────────────────────────────
    (build-system
     ((total . 4) (complete . 4) (status . "complete"))
     (items
      ((justfile    ((status . "complete") (location . "justfile")))
       (mustfile    ((status . "complete") (location . "Mustfile")))
       (deno-json   ((status . "complete") (location . "deno.json")))
       (tool-versions ((status . "complete") (location . ".tool-versions"))))))

    ;; ─────────────────────────────────────────────────────────────────────────
    ;; 3. SCM FILES (6/6) ✓
    ;; ─────────────────────────────────────────────────────────────────────────
    (scm-files
     ((total . 6) (complete . 6) (status . "complete"))
     (items
      ((meta       ((status . "complete") (location . "META.scm")))
       (ecosystem  ((status . "complete") (location . "ECOSYSTEM.scm")))
       (state      ((status . "complete") (location . "STATE.scm")))
       (playbook   ((status . "complete") (location . "PLAYBOOK.scm")))
       (agentic    ((status . "complete") (location . "AGENTIC.scm")))
       (neurosym   ((status . "complete") (location . "NEUROSYM.scm"))))))

    ;; ─────────────────────────────────────────────────────────────────────────
    ;; 4. DOCUMENTATION (5/8)
    ;; ─────────────────────────────────────────────────────────────────────────
    (documentation
     ((total . 8) (complete . 5) (status . "in-progress"))
     (items
      ((readme       ((status . "pending") (location . "README.adoc")))
       (cookbook     ((status . "complete") (location . "cookbook.adoc")))
       (security     ((status . "complete") (location . "SECURITY.md")))
       (contributing ((status . "complete") (location . "CONTRIBUTING.md")))
       (changelog    ((status . "pending") (location . "CHANGELOG.md")))
       (code-of-conduct ((status . "complete") (location . "CODE_OF_CONDUCT.md")))
       (adapters-readme ((status . "complete") (location . "adapters/README.md")))
       (copilot-instructions ((status . "complete") (location . "copilot-instructions.md"))))))

    ;; ─────────────────────────────────────────────────────────────────────────
    ;; 5. CI/CD (2/4)
    ;; ─────────────────────────────────────────────────────────────────────────
    (ci-cd
     ((total . 4) (complete . 2) (status . "in-progress"))
     (items
      ((codeql     ((status . "complete") (location . ".github/workflows/codeql.yml")))
       (ci         ((status . "complete") (location . ".github/workflows/ci.yml")))
       (release    ((status . "pending") (location . ".github/workflows/release.yml")))
       (dependabot ((status . "complete") (location . ".github/dependabot.yml"))))))

    ;; ─────────────────────────────────────────────────────────────────────────
    ;; 6. TESTING (0/4)
    ;; ─────────────────────────────────────────────────────────────────────────
    (testing
     ((total . 4) (complete . 0) (status . "pending"))
     (items
      ((unit-tests   ((status . "pending") (location . "tests/")))
       (e2e-tests    ((status . "pending") (location . "tests/e2e/")))
       (schema-tests ((status . "pending") (location . "tests/schema/")))
       (coverage     ((status . "pending") (target . 70))))))

    ;; ─────────────────────────────────────────────────────────────────────────
    ;; 7. CONFIGURATION (3/3) ✓
    ;; ─────────────────────────────────────────────────────────────────────────
    (configuration
     ((total . 3) (complete . 3) (status . "complete"))
     (items
      ((deno-json     ((status . "complete") (location . "deno.json")))
       (env-example   ((status . "complete") (location . ".env.example")))
       (tool-versions ((status . "complete") (location . ".tool-versions"))))))

    ;; ─────────────────────────────────────────────────────────────────────────
    ;; 8. SECURITY (4/4) ✓
    ;; ─────────────────────────────────────────────────────────────────────────
    (security
     ((total . 4) (complete . 4) (status . "complete"))
     (items
      ((security-md  ((status . "complete") (location . "SECURITY.md")))
       (codeql       ((status . "complete") (location . ".github/workflows/codeql.yml")))
       (dependabot   ((status . "complete") (location . ".github/dependabot.yml")))
       (spdx-headers ((status . "complete") (coverage . "100%"))))))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; BLOCKERS AND ISSUES
;;;; ═══════════════════════════════════════════════════════════════════════════

(define blockers-and-issues
  '((critical ())
    (high-priority ())
    (medium-priority
     (("Add unit tests" . "testing infrastructure needed")
      ("Write README" . "documentation gap")))
    (low-priority
     (("Add changelog" . "versioning preparation")))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; CRITICAL NEXT ACTIONS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define critical-next-actions
  '((immediate
     (("Write README.adoc content" . high)
      ("Create CHANGELOG.md" . medium)))
    (this-week
     (("Add unit tests for adapters" . medium)
      ("Create release workflow" . medium)))
    (this-month
     (("Achieve 70% test coverage" . medium)
      ("E2E integration tests" . low)))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; SESSION HISTORY
;;;; ═══════════════════════════════════════════════════════════════════════════

(define session-history
  '((snapshots
     ((date . "2025-12-15")
      (session . "initial")
      (completion . 25)
      (notes . "SCM files added from template"))
     ((date . "2025-12-17")
      (session . "security-review")
      (completion . 40)
      (notes . "SCM files updated, security hardened, placeholders fixed"))
     ((date . "2025-12-22")
      (session . "full-scm-implementation")
      (completion . 75)
      (notes . "Complete SCM suite: META, ECOSYSTEM, STATE, PLAYBOOK, AGENTIC, NEUROSYM.
                Added justfile, Mustfile, cookbook.adoc, CI workflow, deno.json.")))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; STATE SUMMARY
;;;; ═══════════════════════════════════════════════════════════════════════════

(define state-summary
  '((project . "gungir-ssg")
    (version . "0.3.0")
    (completion . 75)
    (components . "34/44")
    (blockers . 0)
    (phase . "v0.3 - Full SCM Implementation")
    (updated . "2025-12-22")
    (next-milestone . "v0.4 - Testing & Documentation")))
