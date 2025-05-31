# repo‑update

Automated bulk‑maintenance toolkit for GitHub repositories  
▶ **Live demo:** <https://shroomtop.github.io/repo-update/>

repo‑update sweeps through any number of repos and applies instant, opinionated fixes:

| Feature | What it does |
|---------|--------------|
| Readme/Metadata Sync | Generates or patches README, Description, Topics, Badges |
| License Auditor | Ensures MIT (or detected) license consistency |
| .gitignore Seeder | Adds language‑specific ignores where missing |
| CI Bootstrapper | Drops in a minimal HTML‑lint workflow |
| Release Drafts | Creates SemVer‑tagged, changelog‑driven releases |

## Quick Start
```bash
# clone & enter utility
git clone https://github.com/shroomtop/repo-update.git
cd repo-update

# run against target org or repo list (PAT via env var)
GH_TOKEN=ghp_xxx ./repo-update.sh --org shroomtop
```

> **Output:** a JSON audit report plus auto‑commits + PRs for each fix.

## Configuration
- **targets.yml** – list of repos or GitHub orgs
- **rules/** – modular fix scripts (Bash, jq)
- **templates/** – README, workflows, badges

## Roadmap
- GitHub App mode (fine‑grained PATless auth)  
- Self‑hosted runner auto‑provisioning  
- Dependency graph‑driven security fixes

## Contributing
Fork → branch → PR. Run `./test.sh` before pushing. All commits must follow Conventional Commits.

## License
MIT © Shroomtop420™
