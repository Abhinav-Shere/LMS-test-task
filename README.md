# LMS & Recommendation Microservices

A microservices-based **Learning Management System (LMS)** integrated with a **Recommendation Service**.  
The LMS handles courses and lessons using **CQRS + Event Sourcing (Sequent)**, while the Recommendation Service tracks user progress and suggests the next course.

---

## **TL;DR (Quick Start)**

```bash
# Clone repository
git clone https://github.com/Abhinav-Shere/LMS-test-task.git
cd LMS-test-task

# Build and start all services
docker-compose up --build

# Run tests
docker-compose exec lms-service bundle exec rspec
docker-compose exec recommendation-service bundle exec rspec

