const express = require('express');
const app = express();
const PORT = process.env.PORT || 80;

// Read config injected by Kubernetes ConfigMap & Secrets
const environment = process.env.ENVIRONMENT || 'Development';
const backendUrl = process.env.BACKEND_API_URL || 'Not Connected';

app.get('/', (req, res) => {
    res.send(`
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>DevOps Automation Platform</title>
            <style>
                body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #0f172a; color: #f8fafc; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
                .card { background-color: #1e293b; padding: 30px; border-radius: 12px; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.3); border-top: 5px solid #3b82f6; width: 450px; }
                h1 { color: #3b82f6; margin-top: 0; font-size: 24px; text-align: center; }
                .status-container { margin-top: 20px; }
                .status-item { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #334155; }
                .status-label { font-weight: 600; color: #94a3b8; }
                .status-value { color: #10b981; font-weight: bold; }
                .footer { text-align: center; margin-top: 25px; font-size: 12px; color: #64748b; }
            </style>
        </head>
        <body>
            <div class="card">
                <h1>🚀 DevOps Automation Platform</h1>
                <p style="text-align: center; color: #94a3b8;">1-Click Architecture Deployment Live on AWS</p>
                <div class="status-container">
                    <div class="status-item">
                        <span class="status-label">Application Status:</span>
                        <span class="status-value">🟢 RUNNING</span>
                    </div>
                    <div class="status-item">
                        <span class="status-label">Environment Target:</span>
                        <span class="status-value" style="color: #3b82f6;">${environment.toUpperCase()}</span>
                    </div>
                    <div class="status-item">
                        <span class="status-label">Orchestration Layer:</span>
                        <span class="status-value" style="color: #a855f7;">Kubernetes (K8s)</span>
                    </div>
                    <div class="status-item">
                        <span class="status-label">Internal API Endpoint:</span>
                        <span class="status-value" style="color: #eab308; font-size: 14px;">${backendUrl}</span>
                    </div>
                </div>
                <div class="footer">
                    Built with Terraform, Ansible, Docker, Jenkins & Prom/Grafana
                </div>
            </div>
        </body>
        </html>
    `);
});

app.listen(PORT, () => {
    console.log(`Application server explicitly initialized and listening on port ${PORT}`);
});