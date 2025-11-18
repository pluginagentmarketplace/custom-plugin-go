# Developer Roadmap Plugin

A comprehensive learning and career development plugin for Claude Code, featuring 69+ developer roadmaps from [roadmap.sh](https://roadmap.sh) across 7 specialized domains.

## 🎯 Overview

This plugin transforms the developer-roadmap repository into an interactive Claude Code plugin with:

- **7 Specialized Agents**: Expert guidance across web development, programming languages, cloud/DevOps, AI/ML, data engineering, mobile technologies, and leadership
- **7 Invokable Skills**: Deep, practical knowledge for each specialization with hands-on examples
- **5 Slash Commands**: Navigate learning paths, assess skills, build projects, and plan careers
- **69+ Learning Paths**: Complete coverage of modern software development domains

## 📦 Plugin Structure

```
developer-roadmap/
├── .claude-plugin/
│   └── plugin.json                 # Plugin manifest
├── agents/                         # 7 specialized agents
│   ├── 01-web-development.md
│   ├── 02-programming-languages.md
│   ├── 03-cloud-devops.md
│   ├── 04-ai-machine-learning.md
│   ├── 05-data-engineering.md
│   ├── 06-mobile-technologies.md
│   └── 07-leadership-roles.md
├── commands/                       # 5 slash commands
│   ├── explore.md                 # Browse all roadmaps
│   ├── learn.md                   # Start learning path
│   ├── assess.md                  # Self-assessment
│   ├── projects.md                # Hands-on projects
│   └── career-path.md             # Career planning
├── skills/                         # 7 invokable skills
│   ├── web-development/
│   ├── programming-languages/
│   ├── cloud-devops/
│   ├── ai-machine-learning/
│   ├── data-engineering/
│   ├── mobile-technologies/
│   └── leadership-skills/
├── hooks/
│   └── hooks.json                 # Automation hooks
└── README.md
```

## 🚀 Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/kamranahmedse/developer-roadmap

# In Claude Code:
# 1. Add plugin from local path: ./developer-roadmap
# 2. Or add to marketplace when available
```

### Usage

#### Explore All Roadmaps
```
/explore
```
Discover all 69 developer roadmaps organized by category.

#### Start Learning
```
/learn web-development
/learn programming-languages
/learn cloud-devops
/learn ai-machine-learning
/learn data-engineering
/learn mobile-technologies
/learn leadership-roles
```

#### Assess Your Skills
```
/assess
```
Self-evaluate your knowledge across all domains.

#### Browse Projects
```
/projects
```
Find hands-on projects to practice and build your portfolio.

#### Plan Your Career
```
/career-path
```
Strategic career progression planning across 7 career paths.

## 🎓 Featured Agents

### 1. Web Development Expert
Master frontend, backend, and full-stack development. Covers React, Vue, Angular, Node.js, Python, Java, APIs, databases, and system design.

### 2. Programming Languages Master
Learn 10+ languages: JavaScript, Python, Java, Go, Rust, C++, Kotlin, PHP, and more. Frameworks, ecosystems, and career paths included.

### 3. Cloud & DevOps Specialist
AWS, Azure, GCP expertise. Docker, Kubernetes, Terraform, CI/CD, monitoring, and infrastructure as code.

### 4. AI & Machine Learning Engineer
From fundamentals to production. ML algorithms, deep learning, LLMs, prompt engineering, and MLOps.

### 5. Data Engineering & Databases
SQL mastery, database design, data pipelines, ETL/ELT, warehousing, and analytics.

### 6. Mobile & Emerging Technologies
React Native, Flutter, blockchain, game development, and cybersecurity.

### 7. Leadership & Specialized Roles
Engineering management, product management, UX design, technical writing, and developer relations.

## 💡 Learning Pathways

### Quick Entry (2-6 months)
- Prompt Engineering (2-4 months)
- Frontend Development (3-6 months)
- Data Analysis (6-9 months)

### Medium Timeline (6-12 months)
- Backend Development
- DevOps Engineering
- Data Engineering
- Mobile Development

### Long-term (12-24 months)
- Full-Stack Development
- ML Engineering
- System Architecture
- Leadership Roles

## 📊 Domains Covered

| Domain | Resources | Roles |
|--------|-----------|-------|
| **Web Development** | HTML, CSS, JS, React, Node.js, Django, Spring Boot | Frontend, Backend, Full-Stack |
| **Programming Languages** | 10+ languages with frameworks | Language specialists |
| **Cloud & DevOps** | AWS, Azure, GCP, Docker, K8s, Terraform | DevOps, SRE, Cloud Architect |
| **AI & Machine Learning** | Fundamentals, Deep Learning, LLMs, MLOps | ML Engineer, AI Engineer, MLOps |
| **Data Engineering** | SQL, NoSQL, Pipelines, Warehousing, Analytics | Data Engineer, Data Analyst, Analytics Eng |
| **Mobile & Emerging** | React Native, Flutter, Blockchain, Games, Security | Mobile Dev, Blockchain Dev, Game Dev |
| **Leadership & Soft Skills** | Management, Product, UX, Writing, DevRel | Engineering Manager, Product Manager, UX Designer |

## 🎯 Features

### 7 Specialized Agents
Each agent provides expert guidance, learning paths, best practices, and career progression strategies for their domain.

### 7 Invokable Skills
Practical skills with code examples, frameworks, tools, and hands-on learning approaches.

### 5 Slash Commands
- `/explore` - Discover all learning paths
- `/learn` - Start structured learning
- `/assess` - Self-evaluate skills
- `/projects` - Browse hands-on projects
- `/career-path` - Plan long-term career

### 69+ Learning Paths
Comprehensive coverage from roadmap.sh including:
- Core Development (7 paths)
- Programming Languages (11 paths)
- Cloud & Infrastructure (8 paths)
- AI & Machine Learning (7 paths)
- Data & Analytics (6 paths)
- Mobile Development (5 paths)
- Specializations (19 paths)

### Career Development
- 7 complete career paths from junior to senior
- Salary progression and compensation insights
- Specialization vs management track guidance
- Portfolio and interview preparation

## 📈 Career Paths Included

1. **Full-Stack Developer → Senior IC** (3-5 years)
2. **Backend Engineer → Architect** (4-6 years)
3. **DevOps Engineer → Platform Engineer → SRE** (3-5 years)
4. **Data Analyst → Data Engineer → ML Engineer** (4-7 years)
5. **Prompt Engineer → AI Engineer → ML Engineer** (2-5 years)
6. **Individual Contributor → Engineering Manager** (5-10 years)
7. **Full-Stack → Product Manager** (4-7 years)

## 🛠️ Technology Stack

### Frontend Skills
React, Vue.js, Angular, Next.js, TypeScript, CSS Frameworks

### Backend Skills
Node.js, Python, Java, Go, PHP, Ruby, databases

### DevOps & Cloud
AWS, Azure, GCP, Docker, Kubernetes, Terraform, Jenkins

### Data & AI
SQL, Python, Spark, Airflow, dbt, TensorFlow, PyTorch

### Mobile
React Native, Flutter, iOS Swift, Android Kotlin

### Leadership
Management, product strategy, UX/design, technical writing

## 📚 Project Examples

### Web Development
- Todo app, weather app, blog platform, e-commerce site, social media, chat app

### Cloud & DevOps
- Containerized apps, Kubernetes deployments, IaC setup, CI/CD pipelines, multi-region systems

### Data Engineering
- SQL analysis, ETL pipelines, data warehouses, analytics dashboards

### AI & ML
- Chatbots, image classification, RAG systems, fine-tuned models

### Mobile
- Notes app, social app, e-commerce, real-time chat

### Leadership
- Lead projects, mentor developers, write technical content, design features

## 🎓 Learning Resources

Each skill and agent includes:
- **Code Examples**: Working, copy-paste ready code
- **Best Practices**: Industry standards and patterns
- **Tools & Frameworks**: Current ecosystem overview
- **Learning Timeline**: Realistic progression expectations
- **Career Paths**: How to advance in each domain
- **Project Ideas**: Hands-on practice opportunities
- **Resources**: Recommended courses, books, communities

## 🔄 Plugin Integration

### How It Works

1. **Agent Selection**: Claude automatically selects the right agent based on your question
2. **Skill Invocation**: Agents invoke skills when detailed knowledge is needed
3. **Command Execution**: Slash commands guide you through structured learning
4. **Progressive Learning**: Content scales from beginner to expert level

### Customization

Extend the plugin by:
- Adding new agents for emerging roles
- Creating specialized skills for your organization
- Custom commands for your learning style
- Hooks for tracking progress and engagement

## 📝 Documentation

### For Agents
Each agent markdown file includes:
- Description and specializations
- Core concepts and best practices
- Learning timelines
- Career progression
- Decision points and trade-offs

### For Skills
Each SKILL.md file features:
- Quick start with code examples
- Core concepts explained
- Frameworks and tools
- Learning paths by level
- Hands-on projects
- Best practices

### For Commands
Each command provides:
- Interactive guidance
- Assessment frameworks
- Project catalogs
- Career templates

## 🤝 Contributing

Contributions are welcome! Consider:
- Adding new agents for emerging technologies
- Expanding learning paths with new resources
- Contributing projects and examples
- Improving documentation
- Adding assessments and quizzes

## 📄 License

This plugin is built on [developer-roadmap](https://github.com/kamranahmedse/developer-roadmap) by Kamran Ahmed, which is licensed under the CC BY-NC-SA 4.0 license.

## 🔗 References

- **Source**: [kamranahmedse/developer-roadmap](https://github.com/kamranahmedse/developer-roadmap)
- **Website**: [roadmap.sh](https://roadmap.sh)
- **Claude Code**: [Claude Code Docs](https://docs.claude.com)

## 📞 Support

For issues or questions:
- GitHub Issues: Report bugs or suggest features
- Discussions: Ask questions and share ideas
- Community: Join developer communities (Dev.to, Hashnode, Discord)

---

**Ready to start your learning journey?** Use `/explore` to discover all available paths, or `/learn [domain]` to begin focused learning!
