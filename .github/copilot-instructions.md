## Commit Message Guidelines

Follow the Conventional Commits specification for generated commit messages:

- **Format:** `<type>(<scope>): <description>` (omit `(<scope>)` when a change spans multiple areas or has no clear scope).
- **Allowed types:**
  - `feat`: A new feature or user-facing capability
  - `fix`: A bug fix
  - `docs`: Documentation-only changes
  - `style`: Formatting, whitespace, or lint-only changes that do not alter logic
  - `refactor`: Code changes that neither fix a bug nor add a feature
  - `perf`: Performance improvements
  - `test`: Adding or updating tests
  - `chore`: Build scripts, dependencies, tooling, or maintenance tasks
- **Summary rules:**
  - Use imperative, present-tense verbs (e.g., `add`, `fix`, `update`—not `added` or `fixes`).
  - Keep the summary concise (ideally 50–72 characters) with no trailing period.
  - Lowercase the first letter of `<description>`.
- **Body rules:**
  - Always format the body as a bulleted list (`- `) instead of prose paragraphs.
  - Leave one blank line between the summary and the first bullet point.
  - Start each bullet with an imperative verb (e.g., `- Add...`, `- Update...`, `- Remove...`) and explain *what* changed and *why*.
  - Keep each bullet point concise (one key change or logical grouping per bullet).
  - Never write multi-sentence narrative paragraphs in the commit body.
- **Breaking changes:**
  - Append `!` before the colon (e.g., `feat!: drop legacy config format`) and include a bullet starting with `BREAKING CHANGE:` in the body explaining the migration impact.
  