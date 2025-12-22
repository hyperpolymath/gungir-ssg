;;; STATE.scm — gungir-ssg
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
  '((version . "0.2.0") (updated . "2025-12-17") (project . "gungir-ssg")))

(define current-position
  '((phase . "v0.2 - SCM Security Review")
    (overall-completion . 40)
    (components
      ((rsr-compliance ((status . "complete") (completion . 100)))
       (poly-ssg-mcp-integration ((status . "complete") (completion . 100)))
       (adapters ((status . "complete") (completion . 100) (count . 28)))
       (security-review ((status . "complete") (completion . 100)))
       (documentation ((status . "in-progress") (completion . 30)))
       (testing ((status . "pending") (completion . 0)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority ())))

(define critical-next-actions
  '((immediate
      (("Add README content" . high)
       ("Create justfile for build tasks" . high)))
    (this-week
      (("Add unit tests for adapters" . medium)
       ("Set up CI pipeline" . medium)))))

(define session-history
  '((snapshots
      ((date . "2025-12-15") (session . "initial") (notes . "SCM files added"))
      ((date . "2025-12-17") (session . "security-review") (notes . "SCM files updated, security hardened, placeholders fixed")))))

(define state-summary
  '((project . "gungir-ssg") (completion . 40) (blockers . 0) (updated . "2025-12-17")))
