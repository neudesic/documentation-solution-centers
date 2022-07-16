# Solution Center Development Process

This document describes the current system development process at the Solution Center.

## Table of Contents

* [Purpose](#purpose)
  * [Full project lifecycle](#full-project-lifecycle)
* [Proposal](#proposal)
* [Requirements](#requirements)
* [Design](#design)
  * [Goals](#goals)
  * [Component architecture](#component-architecture)
  * [Software-level architecture](#software-level-architecture)
  * [Monitoring](#monitoring)
  * [Requirement satisfaction](#requirement-satisfaction)
  * [Documentation](#documentation)
* [Development](#development)
  * [Task breakdown](#task-breakdown)
  * [Source control](#source-control)
  * [Project setup](#project-setup)
  * [Coding](#coding)
  * [Linting and formatting](#linting-and-formatting)
  * [Documentation](#documentation)
  * [Code reviews](#code-reviews)
* [Testing](#testing)
  * [Unit testing](#unit-testing)
  * [Local testing](#local-testing)
  * [Integration testing](#integration-testing)
  * [Load testing](#load-testing)
  * [QA testing](#qa-testing)
* [Deployment](#deployment)
  * [Operational philosophy](#operational-philosophy)
  * [Deployment environments](#deployment-environments)
  * [Release tags](#release-tags)
  * [Continuous integration and deployment](#continuous-integration-and-deployment)
  * [Monitoring](#monitoring)

## Purpose

This document is meant as a guide to promote a common understanding of current processes for both development and deployment, as well as best practices that should be followed. Automation and standardized tools can further help avoid confusion and streamline common workflows.

It is the aim of this process to facilitate development of new systems from the start; existing systems that were created before this process was formalized will, over time, be ported to this process wherever it makes sense to do so.

The Solution Center development process aims to address six main areas:

* Proposal
* Requirements
* Design
* Development
* Testing
* Deployment

Each of these areas represents a portion of the lifecycle of a system and is described in detail in the following sections.

> **Note**: most of the items listed here should apply at least at a high level to all projects; however, there cannot be a one-size-fits-all solution, and where necessary projects are allowed to deviate from the outlined steps, within reason and where agreed upon. While this is a generalized and high-level process, the specific implementation of each step may vary with programming languages and frameworks used by different projects.

### Full project lifecycle

When following the process presented here, a general outline of the lifecycle of a system from proposal to deployment would look like this:

1. Developer writes a proposal describing the problem they are trying to solve and the solution they are proposing
2. A requirements document is filled out by all of the stakeholders with the requirements being reviewed and prioritized
3. Developers write a design document answering questions on the characteristics and operation of a new system
4. The design is reviewed by system stakeholders and one or more developers. Changes are iterated on as needed
5. Development begins with a task breakdown delineating the main deliverables and detailing tasks for at least the first one
6. Code additions and changes are made through a series of pull requests made to the `master` branch of the project's Github repository and reviewed by at least one developer. Automated checks are performed with each pull request
7. Testing proceeds in parallel with development, with unit testing and local testing. The system can be deployed to a testing environment and tested as needed there
8. Iterations continue until new features reach a state considered stable
9. A release tag is created in the `master` branch; the system gets deployed to a staging environment
10. Integration testing, load testing and QA testing are performed in the staging environment
11. Once testing is completed satisfactorily, the tagged release is deployed to the production environment
12. Additional QA testing is performed in the production environment
13. Runbooks are written
14. Public docs are written
15. Any additional monitoring is set up and the system is ready to be used in production
16. A post-mortem takes place

Each of these steps touch, in order, on the six areas outlined previously.

[→ back to top](#table-of-contents)

## Proposal

All systems that haven't been pre-approved by project stakeholders will need to have a proposal written. The goals of this phase are:

* **define stakeholders** — figure out who should care about the project
* **provide project overview** — inform stakeholders of the problem you are trying to solve and how you are going to solve it
* **provide scope** — define what features are in scope for the project, who will be working on it, and a general estimate of how long it will take

[→ back to top](#table-of-contents)

## Requirements

All new systems must have requirements defined and approved by stakeholders, preferably before starting design. The goals of this phase are:

* **Define MVP** — the requirements that must be met to complete V1 of your project
* **Create Certainty** — it is understood what will be done during initial development and what features could/would be left out
* **Limit Expectations** — via agreed upon requirements

While requirements should be listed in the requirements doc and preferably agreed to before design happens, the requirements doc is a living doc that can change as discoveries come up during development. The requirements doc should also be referred to in the design doc to prove that requirements are being met by the design.

[→ back to top](#table-of-contents)

## Design

All new systems must go through a first design phase. This design should be kept up to date for the duration of development. The goals of this phase are:

* **reduction of ambiguity** — via a complete understanding of the purpose and scope of a new system
* **operational insight** — via the outlining of system internals, and interactions with existing or planned systems
* **increased awareness** — via ensuring that more than one developer or interested party participates in the design of a new system

Designing a system must therefore answer a number of questions intended to facilitate meeting these goals; while not all the answers may be immediately available, putting some thought into these questions early will help ensure a smoother process and avoid some trouble down the road. The answers must be compiled into a short document and reviewed by multiple stakeholders and at least one additional developer. The sections that follow can be used as a template to get started on a design document.

### Goals

A new system is being created for a number of reasons and, likely, with the goal of solving a number of specific problems. These reasons, goals, and problems should all be well-defined and described clearly and concisely.

Questions:

* Why is the system being created?
* What are the problems the system solves?

### Component architecture

A non-trivial system is typically made of multiple components. At a high level, each component should be described, with a well-defined purpose and a set of functionality, APIs or events that are exposed to either other internal components or external systems. All component interactions should also be defined at this stage, particularly in relation to dependencies on external systems.

Questions:

* What are the high-level components the system is made of?
* What are the high-level functionality/APIs/events those components expose?
* How do the components interact with one another?
* What external systems do the components depend on?

### Software-level architecture

At a somewhat lower level, the components described in the Component Architecture section will map to one or more software components. This mapping should be described, together with a more detailed look at interactions between software components. Particularly when accessing shared state, concurrency issues may arise and have to be dealt with, and it will be helpful to call them out and describe how they would be handled. Any external API dependencies, and the implications of such dependencies, should also be described. Finally, infrastructure requirements for each software component should be part of this section.

Questions:

* What software components are planned for the system, and how do they map to the high-level architectural components?
* What concurrency issues do these components have to be able to handle?
* What external API calls do these components have to make and depend on?
* What infrastructure requirements are expected for the software components?
* What programming language(s) will be used and why?

### Monitoring

It's important to define how a system will be monitored and what it means for it to be in working condition or failing. To that end, a system should have a health check that can be run automatically, and metrics to be monitored to ensure correct operation. When certain thresholds are exceeded for these metrics, warnings or critical alarms should be fired; remediation then, whether automated or manual, will take place, to bring the system back to a healthy state. All of these aspects should be thoroughly documented in the design document to identify any gaps or need for more effective monitoring.

Questions:

* How will we know the system is healthy?
* What will report on system health in an automated fashion?
* What health metrics should be monitored?
* What thresholds for metrics are considered warnings, or critical?
* What remediation is necessary when health fails or alarms trigger?
* What internal performance metrics should be monitored?
* What performance metrics that affect user functionality should be monitored?

### Requirement satisfaction

Once the design is complete, an evaluation should be made to verify and state how it meets the requirements decided on in the requirements doc.

Questions:

* How is each requirement met by the proposed design?    

### Documentation

Diagrams can greatly help understand the architectures outlined in the previous sections; therefore, a component diagram (ideally in UML) and, where it makes sense, a software component diagram should be part of the design document for a system.

The design document and any associated system documentation should be kept up to date by the system authors at least with every major design change.

Any needs for user-facing documentation related to a system should be kept in mind during the design phase, together with a plan for deploying or updating documentation when a new system or new features are deployed, and there should be mention of this in the design document. 

[→ back to top](#table-of-contents)

## Development

This phase of development is where a system is built and documented. The goals for this phase include:

* **familiarity** — via following of a reusable, common pattern for development
* **quality control** — via using standardized and automated tools and practices
* **increased awareness** — via ensuring that more than one developer is aware of what is being done and how

While each development project should make use of what tools and frameworks most make sense for the task at hand, at a general level development should proceed along well-established routes. This will allow developers to more easily pick up and inspect unfamiliar code, and avoid mistakes that can easily be detected by automation.

Many of the details in this section will vary depending on the programming languages and frameworks used in each individual project.

### Task breakdown

In order to provide visibility into the progress of a project, a task breakdown should be done at the beginning of all development stages. This can be done individually or with other members of the team including project management. 

Tasks should be organized into high level release versions, for example: MVP (minimum viable product), Alpha, Beta, Final. The exact details may be defined differently for each project.

Tasks should be tracked in GitHub issues using proper labeling and assigned to the project Kanban Board. Tasks will be moved into their relevant sprints during sprint planning.

### Source control

All source code and configuration must be in Github. Production code for each project must be in the `master` branch of its repository, and the `master` branch should be protected in the repo settings to require pull request reviews before merging (see [Code Reviews](#code-reviews)).

Feature or ephemeral branches can be created as needed, but deployments should in most cases be made from the `master` branch (see [Deployment](#deployment)). In some cases projects may need to maintain full, concurrent versions in separate branches, and in these cases they will be allowed to deploy from those branches.

Generated or hand-written configuration to set up infrastructure in an automated and replicable fashion should also be in a Github repository.

### Project setup

A system can be composed of one or more software projects. These should be set up with a common layout that allows developers to instantly recognize the major parts of a project. The specifics can be described in a separate, per-language standard to mirror well-known best practices for the programming language used for each project.

### Coding

Coding will be done in the language and with frameworks and libraries most suited for the individual project. Agreed upon style and formatting rules promote readability and understanding of the codebase. Wherever possible, well-established style guides and best practices should be followed.

### Linting and formatting

Linter tools perform static analysis and surface problems early in development. Formatting tools, where available, further improve readability and facilitate having a common ground for developers to collaborate.

Linting checks and formatting will be automated, and performed before new code is pushed to the `master` branch of the project. Depending on the programming language used, the tools and conventions used for these steps may vary.

### Documentation

Code should be documented with abundant comments explaining the reasoning behind decisions, more than what each portion of code is doing. This further helps developers quickly understand unfamiliar code and get up to speed.

Comments and code can be parsed by automatic documentation tools to produce nicely rendered documentation pages. This is especially useful for libraries and API documentation, but can make sense for any standalone project, particularly where it allows for plugins or extensions.

### Code reviews

Any additions to code must be made to a branch and merged into the `master` branch via a pull request. Every pull request must be reviewed by at least an additional invested developer, who will be equally responsible for the code that is being merged as the original author.

Merging will happen only when the pull request is approved and any automated processes such as linting, testing and other checks pass satisfactorily.

For more information on this topic, see the [Github Best Practices](github-best-practices/github-best-practices.md) document.

[→ back to top](#table-of-contents)

## Testing

Testing has to happen partially during development and partially after. However, since this is a fairly large topic, it's categorized here on its own. The goals of testing are:

* **confidence in reliability** — via testing of expected usage as well as edge cases for a system
* **early error detection** — via testing at different levels at every stage of development and deployment
* **visibility into system characteristics** — via generated reports of test coverage, benchmarks, and integration
* **automation** — via offering tests that can be run by automated tools wherever possible

Systems must be tested in several ways at different stages of development and during a multi-stage deployment. For each category of test, requirements are listed below.

### Unit testing

Unit testing aims to test each essential part of a software component in isolation. Well-established tools and frameworks can be used for this type of testing, depending on the programming language employed.

Unit tests must be runnable in an automated fashion before a pull request is merged and before a deployment. Unit tests must also be accompanied by an auto-generated coverage report outlining what parts of code the tests cover.

Coverage as a percentage and other stats will be tracked by CI/CD or other build tools and visualized. There may be a soft requirement for a certain level of coverage (TBD) for each project.

### Local testing

The full functionality of a software project must be tested locally before the code is pushed to `master`, as thoroughly as possible by the project author and where applicable by an additional invested developer.

The specifics of this type of testing may vary. Where feasible, elements of the target environment for the system in test can be reproduced locally, or in most cases mocked where a full end-to-end test is not necessary.

### Integration testing

Integration testing aims to run end-to-end tests for a software component in correlation with other functional (non-mocked) components in a sandbox-like testing environment. 

Integration testing must happen before the final stage of deployment, in an environment that can be set up either temporarily or permanently, manually or automatically (for example, as part of **CI/CD**).

### Load testing

Load testing aims to both determine theoretical maximum loads a component can reasonably handle, as well as verify assumptions on the performance characteristics of a component, typically via automated means.

Public-facing components that are expected to handle non-trivial amounts of traffic should be thoroughly load tested before the final stage of deployment using established frameworks or benchmarks.

### QA testing

QA testing is performed as a series of end-to-end tests of functionality for a set of components operating together, either via automated or manual means.

Where feasible, QA testing will be performed via both automated and manual means before and after deployment to production. A QA test plan should be produced detailing what tests will be performed and the expected outcome; this will be particularly useful when QA testing is not performed by the system authors directly.

[→ back to top](#table-of-contents)

## Deployment

The last phase is deployment, during which a system is published to its final target environment (production or otherwise), through a series of incremental steps. The goals of this phase are:

* **efficient deployments** — via setting up well-defined and reproducible steps that can be automated
* **ability to recover** — via the preparation of a plan to undo the deployment if things go wrong
* **increased awareness** — via ensuring that more than one developer is aware of what is being deployed, where, and how

Deployments will proceed in stages, with the help of deployment environments set up with the explicit goal of supporting testing and building confidence in the reliability of the systems being deployed.

### Operational philosophy

Deployments should be able to be performed directly by developers, without the need of a dedicated release team. However, it is important that clear steps be defined and automation employed where possible, with supervision, to assist the deploying developers and prevent common mistakes and accidents.

To this end, deployment steps should be clearly documented and reviewed before a deployment takes place. Likewise, steps to rollback a deployment in case of failure should be part of the deployment documentation.

The ability to replicate a deployment easily is essential to allow a deployment to move in independent stages toward production. If a deployment is meant to proceed in gradual increments, the proposed strategy toward this goal should also be detailed when possible.

### Deployment environments

We define three main deployment environments:

* **Dev**: used for all varieties of testing, not guaranteed to be stable at any time, but likely to have some differences with the production environment, aimed at easing testing
* **Staging**: used as a dry run for production deployment. Mirrors production, and is where final testing before the final deployment is done
* **Prod**: the public-facing, actual production environment. Systems deployed here are officially in production.

A system will first be deployed to Dev, where testing, automated and manual, can begin. Once a developer is satisfied with the testing result, a stable release of the system software is made and deployed to Staging, where further integration, load and QA testing can happen. If testing passes, then the same release of system code can be deployed to Prod. At this point the deployment is considered done.

### Release tags

While deploying individual and incremental commits is an acceptable strategy for deploying to Dev, a system ready for a stable release should have the code in its `master` branch versioned with a release tag. The act of creating a release tag can then trigger further automated action, like a deployment to Staging.

Concise release notes should ideally accompany the release tag to summarize what is new in the release being made.

### Continuous integration and deployment

While the aim is to allow developers to perform deployment autonomously, that doesn't mean they should receive no assistance in the process. Mechanisms to automate deployments will be provided and templatized where possible in order to reuse common patterns across multiple projects.

It should be possible for systems to auto-deploy to the Dev environment with every merge to the `master` branch to facilitate testing, with little additional effort. Triggering an automatic deployment to Staging should require a more deliberate action, such as the creation of a release tag. Finally, deployments to Prod can be automated much in the same way as deployments to Staging, and Prod should, with minor differences, be a mirror of Staging; however, the act of initiating a deployment to Prod should be manual, and should also consider other projects being deployed concurrently, the availability of on-call personnel, business hours and so on.

Any necessary infrastructure for any deployment in a specific testing environment can be set up before the system deployment takes place, ideally with tools that allow for a replicable and automatable setup.

### Monitoring

Any additional monitoring that was not set up before deployment should be set up after deployment. Ideally, a short document with steps to take to triage and resolve issues with the system should be produced; this document should also include references to resources useful for first responders (dashboards, other monitoring tools, existing remediation scripts, etc.). This will be particularly useful when the first responders triaging issues are not the system authors.

[→ back to top](#table-of-contents)