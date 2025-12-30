# SkillPath

#### Video Demo: https://youtu.be/u0OlJrgRjrM

#### Description:

SkillPath is a full-stack learning platform designed to help users learn programming through structured courses,
lessons, and hands-on practice.  
The core idea of the project is to combine traditional course-based learning with a modern, scalable system architecture
that reflects real-world software development.

I built SkillPath as my CS50x final project to push myself beyond a simple CRUD application and to explore
backend-focused concepts such as microservices, authentication flows, API gateways, and containerized development.

---

## What the Project Does

SkillPath allows users to browse programming courses, explore lessons, and track their learning progress.  
The platform is designed with future interactive coding challenges in mind, where users will be able to write and
execute code in an isolated environment.

The frontend communicates with the backend through a single entry point using the Backend For Frontend (BFF) pattern.
This keeps the client simple while allowing the backend to evolve internally without breaking the user interface.

---

## Project Structure

The project is organized as a monorepo shell that uses Git submodules.  
This approach keeps the frontend and backend in separate repositories while allowing them to work together as a single
system.

### Frontend (`skillpath-frontend`)

- Built with **Next.js (App Router)**
- Responsible for UI, routing, and client-side state
- Communicates only with the BFF service
- Designed with scalability and SEO considerations

### Backend (`skillpath-backend`)

The backend is implemented as a NestJS monorepo containing several services:

- **BFF (Backend For Frontend)**  
  Acts as the single API entry point for the frontend.  
  It aggregates data from internal services and exposes a clean, frontend-friendly API.

- **Auth Service**  
  Handles user authentication, password management, and token-based security.  
  Authentication logic is isolated to keep other services focused on their domain logic.

- **Courses Service**  
  Manages courses, lessons, and learning-related data.  
  This separation prevents the system from becoming a tightly coupled monolith.

- **Notifications Service**  
  Responsible for sending emails such as password reset messages.  
  This service communicates asynchronously and is designed for future extensions.

---

## Design Decisions

### Microservices Architecture

Instead of building a single monolithic backend, I chose a microservices-based architecture.  
This decision improves separation of concerns and reflects how modern backend systems are often structured.

Although this approach adds complexity, it provides flexibility and valuable real-world experience.

### Backend For Frontend (BFF)

The BFF pattern was chosen to:

- Reduce complexity on the frontend
- Centralize API logic
- Expose only the data the client actually needs

### Dockerized Development

The entire project is designed to run using Docker and Docker Compose.  
This ensures consistent development environments and simplifies setup for new contributors.

---

## Files and Configuration

- `Makefile`  
  Contains helper commands for initializing and running the project.

- `.env.example` files  
  Used as templates for configuring environment variables for each service.

- `docs/` directory  
  Contains architecture diagrams and entity relationship visuals.

---

## Challenges and Trade-offs

One of the main challenges was balancing architectural complexity with feature completeness.  
I intentionally focused on building a clean and scalable foundation rather than implementing every possible feature.

Designing service boundaries and communication patterns required careful planning to avoid unnecessary coupling.

---

## Future Improvements

Planned improvements include:

- Secure execution of user-submitted code
- Real-time progress updates
- AI-assisted feedback for coding challenges
- Enhanced course authoring tools

The current architecture was designed with these future features in mind.

---

## Final Notes

SkillPath represents my technical growth throughout CS50x and my interest in backend engineering and system design.  
This project demonstrates not only functionality, but also thoughtful architectural decisions and long-term planning.

Thank you for taking the time to review my project.