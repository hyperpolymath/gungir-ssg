;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; NEUROSYM.scm — gungir-ssg
;;; Neurosymbolic patterns for hybrid AI-symbolic computation

(define-module (gungir-ssg neurosym)
  #:export (symbolic-representations neural-interfaces hybrid-patterns
            reasoning-chains knowledge-graph))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; SYMBOLIC REPRESENTATIONS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define symbolic-representations
  '((ssg-ontology
     ;; Formal ontology of static site generator concepts
     ((entity . "SSG")
      (properties
       ((name . string)
        (language . programming-language)
        (paradigm . (functional imperative hybrid))
        (templating . (liquid jinja mustache custom))
        (content-format . (markdown asciidoc restructuredtext org))
        (build-output . (html css js assets))))
      (relations
       ((uses-language . programming-language)
        (supports-format . content-format)
        (produces . build-output)
        (requires-runtime . runtime-environment))))

    (adapter-ontology
     ((entity . "Adapter")
      (properties
       ((name . string)
        (target-ssg . SSG)
        (tools . (list tool))
        (connection-state . (connected disconnected))))
      (operations
       ((connect . (-> adapter boolean))
        (disconnect . (-> adapter void))
        (execute-tool . (-> adapter tool-name args result))))))

    (project-ontology
     ((entity . "Project")
      (properties
       ((path . filesystem-path)
        (ssg . SSG)
        (config . configuration)
        (content . (list content-item))
        (output . (optional build-output))))))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; NEURAL INTERFACES
;;;; ═══════════════════════════════════════════════════════════════════════════

(define neural-interfaces
  '((natural-language-to-tool
     ;; Map natural language intents to tool invocations
     ((input . "Build my Zola site with drafts included")
      (parsed
       ((intent . "build")
        (ssg . "zola")
        (options . ((drafts . #t)))))
      (tool-call
       ((name . "zola_build")
        (args . ((drafts . #t)))))))

    (error-interpretation
     ;; Neural interpretation of SSG error messages
     ((input . "error: Failed to build site\n  --> content/post.md:5:1\n  |\n5 | {{ undefined_variable }}\n  | ^^^^^^^^^^^^^^^^^^^^^^^ undefined variable")
      (interpretation
       ((error-type . "template-variable-undefined")
        (location . "content/post.md:5:1")
        (cause . "Variable 'undefined_variable' not defined in context")
        (suggestion . "Define variable in front matter or config")))))

    (ssg-recommendation
     ;; Neural-assisted SSG selection
     ((input . "I want a fast site generator with good Markdown support and syntax highlighting")
      (analysis
       ((requirements
         ((speed . high)
          (markdown . required)
          (syntax-highlighting . required)))
        (recommendations
         ((primary . "zola")
          (rationale . "Rust-based, fast, built-in syntax highlighting")
          (alternatives . ("mdbook" "hakyll" "cobalt")))))))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; HYBRID PATTERNS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define hybrid-patterns
  '((symbolic-grounding
     ;; Ground neural outputs in symbolic knowledge
     ((pattern . "validate-tool-call")
      (neural-output . ((tool . "zola_build") (args . ((drafts . "yes")))))
      (symbolic-validation
       ((schema-check . "drafts must be boolean")
        (correction . ((drafts . #t)))
        (grounded-output . ((tool . "zola_build") (args . ((drafts . #t)))))))))

    (compositional-reasoning
     ;; Compose complex operations from atomic tools
     ((goal . "Set up a new blog with Hakyll")
      (decomposition
       (("Connect to Hakyll adapter" . (hakyll connect))
        ("Initialize project structure" . (hakyll_init (name . "my-blog")))
        ("Create initial post" . (create-file "posts/first-post.md" template))
        ("Build site" . (hakyll_build))
        ("Verify build success" . (check-output "_site/index.html"))))
      (execution-plan . "sequential with error handling")))

    (analogical-transfer
     ;; Transfer knowledge between similar SSGs
     ((source . "zola")
      (target . "cobalt")
      (mapping
       (("zola init" . "cobalt init")
        ("zola build" . "cobalt build")
        ("config.toml" . "_cobalt.yml")
        ("content/" . "_posts/")))
      (caveats . "Template syntax differs: Tera vs Liquid")))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; REASONING CHAINS
;;;; ═══════════════════════════════════════════════════════════════════════════

(define reasoning-chains
  '((diagnostic-chain
     ;; Chain of reasoning for troubleshooting
     ((observation . "Build failed with exit code 1")
      (hypothesis-1 . "Configuration error")
      (test-1 . "Check config syntax")
      (result-1 . "Config valid")
      (hypothesis-2 . "Content error")
      (test-2 . "Build with verbose output")
      (result-2 . "Template variable undefined in post.md")
      (conclusion . "Missing front matter variable")
      (action . "Add variable to post front matter")))

    (selection-chain
     ;; Chain of reasoning for SSG selection
     ((requirement . "Documentation site for Rust project")
      (constraint-1 . "Rust ecosystem integration")
      (constraint-2 . "Code documentation support")
      (constraint-3 . "Syntax highlighting")
      (candidates . ("mdbook" "zola" "cobalt"))
      (evaluation
       ((mdbook . "Designed for Rust docs, native support")
        (zola . "Fast, good highlighting, less Rust-specific")
        (cobalt . "General purpose, less feature-rich")))
      (conclusion . "mdbook")
      (rationale . "Purpose-built for Rust documentation")))

    (migration-chain
     ;; Chain of reasoning for content migration
     ((source . "Jekyll")
      (target . "Zola")
      (analysis
       (("Front matter format" . "YAML → TOML")
        ("Template engine" . "Liquid → Tera")
        ("Content structure" . "_posts/ → content/")
        ("Config file" . "_config.yml → config.toml")))
      (plan
       ("1. Export Jekyll content"
        "2. Convert front matter YAML to TOML"
        "3. Adapt template syntax"
        "4. Restructure directories"
        "5. Create Zola config"
        "6. Build and verify"))))))

;;;; ═══════════════════════════════════════════════════════════════════════════
;;;; KNOWLEDGE GRAPH
;;;; ═══════════════════════════════════════════════════════════════════════════

(define knowledge-graph
  '((nodes
     ;; SSG nodes with properties
     ((zola ((type . ssg) (language . rust) (speed . fast) (templating . tera)))
      (hakyll ((type . ssg) (language . haskell) (paradigm . functional) (templating . pandoc)))
      (serum ((type . ssg) (language . elixir) (paradigm . functional) (templating . eex)))
      (mdbook ((type . ssg) (language . rust) (purpose . documentation)))
      ;; ... 24 more SSG nodes
      ))

    (edges
     ;; Relationships between nodes
     (((zola rust) (relation . implemented-in))
      ((zola tera) (relation . uses-template-engine))
      ((hakyll pandoc) (relation . uses-processor))
      ((serum elixir) (relation . implemented-in))
      ((serum phoenix) (relation . ecosystem))
      ;; Language family relationships
      ((rust systems-language) (relation . is-a))
      ((haskell functional-language) (relation . is-a))
      ((elixir beam-language) (relation . is-a))))

    (inference-rules
     ;; Rules for deriving new knowledge
     (("If SSG uses functional language, then supports immutable builds")
      ("If SSG is Rust-based, then likely fast and memory-safe")
      ("If SSG supports Markdown, then supports basic content authoring")
      ("If SSG has plugin system, then extensible")))))
