# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

PolarisRails is a Ruby gem that provides Rails helpers and components. It's structured as a Rails engine that extends Rails applications with custom view helpers and URL helpers. The project includes a demo Rails application for development and testing.

## Architecture

- **Main Gem**: `/lib/polaris_rails.rb` - Entry point that requires version and engine
- **Engine**: `/lib/polaris_rails/engine.rb` - Rails engine that isolates the namespace and registers helpers
- **Helpers**: Located in `/app/helpers/polaris_rails/`
  - `ViewHelper` - Empty module ready for component helpers
  - `UrlHelper` - Empty module ready for URL/link helpers
- **Demo App**: `/demo/` - Full Rails application for testing and previewing components

## Development Commands

### Running Tests
```bash
bin/test
```

### Code Style/Linting
```bash
bundle exec standardrb
```

### Running Demo Application
```bash
foreman start preview
# OR manually:
cd demo && bundle install && bin/rails server -p 4000
```

### Component Preview System
The demo app uses Lookbook for component previews:
- Preview files: `demo/app/previews/`
- Preview templates: `demo/app/previews/*/`
- Access at: http://localhost:4000 when demo is running

## File Structure

```
lib/
├── polaris_rails.rb           # Main entry point
├── polaris_rails/
│   ├── version.rb            # Gem version
│   └── engine.rb             # Rails engine configuration
app/
└── helpers/
    └── polaris_rails/
        ├── view_helper.rb     # Component helpers
        └── url_helper.rb      # URL/link helpers
demo/                          # Demo Rails application
├── app/previews/             # Lookbook component previews
└── config/application.rb     # Lookbook configuration
```

## Current State

The helper modules are currently empty placeholders ready for implementation. The UrlHelper contains a partial `s_link_to` method that needs completion (references undefined `convert_options_to_data_attributes` and `url_target` methods).

## Dependencies

- Rails >= 8.0.2
- Lookbook ~> 2.0 (for component previews)
- Standard (for code linting)
- Foreman (for process management)