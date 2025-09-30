# Function Player Documentation

Official documentation site for Function Player - A Unity plugin for visual function execution and debugging.

## About This Repository

This repository contains the source code for the Function Player documentation website, built with [Jekyll](https://jekyllrb.com/) and the [Just the Docs](https://just-the-docs.github.io/just-the-docs/) theme.

## Local Development

### Prerequisites

- Ruby (version 3.0 or higher)
- Bundler gem
- Git

### Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/guilleatm/function-player-docs.git
   cd function-player-docs
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Run the development server:
   ```bash
   bundle exec jekyll serve
   ```

4. Open your browser and navigate to `http://localhost:4000`

The site will automatically rebuild when you make changes to the source files.

## Contributing

We welcome contributions to improve the documentation! Here's how you can help:

### Reporting Issues

If you find errors, typos, or missing information:

1. Check if the issue already exists in our [Issues](https://github.com/guilleatm/function-player-docs/issues)
2. If not, create a new issue with:
   - Clear description of the problem
   - Page URL where the issue occurs
   - Suggested correction (if applicable)

### Suggesting Improvements

Have ideas for new content or better explanations?

1. Open an issue with the "enhancement" label
2. Describe what you'd like to see added or changed
3. Explain why it would be helpful for users

### Contributing Content

To contribute new documentation or fix existing content:

1. Fork this repository
2. Create a new branch for your changes
3. Make your edits (see [Writing Guidelines](#writing-guidelines) below)
4. Test your changes locally
5. Submit a pull request

## Writing Guidelines

### Markdown Style

- Use clear, descriptive headings
- Include code examples where helpful
- Add links to related sections
- Use bullet points for lists
- Include screenshots for UI-related content

### Content Structure

Each documentation page should include:

- Clear title and purpose
- Prerequisites (if any)
- Step-by-step instructions
- Code examples
- Related links

### Code Examples

- Use proper syntax highlighting
- Include complete, runnable examples
- Add comments to explain complex parts
- Test all code examples

## Site Structure

```
docs/
├── installation.md          # Installation guide
├── quick-start.md          # 5-minute getting started
├── getting-started.md      # Comprehensive introduction
├── advanced-features.md    # Advanced functionality
├── use-cases.md           # Real-world examples
├── api.md                 # API reference
├── troubleshooting.md     # Common issues and solutions
└── faq.md                 # Frequently asked questions
```

## Deployment

The site is automatically deployed to GitHub Pages when changes are pushed to the `main` branch. The deployment process:

1. GitHub Actions runs the Jekyll build
2. Generated site is deployed to GitHub Pages
3. Site is available at https://guilleatm.github.io/function-player-docs

## License

This documentation is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Support

- **Documentation Issues**: Open an issue in this repository
- **Function Player Support**: Contact support through the Unity Asset Store
- **General Questions**: Join our community discussions

## Links

- [Function Player on Unity Asset Store](https://assetstore.unity.com/packages/tools/utilities/function-player-329120)
- [Live Documentation Site](https://guilleatm.github.io/function-player-docs)
- [Just the Docs Theme](https://just-the-docs.github.io/just-the-docs/)

---

Built with ❤️ for the Unity community
