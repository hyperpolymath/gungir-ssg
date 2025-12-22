;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; PLAYBOOK.scm — gungir-ssg
;;; Operational playbook for development, deployment, and maintenance

(define-module (gungir-ssg playbook)
  #:export (operations runbooks incident-response release-process
            maintenance-tasks troubleshooting))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; OPERATIONS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define operations
  '((daily
     ((name . "dependency-check")
      (command . "just check-deps")
      (frequency . "daily via dependabot")
      (automated . #t)))

    (weekly
     ((name . "security-scan")
      (command . "CodeQL via GitHub Actions")
      (frequency . "weekly on Sunday")
      (automated . #t))
     ((name . "adapter-sync-check")
      (command . "just sync --dry-run")
      (frequency . "weekly")
      (automated . #f)))

    (on-commit
     ((name . "lint")
      (command . "just lint")
      (hook . "pre-commit"))
     ((name . "format-check")
      (command . "just fmt --check")
      (hook . "pre-commit"))
     ((name . "test")
      (command . "just test")
      (hook . "pre-push")))

    (on-release
     ((name . "full-test-suite")
      (command . "just test-all"))
     ((name . "version-bump")
      (command . "just version <major|minor|patch>"))
     ((name . "changelog-update")
      (command . "just changelog"))
     ((name . "tag-and-push")
      (command . "just release")))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; RUNBOOKS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define runbooks
  '((add-new-adapter
     ((description . "Add a new SSG adapter to the collection")
      (steps
       ("1. Create adapters/<name>.js following adapter template")
       ("2. Add SPDX header with MIT licence")
       ("3. Export: name, language, description, connect, disconnect, isConnected, tools")
       ("4. Define tool schemas with JSON Schema")
       ("5. Add to adapters/README.md table")
       ("6. Update META.scm language-matrix")
       ("7. Add unit tests in tests/<name>.test.js")
       ("8. Run: just test")
       ("9. Update STATE.scm adapter count"))
      (validation . "just verify-adapter <name>")))

    (sync-from-hub
     ((description . "Synchronise adapters from poly-ssg-mcp hub")
      (steps
       ("1. Ensure clean working directory: git status")
       ("2. Run sync: just sync")
       ("3. Review changes: git diff adapters/")
       ("4. Run tests: just test")
       ("5. Commit: git commit -m 'chore: sync adapters from poly-ssg-mcp'"))
      (frequency . "As needed when hub updates")))

    (update-dependencies
     ((description . "Update runtime and dev dependencies")
      (steps
       ("1. Review dependabot PRs")
       ("2. For each PR: review changelog, run tests")
       ("3. Merge if tests pass")
       ("4. Update .tool-versions if runtime versions change")
       ("5. Update deno.json if Deno deps change"))
      (automated . "dependabot creates PRs")))

    (release-new-version
     ((description . "Release a new version of gungir-ssg")
      (steps
       ("1. Ensure main branch is clean and up-to-date")
       ("2. Run full test suite: just test-all")
       ("3. Update CHANGELOG.md with changes")
       ("4. Bump version: just version <type>")
       ("5. Create release commit: git commit -m 'chore(release): v<version>'")
       ("6. Tag release: git tag v<version>")
       ("7. Push with tags: git push --tags")
       ("8. GitHub Actions will create release"))
      (validation . "just pre-release-check")))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; INCIDENT RESPONSE
;;;; ═══════════════════════════════════════════════════════════════════════════

(define incident-response
  '((security-vulnerability
     ((severity . "critical")
      (response-time . "24 hours")
      (steps
       ("1. Acknowledge report via GitHub Security Advisory")
       ("2. Assess severity using CVSS 3.1")
       ("3. Develop fix in private branch")
       ("4. Prepare security advisory draft")
       ("5. Release patch version")
       ("6. Publish advisory and notify users")
       ("7. Post-incident review"))
      (escalation . "hyperpolymath security team")))

    (adapter-breakage
     ((severity . "high")
      (response-time . "48 hours")
      (steps
       ("1. Identify affected adapter(s)")
       ("2. Check if upstream SSG changed API")
       ("3. Update adapter to match new API")
       ("4. Add regression test")
       ("5. Release patch version"))
      (mitigation . "Disable affected adapter temporarily")))

    (ci-cd-failure
     ((severity . "medium")
      (response-time . "72 hours")
      (steps
       ("1. Check GitHub Actions logs")
       ("2. Identify failing step")
       ("3. Reproduce locally: just ci")
       ("4. Fix issue")
       ("5. Re-run workflow"))
      (common-causes . ("SHA pin outdated" "Deno version mismatch" "Test flakiness"))))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; RELEASE PROCESS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define release-process
  '((versioning
     ((scheme . "SemVer 2.0.0")
      (major . "Breaking API changes")
      (minor . "New adapters or features")
      (patch . "Bug fixes and security patches")))

    (checklist
     ((pre-release
       ("[ ] All tests pass: just test-all"
        "[ ] Linting clean: just lint"
        "[ ] Format clean: just fmt --check"
        "[ ] CHANGELOG.md updated"
        "[ ] STATE.scm version bumped"
        "[ ] No uncommitted changes"))
      (release
       ("[ ] Tag created: git tag v<version>"
        "[ ] Pushed to origin: git push --tags"
        "[ ] GitHub release created"
        "[ ] Security advisory (if applicable)"))
      (post-release
       ("[ ] Announce in discussions"
        "[ ] Update documentation links"
        "[ ] Monitor for issues"))))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; MAINTENANCE TASKS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define maintenance-tasks
  '((dependency-updates
     ((frequency . "weekly")
      (tool . "dependabot")
      (action . "Review and merge PRs")))

    (security-scanning
     ((frequency . "weekly")
      (tool . "CodeQL")
      (action . "Review findings in Security tab")))

    (adapter-health-check
     ((frequency . "monthly")
      (command . "just health-check")
      (action . "Verify all adapters can connect to their SSG binaries")))

    (documentation-review
     ((frequency . "quarterly")
      (action . "Review README, cookbook, and adapter docs for accuracy")))

    (rsr-compliance-audit
     ((frequency . "quarterly")
      (checklist
       ("SPDX headers present"
        "SHA-pinned actions"
        "Signed commits"
        "Security policy current"
        "Dependabot enabled"))))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; TROUBLESHOOTING
;;;; ═══════════════════════════════════════════════════════════════════════════

(define troubleshooting
  '((adapter-connection-failed
     ((symptom . "connect() returns false")
      (causes
       ("SSG binary not installed"
        "Binary not in PATH"
        "Wrong binary version"))
      (diagnosis
       ("Check: which <binary>"
        "Check: <binary> --version"
        "Check: Deno permissions"))
      (solution . "Install SSG and ensure binary is in PATH")))

    (deno-permission-denied
     ((symptom . "PermissionDenied error")
      (causes . ("Missing --allow-run flag" "Missing --allow-read flag"))
      (diagnosis . "Check Deno command flags")
      (solution . "Add required --allow-* flags or use deno.json")))

    (test-failures
     ((symptom . "just test fails")
      (causes
       ("Missing test fixtures"
        "Deno version mismatch"
        "Adapter API changed"))
      (diagnosis
       ("Run: deno test --filter <test-name>"
        "Check: .tool-versions for correct Deno version"))
      (solution . "Update tests or fix adapter implementation")))

    (ci-workflow-timeout
     ((symptom . "GitHub Actions job times out")
      (causes . ("E2E tests too slow" "Network issues" "Resource limits"))
      (diagnosis . "Check workflow logs for last successful step")
      (solution . "Optimise tests or increase timeout")))))
