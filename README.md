## Tasks

### Initial bootstrap

- [x] Wire up GoTH stack
    - [x] Add Echo
        - [x] Add a Handler
        - [x] Enable static asset serving
        - [x] Port via env var *(default 8080)*
- [x] Add Makefile
- [x] Add Templ
    - [x] Add HTMX static
    - [x] Create a basic component with a layout
    - [x] Add hot-reload
    - [x] Add tailwind css
    - [x] Add DaisyUI

> Initial Data modelling

- [x] [Create ERD](https://app.eraser.io/workspace/FXRAxhHst8xoIHUkUqI6?origin=share)
- [x] Initial questions table
- [x] Initial pillars table
- [x] Goose migrations
- [x] Docker-compose
- [x] Replicate dotenv with native GNU/Make
- [ ] Rudimentary data seeder

> UI

- [ ] Create color scheme
- [ ] Create grid for content layout
- [ ] Create left-side bar menu
- [ ] Create top menu (ORR name, switch modes)
- [ ] Create right-side bar menu for questions metadata
- [ ] Create pillar and questions
  - [ ] Scaffold initial interactions
  - [ ] Toggle right-side bar menu
- [ ] Create progress component
- [ ] Create plain assessment page in default mode
- [ ] Create plain assessment page in survey mode

> Docs

- [ ] Formalize decision log format
- [ ] Formalize Excalidraw diagrams
  - [ ] Backend Architecture
  - [ ] Frontend Architecture (hypermedia app)
  - [ ] Domain modelling
- [ ] Create local docs with mkdocs-material to document structure, patterns, etc.

#### V1

> Data modelling

- [ ] Add workload table
- [ ] Add assessment table
- [ ] Initial assessment checkpoints *(e.g., allow read-only snapshots for progress)*
- [ ] Evolve questions to allow checklist (practices)
- [ ] Evolve assessment with a scoring system *(weight, priority etc)*
- [ ] Decide whether to create a `orr` schema *(needs to update queries to use search_path later)*

> UI

- [ ] Create Application functionality
- [ ] Create Not applicable functionality
- [ ] Create Template authoring experience
- [ ] Decide whether to stack multiple templates (Lens like experience)
- [ ] Create home page

#### V1.5

- [ ] Create point-in-time snapshot experience
- [ ] Create timeline experience *(changes)*
- [ ] Create reporting
