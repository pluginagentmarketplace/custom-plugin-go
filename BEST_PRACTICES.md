# Industry Best Practices

## Code Quality Standards

### Before Commit
- ✅ Tests pass (unit + integration)
- ✅ Linting passes (prettier, eslint)
- ✅ Type checking (TypeScript, mypy)
- ✅ Code coverage > 80%
- ✅ Documentation updated
- ✅ No secrets in repo
- ✅ Performance reviewed

### Code Review Checklist
- ✅ Does it solve the problem?
- ✅ Is it maintainable?
- ✅ Security: no vulns?
- ✅ Performance: acceptable?
- ✅ Tests adequate?
- ✅ Docs complete?
- ✅ No dead code?

## Security Checklist

- [ ] HTTPS only (TLS 1.3)
- [ ] Input validation (all)
- [ ] SQL injection prevention
- [ ] XSS prevention (escaping)
- [ ] CSRF tokens (forms)
- [ ] Rate limiting (auth)
- [ ] Secure passwords (bcrypt)
- [ ] Secrets managed (vault)
- [ ] Dependency scanning
- [ ] Regular updates

## Performance Standards

### Frontend
- Core Web Vitals: LCP < 2.5s, FID < 100ms, CLS < 0.1
- Lighthouse score: > 80
- Bundle size: < 300KB (gzipped)
- API responses: < 200ms

### Backend
- Response time: < 200ms (95th percentile)
- Error rate: < 0.1%
- Database query: < 100ms
- API endpoint: < 500ms

### Database
- Query response: < 100ms
- Index coverage: > 95%
- Query plans reviewed: yes
- Slow log monitored: yes

## DevOps Standards

### Deployment
- [ ] Tests pass
- [ ] Code reviewed
- [ ] Staging tested
- [ ] Rollback plan ready
- [ ] Monitoring alerting on
- [ ] Documentation updated
- [ ] Team notified
- [ ] Deployment automated

### Monitoring
- [ ] Error rate dashboard
- [ ] Performance metrics
- [ ] Business KPIs
- [ ] Infrastructure metrics
- [ ] Alert thresholds set
- [ ] Incident runbook ready
- [ ] On-call rotation

### Scaling
- [ ] Load tested
- [ ] Auto-scaling configured
- [ ] Database optimized
- [ ] Caching strategy
- [ ] CDN configured
- [ ] Capacity planned

## Documentation Standards

### Code Documentation
- [ ] README explains purpose
- [ ] Installation documented
- [ ] Usage examples provided
- [ ] Configuration explained
- [ ] Dependencies listed
- [ ] Known issues noted
- [ ] Contribution guidelines

### API Documentation
- [ ] Endpoints documented
- [ ] Request/response examples
- [ ] Error codes explained
- [ ] Authentication method
- [ ] Rate limits specified
- [ ] Versioning strategy
- [ ] Deprecation policy

### System Documentation
- [ ] Architecture diagram
- [ ] Component descriptions
- [ ] Data flow explained
- [ ] Deployment process
- [ ] Troubleshooting guide
- [ ] Runbooks for operations
- [ ] Disaster recovery plan

## Team Practices

### Code Review
- Target: Reviews within 24h
- Tone: Helpful, constructive
- Focus: Logic, not style
- Approval: Before merge
- CI/CD: All checks pass

### Communication
- Async first (documentation)
- Sync when needed (calls)
- Clear titles (issues, PRs)
- Actionable feedback
- Prompt responses

### Meetings
- Have agenda
- Start/end on time
- Record decisions
- Assign owners
- Follow up
