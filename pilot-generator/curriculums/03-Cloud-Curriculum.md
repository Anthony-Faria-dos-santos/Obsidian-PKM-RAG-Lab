---
titre: "Cloud & Infrastructure 2026, Carnet de Route Complet"
domaine: D3-Cloud
type: curriculum
statut: vivant
créé: 2026-04-22
révisé: 2026-04-22
valide_jusqu_a: 2026-10-22
tags: [cloud, aws, azure, gcp, kubernetes, iac, terraform, devops, finops, curriculum, roadmap]
liens: ["[[00-Architecture-Vault-Second-Brain]]", "[[01-Developer-2026-Curriculum]]", "[[02-Cybersec-Curriculum]]", "[[05-Reseaux-Cert-Roadmap]]"]
---

# Cloud & Infrastructure 2026, Carnet de Route Complet

> Document compagnon du vault. Décrit la progression recommandée pour maîtriser le cloud, le conteneur, l'IaC, l'observabilité et le FinOps en 2026, calibrée pour un profil alternance dev/cybersec.

## 0. Le cloud en 2026, paysage réel

### 0.1 Les cinq ruptures de 2024-2026

1. **Consolidation sur les trois hyperscalers**. AWS reste leader mondial en part de marché, Azure domine en grande entreprise européenne et dans l'intégration Microsoft (AD, M365, Copilot), GCP reste fort en data et ML. OVHcloud et Scaleway remontent en France pour des raisons de souveraineté (SecNumCloud).
2. **Kubernetes est devenu le standard de facto**. La question n'est plus "K8s ou pas" mais "managé ou non, où, avec quelle stack GitOps". Les offres managées (EKS, AKS, GKE) dominent.
3. **IaC multi-cloud**. Terraform reste le standard de fait, OpenTofu (fork open source suite au relicensing HashiCorp BSL) a gagné en adoption, Pulumi attire pour le typage fort. Ansible reste dominant sur la configuration.
4. **FinOps devient obligatoire**. Les factures cloud explosent avec la charge IA (GPU, inférence). Les entreprises cherchent des profils capables d'optimiser les coûts, pas juste de déployer.
5. **Souveraineté et régulation**. NIS2, DORA, AI Act, schéma SecNumCloud, Cloud de confiance (Bleu Microsoft/Orange/Capgemini, S3NS Thales/Google). Le cloud n'est plus neutre politiquement.

### 0.2 Choix stratégique pour Anthony

| Critère | AWS | Azure | GCP | OVHcloud |
|---|---|---|---|---|
| Part marché France entreprise | Forte | Très forte (MS ecosystem) | Moyenne | Moyenne-forte (souveraineté) |
| Intégration alternance typique | Bonne | Excellente | Moyenne | Bonne (secteur public) |
| Plan Edu / gratuit | AWS Free Tier + AWS Educate | Azure for Students (crédit 100 USD) | GCP Free Tier + crédits étudiants | Plan découverte |
| Catalogue services | Le plus large | Large, très intégré MS | Data/ML excellent | Plus restreint, en croissance |
| Cert entry pertinente | Cloud Practitioner (CLF-C02) | AZ-900 | Cloud Digital Leader | Pas de cert formelle majeure |

**Recommandation Anthony** : commencer par **Azure** (alternance France + intégration AD + M365 + Intune omniprésente), puis **AWS** (leader mondial, incontournable pour toute boîte produit/startup), puis **GCP** en T4 pour la partie data/ML. OVHcloud/Scaleway en exposition ponctuelle (homelab + souveraineté).

## 1. Progression par paliers

### T0, Prérequis (transverse avec D2 Dev et D5 Réseau)

- Linux solide, CLI bash, ssh, sudo, systemd (voir [[02-Cybersec-Curriculum]] C1.9)
- Git et GitHub (voir [[01-Developer-2026-Curriculum]] C2.2.1)
- Réseau TCP/IP, DNS, HTTP, TLS (voir [[05-Reseaux-Cert-Roadmap]])
- Python basique pour scripts (voir [[01-Developer-2026-Curriculum]] C2.3A)

**Validation T0** : déployer une VM Linux, y installer un service (Nginx), exposer via nom de domaine avec certificat Let's Encrypt, comprendre chaque étape.

### T1, Cloud fundamentals (3 mois)

Objectif : maîtriser les concepts transverses (IaaS/PaaS/SaaS, régions/AZ, IAM, réseau cloud, stockage, compute) et passer une cert entry de chaque hyperscaler cible.

Clusters : C3.1 (Concepts généraux), C3.2 (Azure fundamentals), C3.3 (AWS fundamentals).

**Certifications T1** :
- **AZ-900 Azure Fundamentals** (Microsoft Learn gratuit + voucher étudiant)
- **CLF-C02 AWS Cloud Practitioner** (AWS Skill Builder + voucher 50% étudiant)
- Optionnel : **Cloud Digital Leader GCP** (formation gratuite Google)

### T2, Compute + stockage + réseau managés (6 mois)

Objectif : déployer réellement des workloads cloud (VMs, conteneurs, load balancers, bases managées, object storage, VPC/VNet) sur au moins un cloud.

Clusters : C3.4 (IAM avancé), C3.5 (Réseau cloud), C3.6 (Stockage et bases managées).

**Certifications T2** (choisir selon l'alternance) :
- Azure : **AZ-104 Administrator** (référence admin Azure)
- AWS : **SAA-C03 Solutions Architect Associate** (référence archi AWS)
- GCP : **Associate Cloud Engineer** (moins prioritaire)

### T3, Conteneurs + Kubernetes + IaC (6-9 mois)

Objectif : maîtriser Docker, écrire des manifestes K8s, utiliser Helm, déployer avec Terraform/OpenTofu, construire un pipeline CI/CD GitOps.

Clusters : C3.7 (Conteneurs), C3.8 (Kubernetes), C3.9 (IaC), C3.10 (CI/CD et GitOps).

**Certifications T3** :
- **CKA Certified Kubernetes Administrator** (Linux Foundation, référence K8s, ~40% réduction avec coupon étudiant régulier)
- **CKAD Certified Kubernetes Application Developer** (complément dev)
- Optionnel : **HashiCorp Terraform Associate** (Edu discount existant)

### T4, Observabilité + sécurité cloud + FinOps (ongoing)

Objectif : passer du "je déploie" au "je rends un service fiable et rentable". Métriques, traces, logs, cost management, sécurité cloud (CSPM).

Clusters : C3.11 (Observabilité), C3.12 (Sécurité cloud, transverse avec D1), C3.13 (FinOps).

**Certifications T4** :
- **AZ-305 Azure Solutions Architect Expert** ou **SAP-C02 AWS Solutions Architect Professional**
- **AZ-500 Azure Security Engineer** ou **SCS-C02 AWS Security Specialty** (transverse D1, voir [[02-Cybersec-Curriculum]] C1.12)
- **CKS Certified Kubernetes Security Specialist** (prérequis CKA)
- **FinOps Certified Practitioner** (FOCP, FinOps Foundation)

### T5, Spécialisations et SRE (Y3+)

- **SRE** (Site Reliability Engineering), SLO/SLI/error budget, Google SRE books
- **Data platform** (voir [[04-AI-ML-Curriculum]] intersection)
- **Edge / CDN / serverless** (Cloudflare Workers, Lambda@Edge)
- **Platform engineering** (Backstage, developer portals)

## 2. Clusters détaillés avec sous-thèmes

### C3.1, Cloud concepts généraux et souveraineté

Sous-thèmes :
- Modèles de service : IaaS, PaaS, SaaS, FaaS (serverless), CaaS (conteneurs)
- Modèles de déploiement : public, privé, hybride, multi-cloud
- Shared responsibility model (par hyperscaler)
- Régions, zones de disponibilité, edge locations
- SLA cloud et calcul de disponibilité composée
- Souveraineté : SecNumCloud (ANSSI), EUCS (ENISA), Cloud de confiance (Bleu, S3NS, Numspot)
- Lois extra-territoriales : CLOUD Act US, GDPR
- Localisation des données vs contrôle juridique
- Schrems II, clauses contractuelles types (SCC)

Livrable type : note `C3.1-responsabilite-partagee.md` avec tableau comparatif IaaS/PaaS/SaaS responsabilités.

### C3.2, Azure fundamentals et écosystème Microsoft

Sous-thèmes :
- Azure subscriptions, management groups, resource groups
- Azure AD / Entra ID (voir [[02-Cybersec-Curriculum]] C1.5)
- Azure Resource Manager (ARM), Bicep
- Services core : Compute (VM, AVS, VMSS), App Service, Functions, AKS
- Storage : Blob, Files, Queue, Table, Disk
- Database : SQL Database, Cosmos DB, PostgreSQL Flexible Server
- Networking : VNet, NSG, Azure Firewall, Application Gateway, Front Door, Private Link
- Monitoring : Azure Monitor, Log Analytics, Application Insights
- Intégration M365 : Intune, Defender, Purview
- Azure Arc (hybrid management)
- Copilot for Azure

Certification : **AZ-900** puis **AZ-104**.

### C3.3, AWS fundamentals

Sous-thèmes :
- AWS accounts, Organizations, Control Tower, Landing Zones
- IAM : users, groups, roles, policies, SCPs, IAM Identity Center (ex SSO)
- Services core : EC2, Lambda, ECS, EKS, Fargate, Lightsail
- Storage : S3 (classes de stockage), EBS, EFS, FSx, Glacier
- Database : RDS, Aurora, DynamoDB, ElastiCache, Redshift, Athena
- Networking : VPC, subnets, route tables, IGW/NGW, TGW, PrivateLink, Direct Connect
- CDN/DNS : CloudFront, Route 53
- Monitoring : CloudWatch, X-Ray, CloudTrail
- Well-Architected Framework (6 piliers : OpsExcel, Security, Reliability, Performance, Cost, Sustainability)

Certification : **CLF-C02** puis **SAA-C03**.

### C3.4, IAM cloud avancé et identité fédérée

Sous-thèmes :
- Principes : least privilege, just-in-time access, PIM (Azure)
- Azure : Entra ID roles vs RBAC Azure, groups, PIM, Conditional Access
- AWS : IAM users/roles/policies, Permissions Boundaries, ABAC, STS, AssumeRole cross-account
- GCP : IAM primitives, predefined roles, custom roles, Workload Identity
- Fédération : SAML, OIDC, Workforce Identity Federation (AWS), Workload Identity (GCP/AKS)
- Secrets : Azure Key Vault, AWS Secrets Manager, GCP Secret Manager, HashiCorp Vault
- Machine identities : service principals (Azure), IAM roles for service accounts (AWS IRSA), Workload Identity (GCP)
- Intégration SSO avec CI/CD (OIDC GitHub Actions → AWS/Azure/GCP, sans credentials long-lived)
- Attaques classiques IAM : SSRF + metadata service, credential leak, over-privileged role (voir [[02-Cybersec-Curriculum]] C1.12)

Livrable : `C3.4-oidc-github-actions-aws.md` (procédure détaillée sans secret).

### C3.5, Réseau cloud

Sous-thèmes :
- VPC/VNet design : CIDR planning, subnets publics/privés, NAT Gateway coûts
- Peering, Transit Gateway (AWS), Virtual WAN (Azure), Network Connectivity Center (GCP)
- Load balancing : L4 vs L7, NLB/ALB (AWS), Azure LB/App Gateway, GCP LB (global anycast)
- CDN : CloudFront, Azure Front Door, Cloud CDN, Cloudflare
- DNS managé : Route 53, Azure DNS, Cloud DNS
- Connectivité hybride : VPN site-to-site, Direct Connect, ExpressRoute
- Private endpoints / PrivateLink / Service Endpoints : éviter l'exposition Internet des services PaaS
- Egress control : NAT Gateway, Azure NAT, Cloud NAT
- Service Mesh : Istio, Linkerd, AWS App Mesh, Azure Service Fabric Mesh

Complément : voir [[05-Reseaux-Cert-Roadmap]] C5.4 pour les fondamentaux WAN/SD-WAN.

### C3.6, Stockage et bases managées

Sous-thèmes :
- Object storage : S3, Azure Blob, GCS. Classes de stockage (hot/cool/cold/archive), lifecycle, versioning, replication
- Block storage : EBS, Azure Disk, Persistent Disk. Types SSD/HDD, IOPS, throughput
- File storage : EFS, Azure Files (SMB/NFS), Filestore
- Relational : RDS/Aurora (AWS), Azure SQL/PostgreSQL Flexible (MS), Cloud SQL/AlloyDB (GCP)
- NoSQL : DynamoDB, Cosmos DB, Firestore, Bigtable
- Analytics : Redshift, Synapse, BigQuery (le plus simple d'usage)
- Cache : ElastiCache (Redis), Azure Cache for Redis, Memorystore
- Search : OpenSearch, Azure AI Search, Vertex AI Search
- Vector DB (transverse IA) : Pinecone managé, pgvector sur Postgres managé, Azure AI Search vector, Vertex Vector Search (voir [[04-AI-ML-Curriculum]])

### C3.7, Conteneurs, Docker et OCI

Sous-thèmes :
- Pourquoi des conteneurs (isolation légère, reproductibilité, densité)
- Images OCI : layers, cache, multi-stage builds
- Dockerfile best practices : utilisateur non-root, `.dockerignore`, base distroless/chainguard
- BuildKit, buildx (cross-architecture arm64/amd64)
- Scan de vulnérabilités images : Trivy (Aqua, open source), Grype (Anchore, OSS), Snyk (commercial, plan gratuit OSS)
- Signature d'images : Cosign (Sigstore, OSS), attestations SLSA
- Registries : GHCR (GitHub Container Registry, gratuit avec Student Pack), Docker Hub, ECR, ACR, Artifact Registry, Harbor (OSS)
- SBOM : Syft (OSS), intégration CI
- Alternatives runtime : containerd, CRI-O, Podman (OSS, rootless)

### C3.8, Kubernetes

Sous-thèmes :
- Architecture : control plane (etcd, apiserver, scheduler, controller-manager), nodes, kubelet, kube-proxy, CRI, CNI, CSI
- Objects : Pod, Deployment, StatefulSet, DaemonSet, Job, CronJob, Service, Ingress, ConfigMap, Secret, PVC, Namespace
- Scheduling : requests/limits, node selectors, taints/tolerations, affinity/anti-affinity, topology spread constraints, PriorityClass
- Networking : Services (ClusterIP, NodePort, LoadBalancer), Ingress Controllers (ingress-nginx, Traefik), NetworkPolicies, CNI (Calico, Cilium avec eBPF), Gateway API
- Storage : StorageClass, PV, PVC, CSI drivers
- Sécurité : RBAC, ServiceAccount, SecurityContext, PodSecurity admission (remplace PSP), OPA Gatekeeper, Kyverno
- Observability : metrics-server, Prometheus, kube-state-metrics, logs (Loki, Elastic), distributed tracing (Tempo, Jaeger)
- Scaling : HPA, VPA, Cluster Autoscaler, Karpenter (AWS)
- Helm charts, Kustomize
- Operators, CRDs, Operator Framework
- Managed : EKS, AKS, GKE Autopilot. Comparaison coûts et features
- Edge : K3s, k0s, MicroK8s

Labs : **Killercoda** (scenarios interactifs), **KillerShell** (simulateur CKA/CKAD/CKS officiel Linux Foundation), **Kubernetes The Hard Way** (Kelsey Hightower, repo GitHub gratuit).

Certification : **CKA** (sysadmin), **CKAD** (dev), **CKS** (sécurité).

### C3.9, IaC avec Terraform, OpenTofu, Pulumi, Bicep, Crossplane

Sous-thèmes :
- Philosophie IaC : declarative vs imperative, drift, state
- Terraform / OpenTofu : HCL, providers, modules, state (remote avec locking S3+DynamoDB ou Azure blob), workspaces, `terraform_remote_state`, null_resource, data sources
- OpenTofu : fork communautaire de Terraform suite au relicensing BSL, rétro-compatible, gouvernance Linux Foundation
- Pulumi : IaC en Python/TS/Go/Java, préférable si équipe dev pure
- Bicep (Azure-only) : ADN simplifié d'ARM, très bien intégré AKS/App Service
- AWS CloudFormation, CDK (infrastructure as code en TS/Python avec synth CFN)
- Crossplane : IaC via CRDs K8s (pour équipes GitOps K8s-first)
- Terragrunt : wrapper DRY pour Terraform
- Testing : terraform validate/fmt, tflint, checkov (security), trivy iac, Terratest, terraform-compliance
- Stratégies : monorepo vs multi-repo, module registry privé, pipeline de review (Atlantis OSS, TFC cloud, env0, Spacelift)

Certification : **HashiCorp Terraform Associate** (HCTA0-003, vérifier si OpenTofu a une cert équivalente en 2026).

### C3.10, CI/CD et GitOps

Sous-thèmes :
- CI : GitHub Actions (gratuit pour repos publics, crédits généreux Student Pack), GitLab CI, Jenkins, CircleCI, Woodpecker (OSS), Drone
- Artefacts : cache, matrix, reusable workflows, OIDC vers cloud (sans credentials)
- Scans en CI : SAST (Semgrep, CodeQL), SCA (Dependabot, Renovate), IaC scan (Checkov), secrets scan (Gitleaks, TruffleHog), container scan (Trivy)
- SBOM generation en CI (Syft)
- Signature en CI (Cosign, keyless via OIDC)
- CD classique : deploy job
- GitOps : **ArgoCD** (OSS, référence), **Flux** (OSS, alternative plus Kubernetes-native). Pattern : état désiré dans Git, reconciliation automatique
- Progressive delivery : **Argo Rollouts**, **Flagger** (canary, blue-green, A/B)
- Release management : semantic-release, Conventional Commits, changelogs automatiques
- Policy-as-code en CI : OPA Rego, Conftest

### C3.11, Observabilité

Sous-thèmes :
- Les trois piliers : métriques, logs, traces (puis continuous profiling en 4e pilier émergent)
- OpenTelemetry (OTel) : standard unifié d'instrumentation, SDK dans tous les langages, Collector
- Métriques : **Prometheus** (OSS, pull-based, référence Kubernetes), **VictoriaMetrics** (fork optimisé), **Thanos/Mimir** (multi-cluster), **Grafana Cloud** (commercial SaaS)
- Dashboards : **Grafana** (OSS)
- Logs : **Loki** (OSS, "Prometheus for logs"), **Elastic Stack** (ELK, OSS/commercial), **OpenSearch** (fork AWS open source), **Quickwit** (OSS, très performant), **Splunk** (commercial enterprise)
- Traces : **Jaeger** (OSS, CNCF), **Tempo** (Grafana, OSS), **Zipkin**
- APM commercial : **Datadog** (très complet, cher), **New Relic**, **Dynatrace** (automation forte), **Instana**
- Alerting : Alertmanager, PagerDuty, Opsgenie, Grafana OnCall (OSS)
- SLO / SLI / error budget (méthodologie SRE Google)
- Synthetic monitoring : Blackbox exporter, Grafana Synthetic, Uptime Kuma (OSS self-host)
- Real User Monitoring (RUM) : Grafana Faro, Datadog RUM
- Continuous profiling : **Pyroscope** (Grafana), **Parca** (OSS, eBPF)

### C3.12, Sécurité cloud (CSPM / CNAPP / CWPP / DSPM)

> Transverse fort avec [[02-Cybersec-Curriculum]] C1.12. Référence croisée systématique.

Sous-thèmes :
- CSPM (Cloud Security Posture Management) : audit de configuration vs benchmark (CIS, AWS/Azure/GCP)
- Outils OSS : **Prowler** (AWS/Azure/GCP/K8s), **ScoutSuite** (NCC Group), **CloudSploit**
- CSPM commercial : Wiz, Orca Security, Lacework
- Native : AWS Security Hub + Config, Azure Defender for Cloud, GCP Security Command Center
- CWPP (workload protection) : agents sur VM/conteneurs, Defender for Servers, Wiz Runtime, Falco (OSS runtime)
- CNAPP (Cloud Native Application Protection Platform) : consolidation CSPM + CWPP + CIEM + DSPM
- CIEM (Cloud Infrastructure Entitlement Management) : gestion des permissions, détection des privilèges excessifs
- DSPM (Data Security Posture Management) : découverte et classification de données sensibles cloud
- Réseau : AWS GuardDuty, Azure Sentinel (SIEM), GCP Chronicle
- Secrets detection : Gitleaks, TruffleHog, GitHub secret scanning
- Container runtime : **Falco** (OSS, CNCF), eBPF-based, règles YAML
- Admission controllers K8s : **Kyverno**, **OPA Gatekeeper**
- Compliance mapping : CIS Benchmarks, NIST 800-53, ISO 27001, SOC 2

### C3.13, FinOps

Sous-thèmes :
- Principes FinOps Foundation : Inform → Optimize → Operate
- Unit economics : coût par requête, par tenant, par feature
- Outils natifs : AWS Cost Explorer + Budgets + Cost Anomaly Detection, Azure Cost Management, GCP Billing Reports
- Tagging strategy : taxonomie obligatoire (env, owner, project, cost-center)
- Reserved Instances / Savings Plans / Committed Use Discounts
- Spot / Preemptible : workloads tolérants (batch, training ML)
- Right-sizing : recommendations natives + outils (Cast AI pour K8s, Kubecost OSS)
- K8s cost allocation : **Kubecost** (OSS free tier), **OpenCost** (CNCF sandbox)
- Multi-cloud : **Infracost** (OSS, estimation dans PR Terraform)
- Cost pour workloads IA/GPU : problème majeur 2025-2026, GPU à 20-80 USD/heure selon type (voir [[04-AI-ML-Curriculum]])
- FOCUS specification (FinOps Open Cost and Usage Specification) : format standard multi-cloud

Certification : **FinOps Certified Practitioner (FOCP)** (FinOps Foundation, plan étudiant discount existant selon les sessions).

## 3. Plan de certifications multi-années (pour Anthony)

### Année 1 (Bac+3 alternance cybersec)

Phase 1 (mois 1-6) :
- **AZ-900 Azure Fundamentals** (Microsoft Learn gratuit + voucher Microsoft Learn Challenge, ou voucher école)
- **CLF-C02 AWS Cloud Practitioner** (AWS Skill Builder + 50% étudiant régulier)

Phase 2 (mois 7-12) :
- **AZ-104 Azure Administrator** si alternance Azure-lourde
- **SAA-C03 AWS Solutions Architect Associate** sinon
- Commencer homelab K8s (K3s sur mini-PC ou VM Proxmox)

Investissement cumulé : ~300-400 EUR.

### Année 2 (Bac+4 / M1)

- **CKA Certified Kubernetes Administrator** (~300 USD, réduction occasionnelle)
- **HashiCorp Terraform Associate** (~70 USD)
- **AZ-500 Azure Security Engineer** ou **SCS-C02 AWS Security Specialty** (transverse D1, voir [[02-Cybersec-Curriculum]])

### Année 3 (Bac+5 / M2)

- **CKS Certified Kubernetes Security Specialist** (CKA prérequis)
- **AZ-305 Azure Solutions Architect Expert** (AZ-104 prérequis) ou **SAP-C02 AWS Solutions Architect Professional**
- **FinOps Certified Practitioner**
- Optionnel si cible SRE : parcours Google SRE books + SRE Workbook

### Année 4+ (post-diplôme)

- Specialties selon poste : AWS DevOps Pro, AWS Database, Azure DevOps Expert (AZ-400), Kubestronaut (les 5 certs CNCF), etc.
- CISSP après 5 ans d'expérience cumulée si orientation manager sécurité cloud.

## 4. Stack d'outils Edu / Open Source / Commercial

### Apprentissage et labs

| Outil | Type | Commentaire |
|---|---|---|
| **Microsoft Learn** | Edu gratuit | Parcours AZ-900/104/500 complets, sandbox gratuit |
| **AWS Skill Builder** | Edu (free tier) | Cours officiels gratuits, labs payants mais parcours Foundation gratuits |
| **Google Cloud Skills Boost** | Edu | 30 jours gratuits via programmes, Qwiklabs |
| **GitHub Student Pack** | Edu gratuit | Azure 100 USD, AWS Educate, DigitalOcean 200 USD, etc. |
| **A Cloud Guru / Pluralsight** | Commercial | Abonnement complet, versions étudiantes |
| **Cloud Academy** | Commercial | Laboratoires hands-on |
| **KodeKloud** | Commercial | Excellent pour K8s / DevOps / Linux |
| **Killercoda** | OSS / Commercial | Scénarios interactifs, beaucoup gratuits |
| **KillerShell** | Commercial | Simulateurs officiels CKA/CKAD/CKS (inclus dans exam) |
| **Play with Docker / Kubernetes** | OSS gratuit | Sandbox éphémères (Docker Inc.) |

### IaC et provisionning

| Outil | Type | Commentaire |
|---|---|---|
| **OpenTofu** | Open Source (LF) | Fork Terraform post-BSL, rétro-compatible |
| **Terraform** | Commercial (BSL) | Reste dominant, compatible OpenTofu majoritairement |
| **Pulumi** | OSS + SaaS | Langages réels (Python/TS), plan étudiant |
| **Bicep** | Open Source (MS) | Azure uniquement, excellent |
| **Ansible** | Open Source (Red Hat) | Configuration management référence |
| **Crossplane** | OSS (CNCF) | IaC via K8s CRDs |

### Conteneurs et K8s locaux

| Outil | Type | Commentaire |
|---|---|---|
| **Docker Engine / Podman** | OSS | Podman rootless daemonless, alternative Docker |
| **Kind, k3d, Minikube** | OSS | K8s locaux pour tests |
| **K3s / k0s / MicroK8s** | OSS | K8s légers pour homelab, edge, CI |
| **Lens / k9s / Headlamp** | OSS + freemium | Clients K8s (k9s OSS TUI référence) |

### Observabilité

| Outil | Type | Commentaire |
|---|---|---|
| **Prometheus + Grafana + Loki + Tempo** | OSS (CNCF/Grafana Labs) | Stack référence OSS |
| **OpenTelemetry** | OSS (CNCF) | Standard instrumentation |
| **Elastic Stack / OpenSearch** | OSS | ELK (licence dual Elastic) ou fork AWS |
| **Datadog / New Relic / Dynatrace** | Commercial | Plans étudiants / trials généreux |
| **Grafana Cloud** | Commercial + free tier | Free tier généreux pour homelab |

### Sécurité cloud

| Outil | Type | Commentaire |
|---|---|---|
| **Prowler / ScoutSuite** | OSS | Audit CSPM AWS/Azure/GCP |
| **Falco** | OSS (CNCF) | Runtime security, eBPF |
| **Kyverno / OPA Gatekeeper** | OSS (CNCF) | Admission controllers K8s |
| **Trivy** | OSS (Aqua) | Scan images, IaC, secrets |
| **Checkov** | OSS (Bridgecrew/Palo Alto) | Scan IaC |
| **Wiz / Orca / Lacework** | Commercial | CNAPP haut de gamme |
| **Defender for Cloud / Security Hub** | Commercial (natif) | CSPM hyperscaler |

### FinOps

| Outil | Type | Commentaire |
|---|---|---|
| **OpenCost / Kubecost (community)** | OSS (CNCF sandbox) | Cost allocation K8s |
| **Infracost** | OSS + SaaS | Estimation dans PR Terraform |
| **Cost Explorer / Cost Management** | Commercial (natif) | Outils natifs hyperscalers |
| **Vantage / CloudZero / Finout** | Commercial | FinOps plateformes |

## 5. Ressources de fond

### Livres de référence 2025-2026

- **"The Phoenix Project"** puis **"The DevOps Handbook"**, Gene Kim : culture DevOps
- **"Site Reliability Engineering"** + **"SRE Workbook"**, Google (gratuits en HTML)
- **"Kubernetes Up and Running"** 3e édition, Brendan Burns et al.
- **"Kubernetes Patterns"** 2e édition, Bilgin Ibryam, Roland Huss (O'Reilly, patterns cloud-native)
- **"Terraform Up and Running"** 3e édition, Yevgeniy Brikman
- **"Cloud Native Patterns"**, Cornelia Davis
- **"Cloud FinOps"** 2e édition, J.R. Storment, Mike Fuller
- **"Observability Engineering"**, Charity Majors et al. (Honeycomb)
- **"Designing Data-Intensive Applications"**, Martin Kleppmann (transverse D2, la référence)
- **"Infrastructure as Code"** 3e édition, Kief Morris

### Newsletters et veille

- **Last Week in AWS** (Corey Quinn, drôle et pertinent)
- **The Overflow Cloud** (diverses)
- **TLDR DevOps**
- **Kubernetes Weekly** (kube.news)
- **CNCF blog et YouTube** (keynotes KubeCon)
- **Azure Weekly** (endjin)
- **FinOps Foundation** (newsletter et podcasts)
- **Learn Kubernetes The Hard Way** (Kelsey Hightower, YouTube talks)

### YouTube FR

- **Xavki** (DevOps, K8s, Ansible, Terraform en français)
- **Grafikart** (plus généraliste mais des séries DevOps)
- **Le Comptoir du Code / Dev Theory** (ponctuellement cloud)

### YouTube INT

- **TechWorld with Nana** (K8s, DevOps, explications claires)
- **That DevOps Guy (MarcelDempers)** (K8s et sécurité cloud)
- **Kelsey Hightower** (philosophie K8s)
- **KodeKloud**
- **Corey Quinn / Last Week in AWS**
- **Cloud Academy**
- **AWS re:Invent / Microsoft Ignite / Google Cloud Next** (keynotes annuelles, replays)

### Podcasts

- **Kubernetes Podcast from Google**
- **Screaming in the Cloud** (Corey Quinn)
- **The Cloudcast**
- **DevOps Paradox**
- **FinOps Pod**

## 6. Phasing pour Anthony (18-24 mois)

### Phase 1 (mois 1-3), Cloud fundamentals

- AZ-900 (80% Microsoft Learn + 20% Udemy/PluralSight)
- CLF-C02 (AWS Skill Builder gratuit)
- Homelab : compte Azure for Students (100 USD crédit), compte AWS Free Tier, compte GCP free
- Premières expériences : déployer une VM, un Blob Storage, une Lambda
- Livrables vault : 10-15 pages par hyperscaler (C3.2, C3.3) + C3.1 souveraineté

### Phase 2 (mois 4-9), Admin/Architecte associate

- AZ-104 OU SAA-C03 selon alternance
- Docker + Kubernetes local (Kind, K3s sur Raspberry Pi ou mini-PC Proxmox, voir [[02-Cybersec-Curriculum]] homelab)
- Premier projet personnel cloud : app simple (API Python + Postgres managé + Blob + déploiement automatisé)
- Terraform : refaire ce projet en IaC
- Livrables vault : C3.4 (IAM), C3.5 (réseau), C3.6 (storage), C3.7 (conteneurs)

### Phase 3 (mois 10-15), Kubernetes et CI/CD

- **CKA** (objectif phare, 2-3 mois de prépa sérieuse)
- GitHub Actions + OIDC vers cloud (pas de secret stocké)
- ArgoCD sur cluster K3s du homelab
- Livrables vault : C3.8 (K8s profond), C3.9 (IaC), C3.10 (CI/CD GitOps)

### Phase 4 (mois 16-24), Sécurité cloud et FinOps

- **CKS** et/ou **AZ-500/SCS-C02** (selon orientation D1)
- Stack observabilité complète sur homelab (Prometheus + Grafana + Loki + Tempo)
- Audit CSPM via Prowler sur le compte perso
- Livrables vault : C3.11 (obs), C3.12 (sécurité cloud), C3.13 (FinOps)

## 7. Points de vigilance

### 7.1 Éviter le piège "AWS ou Azure ou GCP ?"

La bonne réponse est "celui de ton alternance actuelle + un second pour rester marketable". En France, la combinaison **Azure + AWS** couvre >90% des opportunités. GCP en bonus pour ML/data.

### 7.2 Ne pas brûler son Free Tier

Les comptes gratuits ont des limites. Toujours configurer des **budget alerts à 5, 10, 25 USD**. Le syndrome classique : oublier une ressource coûteuse (NAT Gateway, Load Balancer, RDS) tournant 24/7 et prendre une facture à 300 EUR. Activer MFA sur le compte root immédiatement (voir [[02-Cybersec-Curriculum]] C1.12).

### 7.3 Pas de production sans IaC

Dès qu'un environnement dépasse le POC, il doit être en Terraform/Bicep/OpenTofu. Toute ressource cliquée-créée sera perdue ou divergente.

### 7.4 Observabilité dès le jour 1

Un service sans métriques/logs/traces est une boîte noire en incident. Instrumenter en OpenTelemetry dès le départ.

### 7.5 Cert ≠ compétence

Passer AZ-900 en 2 semaines ne fait pas de toi un architecte cloud. La cert valide la surface théorique. Le homelab, les projets réels et l'alternance font la compétence.

### 7.6 Garder un œil sur les relicensings

HashiCorp (Terraform BSL), Elastic (SSPL), Redis (SSPL), Grafana (AGPL), MongoDB (SSPL), Sentry (FSL). Le paysage OSS évolue. Privilégier quand possible les vraies alternatives libres (OpenTofu, OpenSearch, Valkey, Quickwit).

## 8. Intégration vault et wikilinks transverses

- Toute page cloud a un YAML avec `valide_jusqu_a` 6 mois (les offres hyperscalers changent tous les 3-6 mois)
- Transverse fort avec [[02-Cybersec-Curriculum]] C1.12 (CSPM, IAM, Zero Trust) : wikilink systématique
- Transverse avec [[05-Reseaux-Cert-Roadmap]] : C3.5 réseau cloud réutilise C5.1-C5.4 fondamentaux
- Transverse avec [[04-AI-ML-Curriculum]] : services ML managés (Bedrock, Azure AI Foundry, Vertex AI), GPU coûts
- Transverse avec [[01-Developer-2026-Curriculum]] : C2.4 (architecture), C2.6 (DevOps), C2.5 (AI application)
- MOC : `30-Cloud/00-MOC-Cloud.md` renvoie à chaque cluster

## 9. Action immédiate recommandée

**Cluster à lancer en premier** (après avoir validé le pilote Dev) : **C3.2 Azure Fundamentals** si alternance Azure, sinon **C3.3 AWS Fundamentals**. Environ 40-50 pages sur 1 mois. Usage du `PROMPT-PILOT-C3.X-[domaine].md` à générer sur le modèle de `PROMPT-PILOT-C2.0.6-Collaboration-IA.md`.

---

*Document compagnon de [[00-Architecture-Vault-Second-Brain]] pour le domaine D3 Cloud & Infrastructure.*
