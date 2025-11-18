---
name: web-development
description: Master frontend (React, Vue, Angular), backend (Node.js, Python, Java), and full-stack development. Build scalable web applications with modern frameworks, APIs, databases, and system design principles.
---

# Web Development Skills

## Quick Start

Build a modern web application using your chosen tech stack:

### Frontend Development
```javascript
// React example - Modern component with hooks
import { useState, useEffect } from 'react';

function TodoApp() {
  const [todos, setTodos] = useState([]);
  const [input, setInput] = useState('');

  const addTodo = () => {
    setTodos([...todos, { id: Date.now(), text: input }]);
    setInput('');
  };

  return (
    <div>
      <input value={input} onChange={(e) => setInput(e.target.value)} />
      <button onClick={addTodo}>Add</button>
      <ul>
        {todos.map(todo => <li key={todo.id}>{todo.text}</li>)}
      </ul>
    </div>
  );
}

export default TodoApp;
```

### Backend Development
```python
# Python FastAPI example - Modern async API
from fastapi import FastAPI
from typing import List

app = FastAPI()

todos = []

@app.get("/todos", response_model=List[dict])
async def get_todos():
    return todos

@app.post("/todos")
async def create_todo(text: str):
    todo = {"id": len(todos) + 1, "text": text}
    todos.append(todo)
    return todo

@app.delete("/todos/{todo_id}")
async def delete_todo(todo_id: int):
    global todos
    todos = [t for t in todos if t["id"] != todo_id]
    return {"deleted": todo_id}
```

## Core Concepts

### Frontend Stack
- **HTML/CSS**: Document structure and styling
- **JavaScript**: Interactivity and dynamic behavior
- **React/Vue/Angular**: Component frameworks for modern UX
- **State Management**: Managing application state efficiently
- **API Integration**: Consuming REST and GraphQL APIs
- **Testing**: Unit tests, integration tests, E2E tests
- **Performance**: Optimization, bundling, lazy loading
- **Accessibility**: WCAG standards, inclusive design

### Backend Stack
- **Server Setup**: Express.js, Django, Spring Boot, Gin
- **Routing**: URL mapping, HTTP methods, middleware
- **Authentication**: JWT, OAuth 2.0, session management
- **Databases**: SQL design, NoSQL trade-offs, migrations
- **APIs**: RESTful design, GraphQL, gRPC
- **Caching**: Redis, in-memory caching strategies
- **Performance**: Optimization, scalability patterns
- **Testing**: Unit tests, API tests, mocking

### Full-Stack Architecture
- **Client-Server Communication**: Request/response cycle
- **Database Design**: Schema, relationships, optimization
- **Microservices**: Service decomposition, communication
- **DevOps**: Docker, Kubernetes, CI/CD
- **Monitoring**: Logging, metrics, alerting
- **Security**: Input validation, encryption, HTTPS

## Learning Resources

### Frontend Paths
1. **HTML/CSS/JavaScript Fundamentals** (2-3 weeks)
   - Learn semantic HTML
   - CSS layouts and flexbox
   - JavaScript DOM manipulation

2. **Pick a Framework** (4-8 weeks)
   - **React**: Largest ecosystem, component-based
   - **Vue**: Approachable, excellent documentation
   - **Angular**: Enterprise-grade, comprehensive

3. **State Management** (2-3 weeks)
   - Context API or Redux/MobX
   - Global state management patterns

4. **Advanced Topics** (4-8 weeks)
   - Performance optimization
   - Testing frameworks
   - Build tools and bundling

### Backend Paths
1. **Choose a Language** (4-6 weeks)
   - JavaScript/Node.js - Full-stack with frontend
   - Python - Versatile, great frameworks
   - Java - Enterprise, strong ecosystem
   - Go - Cloud-native, performance

2. **Framework Fundamentals** (4-6 weeks)
   - Routing and middleware
   - Request handling
   - Response generation

3. **Database Integration** (3-4 weeks)
   - SQL and relational databases
   - ORMs and query builders
   - Data migration strategies

4. **Advanced Topics** (4-8 weeks)
   - Authentication and authorization
   - API design best practices
   - Scalability patterns

## Hands-On Projects

### Beginner
- **Todo Application**: CRUD operations, basic state management
- **Weather App**: API integration, data fetching
- **Portfolio Site**: Static site, responsive design

### Intermediate
- **Blog Platform**: User authentication, database, search
- **Social Media**: Real-time updates, file uploads
- **E-commerce**: Product catalog, shopping cart, payments

### Advanced
- **Microservices Architecture**: Multiple services, communication
- **Real-time Chat**: WebSockets, presence, notifications
- **Analytics Dashboard**: Data visualization, complex queries

## Important Concepts

### Responsive Design
Build applications that work across all devices using:
- Mobile-first approach
- Flexible layouts (Flexbox, Grid)
- Media queries
- Viewport settings

### Performance Optimization
- **Frontend**: Code splitting, lazy loading, caching
- **Backend**: Database indexing, query optimization
- **Network**: Compression, CDN, HTTP/2
- **Rendering**: Virtual DOM, shouldComponentUpdate

### Security Best Practices
- **Input Validation**: Sanitize all user inputs
- **Authentication**: Strong password policies, MFA
- **Authorization**: Principle of least privilege
- **Data Protection**: Encryption, HTTPS, secure cookies
- **OWASP Top 10**: Common vulnerabilities

## Testing Strategy

### Frontend Testing
- **Unit Tests**: Jest, Vitest for components
- **Integration Tests**: Testing component interaction
- **E2E Tests**: Cypress, Playwright for user flows
- **Accessibility Testing**: axe-core, manual testing

### Backend Testing
- **Unit Tests**: pytest, Jest for business logic
- **Integration Tests**: Database interaction
- **API Tests**: Testing endpoints, status codes
- **Load Tests**: Performance under stress

## Deployment

### Frontend Deployment
- **Static Hosting**: Netlify, Vercel, GitHub Pages
- **Container**: Docker + cloud platforms
- **CDN**: Global content distribution
- **CI/CD**: Automated testing and deployment

### Backend Deployment
- **Cloud Platforms**: AWS, Azure, GCP
- **Containers**: Docker + Kubernetes
- **Serverless**: AWS Lambda, Azure Functions
- **Traditional**: VPS, dedicated servers

## Common Tech Stacks

- **MERN**: MongoDB, Express, React, Node.js
- **MEAN**: MongoDB, Express, Angular, Node.js
- **LAMP**: Linux, Apache, MySQL, PHP
- **FULL-STACK PYTHON**: Django/FastAPI + React
- **ASP.NET**: C#, Entity Framework, React/Blazor

## Key Takeaways

1. Choose your specialization (frontend, backend, or full-stack)
2. Master fundamentals before advanced concepts
3. Build projects to reinforce learning
4. Stay updated with evolving technologies
5. Focus on architecture and design patterns
6. Prioritize testing and code quality
7. Consider performance and security from the start

## Related Skills

- **Cloud & DevOps**: Deployment and infrastructure
- **Programming Languages**: Backend language expertise
- **Data Engineering**: Database design and optimization
- **AI/ML**: Intelligent feature integration
- **Mobile Technologies**: Cross-platform development

---

*For detailed learning paths and mentorship, use `/learn web-development`*
