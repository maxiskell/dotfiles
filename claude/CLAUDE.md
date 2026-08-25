# Response style

Default to short, dense answers. The target is high information density, not fewer facts: keep every substantive point, caveat and correction, and cut the packaging around them — preamble, restating the question, recapping what was just said, listing options that will not be pursued, closing offers of help.

State the conclusion; do not volunteer the reasoning that produced it. One line of justification is enough. Expand only when asked to — "expand your reasoning" (or similar) means the derivation, the trade-offs weighed, or the evidence behind a claim is wanted.

Lead with the answer, then only what changes the next decision. A direct question usually wants two or three sentences, not a section.

Length is for deliverables, not replies: PR descriptions, tickets, plans and docs carry the detail, because there the detail is the product.

# Comments in code

Default to **zero** comments. Even WHY-comments — cross-service contracts, hidden constraints, non-obvious semantics — tend to get stripped. A comment must clear a very high bar: keep it only when removing it would genuinely confuse the next reader, e.g. a subtle invariant the code cannot express. Let the diff and the PR description carry rationale.

When a comment is warranted, use JSDoc (`/** … */`) above the symbol, never a free-floating multi-line `//` paragraph.

Never write "we", "us", "our" or "let's" in comments, JSDoc or docs. Write impersonally about the code, the caller or the data — "A team member has two session shapes", not "A team member reaches us two ways". Before finishing a diff that adds comments, grep the added lines for `\b(we|us|our|let's)\b`.

Do not commit development-process narration: no rollout-phase labels ("phase 1", "phase 3"), plan step IDs, task-spec references, or "mirrors legacy X" annotations. Comments describe the code as it stands.

# Type casts

Avoid `as` when restructuring removes the need. If a cast appears because of spreading a discriminated union, prefer early returns plus in-place mutation, or build a properly-typed value before assigning. Fall back to a cast only when the alternatives are clearly worse.

# Running validation

Do not run tests, lint, type-check, or docker-compose during a task — that includes `tsc`/`type-check`, however cheap it looks. Write the code and tests, then hand off, saying what should be run.

**Exception: the checkpoint has to actually exist.** This assumes a pre-commit hook runs lint/format/tests on commit. Where that hook does not run (a fresh worktree, for instance), either run the validation or say plainly that nothing has checked the code. Never let unvalidated work look validated. Once asked to run it, run the full set and fix what it finds.

# Git and GitHub

**Commit freely, never push.** "Commit often" is welcome; stop at the commit and report that the branch is ahead by N. Push only on an explicit ask. The trap is the long task: one "create a PR" authorises **that one push**. Every later commit — review-bot fixes, follow-ups, cleanups — needs a fresh ask, however obviously it belongs to the PR just created.

**Prose to GitHub takes two separate approvals**, in order: (1) ask whether to comment at all, with no draft; (2) if yes, show the proposed message in full; (3) post only once that message is approved. Covers review replies, inline comments, top-level PR/issue comments, `gh pr review`, and resolving threads. A `gh pr create` that was asked for is fine, body included. Editing an existing PR's description is fine; adding commits to it is not.

Linear is exempt — comments and ticket descriptions can be written directly.

**PR descriptions stay compact** — a few hundred words, not a thousand. Keep the why, anything that would otherwise surprise a reviewer opening the diff (files touched outside the ticket, one line each), and known limitations. Cut the verification/test-run section: CI shows it. Cut anything the diff or the code's own comments already say — design rationale belongs next to the code, not restated in prose.

# Scope

**A missing entry point is a finding to report, not a licence to build one.** Never add a production-callable surface (tRPC procedure, REST route, webhook) on your own initiative, even when the feature is unusable without it and there is a clear precedent to copy. Describe the gap, name the options, wait. The answer is often an existing ops tool rather than new code.

"On your own initiative" means unprompted. A review finding that names the missing surface, once asked to address the comments, is authorisation — build it, don't re-ask.

# Test coverage

Ship automated tests with feature work so CI covers it — unit, integration, endpoint, and E2E where a user flow exists. Do not leave a change as code-only. Prefer the layer that is unblocked and meaningful: backend tests when the frontend is gated on an external dependency.
