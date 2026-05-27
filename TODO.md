
# TODO - Jenkins Terraform -> Ansible -> Kubectl pipeline

## Step 1: Repository understanding (read-only)
- [x] Read `jenkins/Jenkinsfile`
- [x] Read `terraform/main.tf`
- [x] Read `terraform/modules/keypair/main.tf`
- [x] Read `terraform/modules/ec2/main.tf`
- [x] Read `terraform/variables.tf`, `terraform/provider.tf`, `terraform/outputs.tf`
- [x] Read `ansible/playbook.yml`, `ansible/ansible.cfg`
- [ ] Locate and validate `ansible/inventory.ini` and `terraform/templates/inventory.tpl` usage

## Step 2: Fix pipeline correctness
- [ ] Ensure Terraform outputs include public IPs and are accessible from Jenkins at runtime
- [ ] Ensure Ansible inventory is generated correctly (fix template path or inventory generation)
- [ ] Make Jenkins pass a correct `KUBECONFIG`/admin.conf retrieval workflow (avoid missing files)
- [ ] Ensure `kubectl` commands run from Jenkins with the right kubeconfig/namespace

## Step 3: Make infra idempotent
- [ ] Add waits/retries for SSH reachability and for kubeadm init readiness
- [ ] Add `kubeadm join` token reuse strategy to avoid token expiry
- [ ] Ensure `kubectl apply` is safe to rerun (use namespaces/create-if-not-exist)

## Step 4: Run test
- [ ] Jenkins dry run / local simulation: `terraform init && terraform apply`
- [ ] `ansible-playbook playbook.yml` from Jenkins workspace
- [ ] `kubectl get nodes` and verify deployment rollout

