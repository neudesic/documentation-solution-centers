# ASP.Net Azure Interview Checklist

## 1. ASP.Net

☐ Async vs Parallel

&nbsp;&nbsp;&nbsp;&nbsp;**Cooperative multitasking vs Physical Multitasking**

☐ Tasks Run vs Async / Await

&nbsp;&nbsp;&nbsp;&nbsp;**Pausing Current Thread vs Continuation State Machine**

☐ Concurrency Management

&nbsp;&nbsp;&nbsp;&nbsp;**Race Conditions**

&nbsp;&nbsp;&nbsp;&nbsp;**Dead Lock**

&nbsp;&nbsp;&nbsp;&nbsp;**.NET provided solutions (lock, Monitor, Interlock, Semaphore, Reset Events, Wait Handles, Mutexes)**

☐ Cancellations / Continuations

&nbsp;&nbsp;&nbsp;&nbsp;**When To Use them**

&nbsp;&nbsp;&nbsp;&nbsp;**How to combine them**

☐ Iterators

&nbsp;&nbsp;&nbsp;&nbsp;**How to implement it**

&nbsp;&nbsp;&nbsp;&nbsp;**How to do Streaming (AsyncEnumerable)**

☐ Events and Delegates

&nbsp;&nbsp;&nbsp;&nbsp;**When to use them**

## 2. Automated Unit testing

☐ Test Driven Development

☐ Test Doubles (Stub, Mock, Fake, Dummy, Spy)

&nbsp;&nbsp;&nbsp;&nbsp;[https://www.techtarget.com/searchsoftwarequality/tip/Inside-5-types-of-test-doubles](https://protect-us.mimecast.com/s/a-FWC73z4wfzP962T8HN8m)

How to use Mocks in Testing

☐ Test Types

&nbsp;&nbsp;&nbsp;&nbsp;[https://www.perfecto.io/resources/types-of-testing](https://protect-us.mimecast.com/s/rougC82A4xuXJxMWC1TtKL)

☐ Unit Test Alternatives

&nbsp;&nbsp;&nbsp;&nbsp;**Behavior Testing vs Data Testing**

&nbsp;&nbsp;&nbsp;&nbsp;**When to use each one**

☐ Code Quality Standards and Tools

&nbsp;&nbsp;&nbsp;&nbsp;**SonarQube**

# 3. Azure

☐ How to select a messaging solution

☐ Messages vs Events

&nbsp;&nbsp;&nbsp;&nbsp;**Message = Contract, Self-Contained, Expectations on the Consumer Side**

&nbsp;&nbsp;&nbsp;&nbsp;**Event = Signal, Does not Contain Data, No Contract or Expectations**

☐ How to select a database solution

☐ SQL vs NO SQL

&nbsp;&nbsp;&nbsp;&nbsp;**ACID (Atomicity, Isolation, Consistency, Durability)**

&nbsp;&nbsp;&nbsp;&nbsp;**CAP Theorem (Consistency, Availability, Page Fault Tolerance)**

&nbsp;&nbsp;&nbsp;&nbsp;**SQL = Consistent, Transactional, Requires Data Normalization**

&nbsp;&nbsp;&nbsp;&nbsp;**No SQL = Eventually Consistent, Usually Single Document Transactional, should use soft-lock solutions, Encourages Data Denormalization**

# 4. DEVOPS and source conrol

☐ Distributed vs Centralized

&nbsp;&nbsp;&nbsp;&nbsp;**Git vs TFVC**

☐ Distributed Source Control Alternatives

&nbsp;&nbsp;&nbsp;&nbsp;**Trunk based vs Branch based**

&nbsp;&nbsp;&nbsp;&nbsp;[**https://lucamezzalira.com/2014/03/10/git-flow-vs-github-flow/**](https://protect-us.mimecast.com/s/Akc8C9rB4yIzZPKAT3cWz0)

&nbsp;&nbsp;&nbsp;&nbsp;**Strategies, Git flow, GitHub flow**

**Git flow** works with different branches to manage easily each phase of the software development, it&#39;s suggested to be used when your software has the ** concept of &quot;release&quot;**  because, as you can see in the scheme above, it&#39;s not the best decision when you work in _Continuous Delivery_ or _Continuous Deployment_ environment where this concept is missing.

**GitHub** is working with a continuous deployment environment where there isn&#39;t the concept of &quot; **release**&quot; because every time they finish to prepare a new feature they push live immediately (after the whole [automation chain](https://protect-us.mimecast.com/s/r96CC0RpQmIkElWQHWw6VE) created in the environment

☐ CI/CD

&nbsp;&nbsp;&nbsp;&nbsp;**Continuous Integration**

&nbsp;&nbsp;&nbsp;&nbsp;**Continuous Delivery vs Continuous Deployment**

# 5. Design Patterns and Best Practices

☐   Design Patterns

&nbsp;&nbsp;&nbsp;&nbsp;[https://en.wikipedia.org/wiki/Software\_design\_pattern](https://protect-us.mimecast.com/s/nOmJCgJKzGTqgnWKfElwfB)

&nbsp;&nbsp;&nbsp;&nbsp;[https://opensource.com/article/19/7/understanding-software-design-patterns](https://protect-us.mimecast.com/s/6Vy8CjRMDkIY6kJDUn37sd)

&nbsp;&nbsp;&nbsp;&nbsp;**What they are**

**According to Wikipedia, &quot;a software design pattern is a general, reusable solution to a commonly occurring problem within a given context in software design.&quot;**

&nbsp;&nbsp;&nbsp;&nbsp;**Types (Structural, Behavioral, Data Mapping)**

&nbsp;&nbsp;&nbsp;&nbsp;**Samples**

☐ Domain Driven Design

&nbsp;&nbsp;&nbsp;&nbsp;[https://en.wikipedia.org/wiki/Domain-driven\_design](https://protect-us.mimecast.com/s/5j92CkRKElIkLZ0AHk3SVG)

**Domain-driven design**  ( **DDD** ) is a [software design](https://protect-us.mimecast.com/s/aSCOClYLGmC19DKmfgDUKT) approach [[1]](https://protect-us.mimecast.com/s/xVdrCmZ6Jnup0GY8f45rzL) focusing on modelling software to match a [domain](https://protect-us.mimecast.com/s/YjxsCn5XKotXyQLgCPRCmR) according to input from that domain&#39;s experts.

☐ Continuous Integration, Delivery, Deployment

&nbsp;&nbsp;&nbsp;&nbsp;**Differences between Delivery and Deployment**

☐ SOLID Principles

&nbsp;&nbsp;&nbsp;&nbsp;[**https://stackify.com/solid-design-liskov-substitution-principle/**](https://protect-us.mimecast.com/s/sfQWCo2KL0uDoJG5CE0snW)

&nbsp;&nbsp;&nbsp;&nbsp;**Single Responsibility, Open-Close, Liskov Substitution, Interface Segregation, Dependency Inversion**

☐ Code Smells

&nbsp;&nbsp;&nbsp;&nbsp;[**https://www.codegrip.tech/productivity/everything-you-need-to-know-about-code-smells/**](https://protect-us.mimecast.com/s/X9TLCpYKMqC9lPLqi3jPx9)

&nbsp;&nbsp;&nbsp;&nbsp;**Code smells**  are not bugs or errors. Instead, these are absolute  **violations**  of the  **fundamentals of developing**   **software**  that decrease the quality of code.

☐ Microservices

&nbsp;&nbsp;&nbsp;&nbsp;**Architectural style that approaches building applications as a suite of services, each running in its own process, communicating through lightweight mechanisms like simple HTTP or messaging.**

☐ Serverless

&nbsp;&nbsp;&nbsp;&nbsp;[**https://www.datadoghq.com/knowledge-center/serverless-architecture/#:~:text=Serverless%20architecture%20is%20an%20approach,storage%20systems%20at%20any%20scale**](https://protect-us.mimecast.com/s/J5kACqx5NrI14GrnfWhtDf) **.**

&nbsp;&nbsp;&nbsp;&nbsp;**Serverless architecture is an approach to software design that allows developers to build and run services without having to manage the underlying infrastructure. Developers can write and deploy code, while a cloud provider provisions servers to run their applications, databases, and storage systems at any scale.**

&nbsp;&nbsp;&nbsp;&nbsp;**Samples**

☐ Closures

&nbsp;&nbsp;&nbsp;&nbsp;**First class function with private variables bound to a lexical context.**

&nbsp;&nbsp;&nbsp;&nbsp;**Functions with access to variables from another function&#39;s context.**

☐ DevOps

&nbsp;&nbsp;&nbsp;&nbsp;**DevOps is a set of practices that combines software development and IT operations. It aims to shorten the systems development life cycle and provide continuous delivery with high software quality. DevOps is complementary with Agile software development; several DevOps aspects came from the Agile methodology**