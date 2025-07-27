---
title: Monitoring Guide
description: Monitor and track your gem-ci workflows, performance metrics, and repository health
---

# 📈 Monitoring Guide

*Comprehensive monitoring and analytics for your gem-ci automation workflows*

## 🎯 Overview

gem-ci provides built-in monitoring capabilities to track workflow performance, repository health, and automation effectiveness. This guide covers all monitoring features and how to leverage them.

## 📊 Built-in Monitoring

### **Workflow Metrics** (`08-monitoring.yml`)

**Automated Tracking**:
- ⏱️ **Workflow execution times**
- ✅ **Success/failure rates**  
- 💰 **GitHub Actions usage costs**
- 📈 **Performance trends over time**

**Schedule**: Weekly monitoring reports (Mondays at 4 AM UTC)

**Metrics Collected**:
```yaml
# Example metrics output
workflow_metrics:
  ci_workflow:
    avg_duration: "3m 45s"
    success_rate: "98.5%"
    total_runs: 127
    cost_estimate: "$2.35"
  
  security_workflow:
    avg_duration: "2m 15s" 
    success_rate: "100%"
    total_runs: 52
    cost_estimate: "$1.20"
```

### **Repository Health Monitoring**

**Health Indicators**:
- 🏥 **Overall repository health score**
- 📋 **Open issues and PR status**
- 🔄 **Workflow reliability metrics**
- 👥 **Community engagement levels**

**Health Score Calculation**:
```yaml
# Health factors (weighted)
code_quality: 25%        # RuboCop, test coverage
security_posture: 25%    # Vulnerability scans, updates
automation_health: 20%   # Workflow success rates
community_activity: 15%  # PR/issue activity
documentation: 15%       # Doc coverage, freshness
```

## 📈 Performance Analytics

### **Cost Optimization Tracking**

Monitor your GitHub Actions cost savings:

```yaml
# Cost comparison (before/after gem-ci optimizations)
previous_monthly_cost: "$45.60"
current_monthly_cost: "$9.20"
savings_percentage: "79.8%"
optimizations_applied:
  - "Single Ruby version (3.3)"
  - "Ubuntu runners only"
  - "Reduced scheduled frequency"
  - "Custom focused linting"
```

### **Workflow Performance Trends**

Track performance improvements over time:

```yaml
# 30-day performance trend
ci_workflow_trends:
  avg_duration:
    30_days_ago: "5m 23s"
    current: "3m 45s" 
    improvement: "30.3%"
  
  success_rate:
    30_days_ago: "94.2%"
    current: "98.5%"
    improvement: "4.6%"
```

## 🔍 Real-time Monitoring

### **PR Status Dashboard**

Real-time CI status in PR comments:

```markdown
## 🚀 CI Status Dashboard

| Workflow | Status | Duration | Details |
|----------|--------|----------|---------|
| CI | ✅ Passed | 3m 45s | [View run](link) |
| Security | ✅ Passed | 2m 15s | [View run](link) |
| Quality | ⏳ Running | 1m 30s | [View run](link) |

**Last updated**: 2 minutes ago
```

### **Slack Notifications**

Real-time workflow notifications to Slack:

**Success Notification**:
```json
{
  "text": "✅ CI Workflow Completed",
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": "*gem-ci* CI pipeline completed successfully\n*Duration:* 3m 45s\n*Branch:* main"
      }
    }
  ]
}
```

**Failure Notification**:
```json
{
  "text": "❌ Workflow Failed",
  "blocks": [
    {
      "type": "section", 
      "text": {
        "type": "mrkdwn",
        "text": "🚨 *gem-ci* workflow failed\n*Step:* security-scan\n*Error:* Vulnerability detected"
      }
    }
  ]
}
```

## 📊 Custom Metrics

### **Test Coverage Tracking**

Monitor test coverage trends:

```ruby
# In your test suite
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/test/'
  
  # Track coverage over time
  track_files 'lib/**/*.rb'
  minimum_coverage 90
  
  # Custom coverage groups
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Libraries', 'lib'
end
```

**Coverage Metrics**:
```yaml
coverage_metrics:
  current: "94.2%"
  target: "90%"
  trend: "+2.1% (30 days)"
  by_category:
    controllers: "96.8%"
    models: "98.1%"
    libraries: "91.4%"
```

### **Security Metrics**

Track security posture over time:

```yaml
security_metrics:
  vulnerabilities:
    critical: 0
    high: 0
    medium: 1
    low: 3
  
  dependency_updates:
    pending: 5
    auto_merged: 23
    manual_review: 2
  
  security_score: "A+"
  trend: "Stable"
```

## 🎛️ Monitoring Dashboard

### **GitHub Actions Insights**

Built-in GitHub insights for workflows:

**Access Path**: Repository → Insights → Actions

**Available Data**:
- 📊 **Usage analytics** - Action minutes used
- ⏱️ **Workflow run times** - Duration trends  
- 💰 **Cost analysis** - Spending by workflow
- 🔄 **Success rates** - Reliability metrics

### **Custom Dashboard Setup**

Create a monitoring dashboard using GitHub API:

```javascript
// Example monitoring script
const fetchWorkflowMetrics = async () => {
  const response = await fetch(
    'https://api.github.com/repos/owner/repo/actions/runs',
    {
      headers: {
        'Authorization': `token ${github_token}`,
        'Accept': 'application/vnd.github.v3+json'
      }
    }
  );
  
  const runs = await response.json();
  
  // Calculate metrics
  const metrics = {
    totalRuns: runs.total_count,
    successRate: calculateSuccessRate(runs.workflow_runs),
    avgDuration: calculateAvgDuration(runs.workflow_runs),
    costEstimate: estimateCost(runs.workflow_runs)
  };
  
  return metrics;
};
```

## 📱 Alerting System

### **Failure Alerts**

Automated alerts for workflow failures:

```yaml
# In workflow failure step
- name: Send failure alert
  if: failure()
  uses: slackapi/slack-github-action@v1.27.0
  with:
    channel-id: ${{ secrets.SLACK_ALERTS_CHANNEL }}
    payload: |
      {
        "text": "🚨 WORKFLOW FAILURE ALERT",
        "blocks": [
          {
            "type": "section",
            "text": {
              "type": "mrkdwn", 
              "text": "*Repository:* ${{ github.repository }}\n*Workflow:* ${{ github.workflow }}\n*Branch:* ${{ github.ref }}\n*Failed Step:* ${{ github.job }}"
            }
          },
          {
            "type": "actions",
            "elements": [
              {
                "type": "button",
                "text": {"type": "plain_text", "text": "View Logs"},
                "url": "${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}"
              }
            ]
          }
        ]
      }
```

### **Performance Degradation Alerts**

Alert when performance degrades:

```yaml
- name: Check performance regression
  run: |
    CURRENT_DURATION=${{ steps.timing.outputs.duration }}
    BASELINE_DURATION=${{ secrets.BASELINE_DURATION }}
    
    if [ $CURRENT_DURATION -gt $((BASELINE_DURATION * 120 / 100)) ]; then
      echo "Performance regression detected"
      curl -X POST -H 'Content-type: application/json' \
        --data '{"text":"⚠️ Performance regression in ${{ github.workflow }}"}' \
        ${{ secrets.SLACK_WEBHOOK_URL }}
    fi
```

## 🔄 Automated Reporting

### **Weekly Performance Reports**

Automated weekly reports via email/Slack:

```yaml
# .github/workflows/weekly-report.yml
name: Weekly Performance Report
on:
  schedule:
    - cron: '0 9 * * MON'  # Monday 9 AM UTC

jobs:
  generate-report:
    runs-on: ubuntu-latest
    steps:
      - name: Generate performance report
        run: |
          # Collect metrics from past week
          # Generate HTML report
          # Send via email/Slack
```

**Report Contents**:
- 📊 Workflow performance summary
- 💰 Cost analysis and savings  
- 🔒 Security posture updates
- 👥 Community activity metrics
- 📈 Trends and recommendations

### **Monthly Health Check**

Comprehensive monthly repository health assessment:

```yaml
# Monthly health metrics
health_report:
  overall_score: "A"
  improvements_needed:
    - "Increase test coverage in utilities module"
    - "Update 3 outdated dependencies"
  
  highlights:
    - "Zero security vulnerabilities"  
    - "98.5% CI success rate"
    - "30% performance improvement"
```

## 🛠️ Monitoring Tools Integration

### **Third-party Monitoring**

Integrate with external monitoring services:

```yaml
# Datadog integration example
- name: Send metrics to Datadog
  run: |
    curl -X POST "https://api.datadoghq.com/api/v1/series" \
      -H "Content-Type: application/json" \
      -H "DD-API-KEY: ${{ secrets.DATADOG_API_KEY }}" \
      -d '{
        "series": [{
          "metric": "github.workflow.duration",
          "points": [['${{ github.event.head_commit.timestamp }}', ${{ env.DURATION }}]],
          "tags": ["workflow:${{ github.workflow }}", "repo:${{ github.repository }}"]
        }]
      }'
```

### **Custom Monitoring Scripts**

Create custom monitoring scripts:

```bash
#!/bin/bash
# scripts/monitor-workflows.sh

# Fetch workflow data
WORKFLOW_DATA=$(gh api repos/$REPO/actions/runs --jq '.workflow_runs[:10]')

# Calculate metrics
SUCCESS_COUNT=$(echo $WORKFLOW_DATA | jq '[.[] | select(.conclusion=="success")] | length')
TOTAL_COUNT=$(echo $WORKFLOW_DATA | jq 'length')
SUCCESS_RATE=$((SUCCESS_COUNT * 100 / TOTAL_COUNT))

# Report metrics
echo "Success Rate: ${SUCCESS_RATE}%"
echo "Total Runs: ${TOTAL_COUNT}"

# Alert if success rate < 95%
if [ $SUCCESS_RATE -lt 95 ]; then
  echo "🚨 Success rate below threshold!"
  # Send alert
fi
```

## 📚 Monitoring Best Practices

### **Metric Selection**

Focus on actionable metrics:

✅ **Good Metrics**:
- Workflow success rates
- Performance trends
- Cost optimization impact
- Security vulnerability counts

❌ **Avoid These**:
- Vanity metrics without action items
- Too many metrics causing noise
- Metrics not tied to business value

### **Alert Management**

Effective alerting strategy:

- 🚨 **Critical**: Immediate action required (failures, security)
- ⚠️ **Warning**: Attention needed (performance degradation)  
- 📊 **Info**: Regular updates (weekly reports)

### **Data Retention**

Manage monitoring data effectively:

```yaml
data_retention:
  metrics: "90 days"
  logs: "30 days" 
  reports: "1 year"
  
cleanup_schedule:
  daily: "Remove logs older than 30 days"
  weekly: "Archive old metrics"
  monthly: "Generate historical reports"
```

## 🔍 Troubleshooting Monitoring

### **Common Issues**

**Metrics not updating:**
```bash
# Check workflow execution
gh run list --limit 10

# Verify monitoring workflow
gh workflow view monitoring
```

**Missing Slack notifications:**
```bash
# Test Slack integration
curl -X POST -H 'Content-type: application/json' \
  --data '{"text":"Test notification"}' \
  $SLACK_WEBHOOK_URL
```

**Performance regression alerts:**
```bash
# Review baseline metrics
cat .github/config/performance-baselines.yml

# Check current performance
./scripts/measure-performance.sh
```

## 🚀 Advanced Monitoring

### **Predictive Analytics**

Use historical data for predictions:

```python
# Example: Predict workflow failure probability
import pandas as pd
from sklearn.linear_model import LogisticRegression

# Load historical data
data = pd.read_csv('workflow-history.csv')

# Train model to predict failures
model = LogisticRegression()
model.fit(data[['duration', 'complexity', 'changes']], data['failed'])

# Predict current run
probability = model.predict_proba([[current_duration, complexity, changes]])
print(f"Failure probability: {probability[0][1]:.2%}")
```

### **Anomaly Detection**

Detect unusual patterns:

```yaml
# Anomaly detection workflow
- name: Detect anomalies
  run: |
    # Compare current metrics to historical baseline
    CURRENT_DURATION=${{ steps.measure.outputs.duration }}
    BASELINE_MEAN=${{ secrets.BASELINE_MEAN }}
    BASELINE_STDDEV=${{ secrets.BASELINE_STDDEV }}
    
    # Calculate z-score
    Z_SCORE=$(echo "($CURRENT_DURATION - $BASELINE_MEAN) / $BASELINE_STDDEV" | bc)
    
    # Alert if anomaly detected (z-score > 2)
    if [ $(echo "$Z_SCORE > 2" | bc) -eq 1 ]; then
      echo "🚨 Anomaly detected: duration significantly higher than normal"
    fi
```

---

**Ready to monitor your workflows?** Start with the built-in monitoring workflow and customize based on your specific needs!