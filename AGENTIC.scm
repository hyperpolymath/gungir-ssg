;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; AGENTIC.scm — gungir-ssg
;;; AI agent integration, MCP protocol, and autonomous operation patterns

(define-module (gungir-ssg agentic)
  #:export (mcp-integration agent-capabilities tool-discovery
            autonomous-patterns safety-constraints))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; MCP INTEGRATION
;;;; ═══════════════════════════════════════════════════════════════════════════

(define mcp-integration
  '((protocol
     ((name . "Model Context Protocol")
      (version . "1.0")
      (transport . "stdio")
      (encoding . "JSON-RPC 2.0")))

    (server-info
     ((name . "gungir-ssg")
      (version . "0.3.0")
      (capabilities . ("tools" "resources"))
      (description . "Unified SSG adapter collection for 28 static site generators")))

    (tool-interface
     ((discovery . "list_tools")
      (invocation . "call_tool")
      (schema-format . "JSON Schema draft-07")
      (response-format . "structured JSON")))

    (adapter-mapping
     ;; Each adapter exports tools array with MCP-compatible schemas
     ((pattern . "adapters/<name>.js")
      (exports . ("name" "language" "description" "connect" "disconnect" "isConnected" "tools"))
      (tool-schema
       ((name . "string")
        (description . "string")
        (inputSchema . "JSON Schema object")
        (execute . "async function")))))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; AGENT CAPABILITIES
;;;; ═══════════════════════════════════════════════════════════════════════════

(define agent-capabilities
  '((ssg-operations
     ((init . "Create new SSG project")
      (build . "Build static site")
      (serve . "Start development server")
      (clean . "Clean build artifacts")
      (check . "Validate site configuration")
      (deploy . "Deploy to hosting")))

    (adapter-management
     ((list . "List available SSG adapters")
      (connect . "Connect to specific SSG")
      (disconnect . "Disconnect from SSG")
      (status . "Check adapter connection status")))

    (meta-operations
     ((compare . "Compare SSG capabilities")
      (recommend . "Recommend SSG for use case")
      (migrate . "Assist with SSG migration")
      (diagnose . "Troubleshoot SSG issues")))

    (languages-supported
     ((rust . ("zola" "cobalt" "mdbook"))
      (haskell . ("hakyll" "ema"))
      (elixir . ("serum" "nimble-publisher" "tableau"))
      (clojure . ("cryogen" "perun" "babashka"))
      (julia . ("franklin" "documenter" "staticwebpages"))
      (racket . ("frog" "pollen"))
      (other . "See full list in META.scm language-matrix")))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; TOOL DISCOVERY
;;;; ═══════════════════════════════════════════════════════════════════════════

(define tool-discovery
  '((discovery-pattern
     ((method . "Dynamic import of adapter modules")
      (location . "adapters/*.js")
      (registration . "Automatic on server start")))

    (tool-naming-convention
     ((format . "<ssg>_<operation>")
      (examples
       ("zola_init" "zola_build" "zola_serve" "zola_check")
       ("hakyll_build" "hakyll_watch" "hakyll_clean" "hakyll_deploy")
       ("mdbook_init" "mdbook_build" "mdbook_serve" "mdbook_test"))))

    (schema-requirements
     ((type . "object")
      (properties
       ((path . "Project directory path")
        (output . "Output directory")
        (config . "Configuration options")))
      (required . "Varies per tool")))

    (response-format
     ((success . "boolean")
      (stdout . "Command output")
      (stderr . "Error output")
      (code . "Exit code")))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; AUTONOMOUS PATTERNS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define autonomous-patterns
  '((project-setup
     ((description . "Autonomous SSG project initialisation")
      (steps
       ("1. Detect user's preferred language from context")
       ("2. Recommend appropriate SSG")
       ("3. Connect to SSG adapter")
       ("4. Initialise project structure")
       ("5. Create initial content")
       ("6. Build and verify"))
      (human-approval . "Required for SSG selection")))

    (build-and-deploy
     ((description . "Autonomous build and deployment")
      (steps
       ("1. Detect project type from config files")
       ("2. Connect to appropriate adapter")
       ("3. Run build command")
       ("4. Validate output")
       ("5. Deploy to configured target"))
      (human-approval . "Required for deployment")))

    (migration-assist
     ((description . "Assisted migration between SSGs")
      (steps
       ("1. Analyse source project structure")
       ("2. Map content to target SSG format")
       ("3. Generate migration plan")
       ("4. Execute content transformation")
       ("5. Build and verify target"))
      (human-approval . "Required at each major step")))

    (troubleshooting
     ((description . "Autonomous issue diagnosis")
      (steps
       ("1. Collect error messages")
       ("2. Identify affected component")
       ("3. Check common causes from PLAYBOOK.scm")
       ("4. Suggest remediation steps")
       ("5. Optionally apply fix"))
      (human-approval . "Required for fixes")))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; SAFETY CONSTRAINTS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define safety-constraints
  '((command-execution
     ((constraint . "Array arguments only, no shell interpolation")
      (rationale . "Prevent command injection")
      (enforcement . "Deno.Command API")))

    (path-access
     ((constraint . "Validate paths are within project directory")
      (rationale . "Prevent path traversal attacks")
      (enforcement . "cwd parameter validation")))

    (credential-handling
     ((constraint . "Environment variables only, never in code")
      (rationale . "Prevent credential leakage")
      (enforcement . "Code review, secret scanning")))

    (network-access
     ((constraint . "Explicit permission required")
      (rationale . "Limit attack surface")
      (enforcement . "Deno --allow-net flag")))

    (destructive-operations
     ((constraint . "Human approval required for: deploy, clean, delete")
      (rationale . "Prevent accidental data loss")
      (enforcement . "MCP confirmation prompts")))

    (rate-limiting
     ((constraint . "Limit concurrent SSG operations")
      (rationale . "Prevent resource exhaustion")
      (enforcement . "Semaphore in MCP server")))))
