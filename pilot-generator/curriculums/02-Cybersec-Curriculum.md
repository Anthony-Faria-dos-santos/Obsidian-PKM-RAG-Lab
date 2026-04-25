---
titre: "Cybersécurité 2026 — Curriculum et clusters Obsidian"
type: curriculum-détaillé
domaine: Cybersécurité
statut: proposition-initiale
créé: 2026-04-22
version: 1.0
companion_de: "00-Architecture-Vault-Second-Brain.md"
---

# Track Cybersécurité 2026 — Curriculum complet et clusters Obsidian

> Expansion détaillée du Domaine 1 de l'architecture maître. Objectif : cartographier la cybersécurité en 2026 pour un parcours Bac+3 alternance visant un profil hybride offensif + défensif, avec plan de certifications multi-années, tooling, labs et ressources. S'accroche aux clusters Obsidian C1.1 à C1.19 du vault.

---

## 1. Le paysage 2026 (ce qui a changé)

La cybersécurité 2026 n'est plus celle de 2022. Cinq ruptures structurent ce curriculum :

**Rupture 1 — L'IA est des deux côtés du champ de bataille.** Les défenseurs utilisent des agents autonomes pour le triage SOC, la correlation et la détection. Les attaquants utilisent des agents pour l'automatisation d'exploitation, le polymorphisme malware, et des campagnes de phishing hyper-personnalisées à grande échelle. Un pentester qui ne connaît pas les prompt injections offensives et défensives en 2026 rate une surface d'attaque majeure.

**Rupture 2 — Identité = nouveau périmètre.** Zero Trust n'est plus un buzzword, c'est l'architecture par défaut des grandes organisations. Active Directory reste massivement exploitable mais cohabite maintenant avec Entra ID (ex-Azure AD), Okta, Ping. Les attaques post-exploitation pivotent de l'AD on-prem vers le cloud identity plane (Azure AD recon, Golden SAML, OAuth abuse).

**Rupture 3 — Supply chain et dépendances sont la surface d'attaque dominante.** SolarWinds, Log4Shell, XZ Utils ont formalisé le pattern. Les SBOM (Software Bill of Materials), sigstore, SLSA et attestations reproductibles font partie du vocabulaire des défenseurs 2026. Les attaquants ciblent directement les maintainers open source.

**Rupture 4 — Le cloud devient la cible primaire.** Les attaques se déplacent du périmètre réseau classique vers AWS/Azure/GCP : misconfigurations IAM, exposition S3, abus d'OIDC, lateral movement cross-cloud. CSPM et CNAPP sont la nouvelle génération d'outillage défensif.

**Rupture 5 — Réglementaire devient lourd et contraignant.** NIS2 est transposée en France depuis 2024, DORA pour la finance, CRA (Cyber Resilience Act) pour les produits, AI Act pour l'IA. Un profil cyber 2026 doit savoir lire un référentiel ANSSI et un contrôle NIST 800-53 aussi bien qu'un code Python.

Ce curriculum intègre ces cinq ruptures. Il distingue clairement ce qui reste éternel (crypto, réseaux, AD) de ce qui évolue vite (tooling, threat actors, régulation).

---

## 2. La progression « bon ordre » en un coup d'œil

```
┌───────────────────────────────────────────────────────────────┐
│  TIER 0 — PRÉREQUIS TECHNIQUES (2–3 mois, continu)            │
│  Linux admin • Windows admin • Réseaux TCP/IP • Scripting     │
│  Git • VM/Docker • Python offensif de base                    │
└───────────────────────────────────────────────────────────────┘
                             ↓
┌───────────────────────────────────────────────────────────────┐
│  TIER 1 — FONDAMENTAUX CYBER (3–4 mois)                       │
│  CIA triad • AAA • Cryptographie appliquée • Threat modeling  │
│  Sécurité réseau classique • Conformité bases (ISO/NIST)      │
│  CERTIF CIBLE : Security+ ou CC (ISC²)                        │
└───────────────────────────────────────────────────────────────┘
                             ↓
┌───────────────────────────────────────────────────────────────┐
│  TIER 2 — HANDS-ON TECHNIQUES (4–6 mois)                      │
│  OWASP Top 10 • Enumeration • Exploitation guidée • Scripting │
│  Labs TryHackMe + HTB Starting Point + PortSwigger Academy    │
│  CERTIF CIBLE : eJPT (INE) ou TCM Practical Junior            │
└───────────────────────────────────────────────────────────────┘
                             ↓
         ┌───────────────────┴───────────────────┐
         ↓                                       ↓
┌────────────────────────┐              ┌────────────────────────┐
│ TIER 3A — OFFENSIVE    │              │ TIER 3B — DEFENSIVE    │
│ (6–9 mois)             │              │ (6–9 mois)             │
│ Active Directory • Web │              │ SOC • SIEM • Detection │
│ Exploit dev basique    │              │ DFIR • Threat Hunting  │
│ Red Team workflows     │              │ Log analysis • EDR     │
│ CERTIFS : PNPT, CRTP,  │              │ CERTIFS : BTL1, CySA+, │
│ eWPT puis OSCP         │              │ GCIA puis GCIH         │
└────────────────────────┘              └────────────────────────┘
         ↓                                       ↓
         └───────────────────┬───────────────────┘
                             ↓
┌───────────────────────────────────────────────────────────────┐
│  TIER 4 — SPÉCIALISATIONS AVANCÉES (12+ mois, à la carte)     │
│  Cloud Security • Reverse/Malware • ICS/OT • Forensics        │
│  Exploit dev avancé • Physical/Hardware • AI Security         │
└───────────────────────────────────────────────────────────────┘
                             ↓
┌───────────────────────────────────────────────────────────────┐
│  TIER 5 — GOUVERNANCE ET LEADERSHIP (à partir de 3–5 ans XP)  │
│  ISO 27001 LA • NIST CSF • CISSP • CISM • Risk management     │
│  Politique SSI • Audit organisationnel • Privacy (CIPP/E)     │
└───────────────────────────────────────────────────────────────┘
```

**Durée globale estimée** : 4 à 6 ans pour un profil senior (T0 à T4 maîtrisés + une spécialisation), 7 à 10 ans pour y ajouter la gouvernance T5.

**Choix critique à Tier 3** : tu as indiqué vouloir toucher les trois volets (offensif + défensif + fondamentaux + CCNA/CCNP). Ma recommandation ordonnée pour ton profil alternance :

1. **Finir T0 et T1 d'abord** même si tu te crois déjà dedans (souvent des trous).
2. **Choisir un volet principal pour T3** : je recommande **Offensive** comme track principal (ROI marché plus visible, meilleurs labs disponibles, CTF entraînement). Garder le Defensive en secondaire jusqu'à Tier 4.
3. **Ne jamais sauter la crypto** (C1.2) — piège classique qui te coûtera sur OSCP et CISSP.
4. **CCNA en parallèle de T1-T2** : le réseau est prérequis pour tout, CCNA couvre 70% de ce qu'il te faut.

---

## 3. Plan de certifications multi-années (calibré pour ton profil)

Ordre recommandé avec budget estimé et durée. Les prix sont 2026 indicatifs et à vérifier au moment de passer l'examen.

### Année 1 (entrée et validation fondamentaux)

| Ordre | Certif | Type | Coût ~ | Durée prép | Priorité | Notes |
|---|---|---|---|---|---|---|
| 1 | **ISC² CC** (Certified in Cybersecurity) | Entry | Gratuit (FTS program) | 2-4 mois | ★★★★ | Prix cassé via programme étudiant ISC², bon passage |
| 2 | **CompTIA Security+** (SY0-701) | Entry | ~370 $ | 3-5 mois | ★★★★★ | Vouchers étudiants 30-50% sur CompTIA Academic Store |
| 3 | **Cisco CCNA** (200-301) | Réseau | ~300 € | 5-7 mois | ★★★★★ | Gratuit via Cisco Networking Academy si passé en cours |
| 4 | **eJPT** (INE / Security) | Offensive hands-on | ~250 $ | 3-4 mois | ★★★★★ | Moins cher, plus pragmatique que CEH, excellent pont vers OSCP |

**Total année 1** : ~800 à 1000 € si tout payé plein tarif, souvent divisé par 2 avec vouchers étudiants.

### Année 2 (spécialisation initiale et CCNP entamé)

| Ordre | Certif | Type | Coût ~ | Durée prép | Notes |
|---|---|---|---|---|---|
| 5 | **PNPT** (TCM Security) | Offensive intermédiaire | ~400 $ | 3-5 mois | Pratique, réaliste, reconnue en entreprise |
| 6 | **CRTP** (Altered Security) | AD offensif | ~250 $ | 2-3 mois | Référence absolue AD, excellent avant OSCP |
| 7 | **BTL1** (Security Blue Team) | Defensive intermédiaire | ~500 $ | 3-4 mois | Hands-on blue team le plus accessible |
| 8 | **CCNP Enterprise Core (ENCOR)** | Réseau avancé | ~400 € | 6-8 mois | Core partagé avec tous les CCNP Enterprise |

**Total année 2** : ~1500 à 1800 €. C'est l'année des hands-on sérieux.

### Année 3 (le graal offensif ou défensif)

| Ordre | Certif | Type | Coût ~ | Durée prép | Notes |
|---|---|---|---|---|---|
| 9 | **OSCP** (OffSec) | Offensive avancée | ~1700 $ pack 90j | 6-9 mois | La référence, dur, essentiel pour red team |
| 10 | **CySA+** (CompTIA) | Defensive intermédiaire | ~400 $ | 3-4 mois | Analyst SOC industrialisé, reconnu ANSSI |
| 11 | **CCNP Concentration** (ENARSI ou ENSLD ou ENAUTO) | Réseau | ~300 € | 4-6 mois | Choisir selon trajectoire |

**Total année 3** : ~2400 à 2800 € (OSCP pèse lourd). Réserve à ce stade si tu as un budget alternance/employeur.

### Année 4+ (spécialisation avancée)

À choisir selon trajectoire réelle — red team, blue team, cloud security, ICS, gouvernance :

- **GIAC GPEN / GXPN** (red team avancé, coûteux ~8000 $ — viser prise en charge employeur)
- **OSEP / OSED / OSEE** (OffSec expert path, exploit dev)
- **GCFA / GCIH / GCIA** (blue team SANS)
- **AWS Security Specialty** ou **AZ-500** (cloud sec)
- **GICSP** (ICS/OT si bascule industriel)
- **CISSP** (gouvernance, requiert 5 ans XP cumulée)

### Certifications IA et Cloud à greffer

Puisque tu as indiqué viser aussi du cloud et du dev IA, intégrer dans le parcours :

- **AWS Certified AI Practitioner** ou **Azure AI-900** dès année 1-2 (base)
- **AZ-500** (Azure Security Engineer) année 3-4
- **AWS Security Specialty** année 4+
- **HashiCorp Terraform Associate** (utile pour IaC sécurisé)

---

## 4. Cartographie complète des clusters (Domaine 1 étendu)

### Tier 0 — Prérequis techniques (transverse à tout)

Pas de clusters dédiés dans D1 (déjà couverts par D2 Dev C2.1.4 OS et D5 Réseaux). Mais s'assurer d'avoir ces bases solides avant d'attaquer C1.x :

- Linux admin (systemd, iptables/nftables, permissions, SELinux/AppArmor, audit)
- Windows admin (registry, services, ACL, GPO basics, Event Viewer)
- Bash et PowerShell scripting
- Python offensif de base (requests, socket, argparse)
- Git avancé et environnements reproductibles

### Tier 1 — Fondamentaux cyber

| # | Cluster | Pages | Priorité | Certifs alignées | Fact-check |
|---|---|---|---|---|---|
| **C1.1** | Fondamentaux cybersec (CIA, AAA, threat modeling, surface d'attaque, risk management) | 40–60 | Pilier | Sec+, CC | Moyen |
| **C1.2** | Cryptographie théorique et appliquée | 50–80 | Pilier | Sec+, CISSP, OSCP | Fort |
| **C1.3** | Réseaux et sécurité réseau (pare-feu, IDS/IPS, VPN, NAC, Zero Trust) | 60–100 | Pilier | Sec+, CCNA Security, PNPT | Moyen |

**Sous-thèmes à couvrir dans C1.1** (pour calibrer `DESCRIPTION_CLUSTER`) :
- Triade CIA, extensions (AAA, non-répudiation, authenticité)
- Modèles de menaces (STRIDE, PASTA, LINDDUN, Attack Trees)
- Surface d'attaque vs vecteur vs TTP
- Principes de sécurité (defense in depth, least privilege, fail secure, separation of duties, KISS appliqué à la sécu)
- Actifs, vulnérabilité, menace, risque — définitions rigoureuses
- Méthodes d'analyse de risque (EBIOS RM ANSSI, ISO 27005, NIST 800-30, FAIR)
- Controls (preventive, detective, corrective, compensating)
- Vocabulaire essentiel (IoC, IoA, TTP, artifact, indicator, malware family)
- Ponts vers C1.13 Conformité

**Sous-thèmes à couvrir dans C1.2 Cryptographie** :
- Maths élémentaires (modulo, groupes, corps finis — niveau compréhension)
- Crypto symétrique (AES, modes ECB/CBC/GCM/CTR, Chacha20-Poly1305)
- Crypto asymétrique (RSA, DH, ECDH, Curve25519, signatures Ed25519)
- Hash (SHA-2, SHA-3, BLAKE3, HMAC)
- Dérivation de clés (PBKDF2, scrypt, Argon2)
- PKI (X.509, CRL, OCSP, certificate pinning, CT logs)
- Protocoles (TLS 1.3 end-to-end, SSH, Signal double ratchet, JWT, JOSE)
- Post-quantum crypto (CRYSTALS-Kyber, Dilithium — NIST PQC)
- Attaques pratiques (padding oracle, Bleichenbacher, downgrade, sidechannel)
- Implémentation : pièges courants (time-constant comparison, RNG, nonce reuse)
- Stéganographie basique

**Sous-thèmes C1.3 Réseaux et sécurité réseau** :
- Rappel OSI/TCP-IP appliqué sécurité
- Segmentation, micro-segmentation, Zero Trust architecture
- Pare-feu stateful/NGFW, WAF, reverse proxy
- IDS/IPS (Snort, Suricata, Zeek/Bro)
- VPN (IPsec, WireGuard, OpenVPN, SSL-VPN)
- NAC (802.1X, PNAC)
- DNS sécurisé (DoH, DoT, DNSSEC)
- BGP hijacking, routing security (RPKI)
- Wi-Fi sécurité (WPA3, PMF, attaques WPA2)
- SASE, SSE, ZTNA
- Network forensics basics

### Tier 2 — Hands-on techniques (entry practical)

| # | Cluster | Pages | Priorité | Certifs | Notes |
|---|---|---|---|---|---|
| **C1.6** (partie intro) | Offensive Web fondamentaux (OWASP Top 10 de base) | 40–60 | Pilier | eJPT, Sec+ | Premier cluster hands-on |
| **C1.15** (partie intro) | Tooling offensif de base (nmap, Burp, Nessus, Metasploit) | 40–60 | Pilier | eJPT, PNPT | — |

C1.6 et C1.15 sont scindés en deux niveaux : un pilote T2 entry-level (40 pages), un pilote T3 advanced (80-120 pages supplémentaires quand tu passes en offensive avancée).

**Sous-thèmes C1.6 (intro Tier 2)** :
- OWASP Top 10 2025 (A01 Broken Access Control, A02 Cryptographic Failures, …)
- Injections SQL classiques (union, error-based, blind, time-based)
- XSS (reflected, stored, DOM-based)
- CSRF, SSRF, XXE fondamentaux
- File upload vulnerabilities
- Path traversal, LFI, RFI
- Authentication et session flaws
- Introduction à la PortSwigger Web Security Academy (roadmap labs obligatoire)

### Tier 3A — Offensive (spécialisation red team)

| # | Cluster | Pages | Priorité | Certifs alignées | Fact-check |
|---|---|---|---|---|---|
| **C1.4** | MITRE ATT&CK — tactiques et techniques (framework complet) | 150–250 | Pilier | OSCP, PNPT, CySA+, GCIA | Fort |
| **C1.5** | Active Directory offensif (Kerberos, NTLM, ACL abuse, trusts, ADCS ESC1-ESC15) | 80–150 | Pilier | CRTP, OSCP, PNPT | Fort |
| **C1.6** (complet) | Offensive Web avancée (auth avancée, SSRF, deserialization, bug bounty méthodologie) | 80–120 | Pilier | eWPT, OSCP, PNPT | Fort |
| **C1.7** | Exploitation et dev d'exploits (buffer overflow, ROP, heap, kernel intro) | 60–100 | Pilier | OSCP, OSED | Fort |
| **C1.15** (complet) | Tooling offensif avancé (Metasploit, Bloodhound, Impacket, Mimikatz, CS alternatives) | 80–120 | Pilier | OSCP, PNPT, CRTP | Moyen |

**Sous-thèmes C1.4 MITRE ATT&CK** (le cluster le plus gros du vault) :
- Vue d'ensemble, relation avec Cyber Kill Chain, Diamond Model, Unified Kill Chain
- Matrices Enterprise, Mobile, ICS
- Par tactique, les techniques principales :
  - Reconnaissance (T1595 Active Scanning, T1589 Gather Victim Identity…)
  - Resource Development (T1583, T1584, T1587)
  - Initial Access (T1566 Phishing, T1190 Exploit Public-Facing App, T1078 Valid Accounts)
  - Execution (T1059 Command Scripting, T1204 User Execution, T1053 Scheduled Task)
  - Persistence (T1547 Boot or Logon Autostart, T1053 Task, T1136 Create Account, T1098 Account Manipulation)
  - Privilege Escalation (T1068 Exploitation, T1134 Access Token, T1548 Abuse Elevation Control)
  - Defense Evasion (T1027 Obfuscated, T1055 Process Injection, T1562 Impair Defenses)
  - Credential Access (T1003 OS Credential Dumping, T1110 Brute Force, T1555 Credentials from Password Stores)
  - Discovery (T1087 Account, T1018 Remote System, T1046 Network Service Scanning)
  - Lateral Movement (T1021 Remote Services, T1570 Lateral Tool Transfer, T1534 Internal Spearphishing)
  - Collection (T1005 Data from Local System, T1113 Screen Capture, T1119 Automated Collection)
  - C2 (T1071 Application Layer, T1573 Encrypted Channel, T1090 Proxy)
  - Exfiltration (T1041 Exfil over C2, T1567 Exfil over Web Service)
  - Impact (T1486 Data Encrypted for Impact, T1485 Data Destruction)
- Cartographie vers outils défensifs (Sigma rules, EDR coverage, SIEM queries)
- Cartographie vers outils offensifs (Caldera, Atomic Red Team, MITRE ATT&CK Navigator)
- Utilisation pour threat intelligence (profiling APT)

**Sous-thèmes C1.5 Active Directory offensif** :
- Architecture AD (forêts, domaines, OU, trusts, FSMO, sites, GC)
- Kerberos protocol complet (AS-REQ/REP, TGS-REQ/REP, S4U2Self/Proxy)
- NTLM relay, NTLM v1/v2, Net-NTLMv2, pass-the-hash
- Attaques Kerberos (Kerberoasting, ASREPRoast, Golden Ticket, Silver Ticket, Diamond Ticket, Sapphire Ticket)
- Délégation (unconstrained, constrained, RBCD)
- ACL abuse (GenericAll, GenericWrite, WriteOwner, WriteDACL)
- Privilèges (SeEnableDelegation, SeBackup, SeRestore)
- AD CS attaques (ESC1 à ESC15 Certipy)
- SCCM attaques
- LAPS, gMSA abuse
- Cross-domain / cross-forest (SIDHistory, printer bug, MachineAccountQuota)
- Bloodhound méthodologie (collecte SharpHound, analyse cypher queries, édition custom)
- Azure AD / Entra ID recon et attaques (AADInternals, ROADtools, Graph API abuse)
- Hybrid attacks (AD Connect, Golden SAML, Seamless SSO)
- Détection (evt 4624/4625/4768/4769/4662, Sigma, LAPS monitoring)

**Sous-thèmes C1.6 complet (web avancé)** :
- Authentication flaws (SAML, OAuth, OIDC, JWT attacks)
- Session handling avancé
- SSRF avancée (blind, cloud metadata, internal port scan)
- Deserialization (Java, .NET, PHP, Python, YAML)
- Template injection (SSTI par engine : Jinja2, Twig, Velocity, Thymeleaf)
- NoSQL injection
- GraphQL security
- API security (REST, GraphQL, gRPC — abus spécifiques)
- WebSocket security
- HTTP request smuggling (CL.TE, TE.CL, TE.TE)
- Cache poisoning, cache deception
- Prototype pollution
- DOM clobbering
- PortSwigger Web Academy roadmap complet (toutes catégories, labs ordonnés)
- Méthodologie bug bounty (scope, recon, priorisation, reporting)

**Sous-thèmes C1.7 Exploitation** :
- Fondamentaux architecture (x86/x64/ARM, stack, heap, registers)
- Buffer overflow linéaire (Linux x86 → x64 → Windows)
- Stack canaries, ASLR, NX/DEP, PIE, RELRO — mitigations et bypass
- ROP/JOP/COP (gadget finding avec ropper, pwntools)
- Format string exploitation
- Heap exploitation (tcache poisoning, fastbin attacks, unsorted bin, House of X)
- Use-after-free, double-free
- Integer overflow → buffer overflow
- Kernel exploitation intro (Linux kernel land basics)
- Windows exploitation basics (SEH, pointer chains, egghunter)
- Fuzzing basics (AFL++, libFuzzer, honggfuzz)
- Symbolic execution basics (angr)
- OSCP-style exploitation (rapport, méthodologie)

### Tier 3B — Defensive (spécialisation blue team)

| # | Cluster | Pages | Priorité | Certifs alignées | Fact-check |
|---|---|---|---|---|---|
| **C1.9** | Blue Team opérations (SOC, SIEM, SOAR, detection engineering, Sigma) | 80–120 | Pilier | BTL1, CySA+, GCIA | Moyen |
| **C1.10** | Digital Forensics et Incident Response (DFIR) | 60–100 | Pilier | GCFA, BTL1, GCIH | Fort |
| **C1.16** | Tooling défensif (Splunk, Elastic, Wazuh, YARA, Velociraptor, Zeek) | 60–100 | Pilier | Splunk Core, Elastic Eng | Moyen |

**Sous-thèmes C1.9 Blue Team** :
- Structure et fonctionnement d'un SOC (niveaux 1/2/3, runbook, escalation)
- SIEM (Splunk, QRadar, Sentinel, Elastic SIEM, Chronicle) — architecture, ingestion, rules engine
- Log sources prioritaires (Windows Event, Sysmon, AD, proxy web, DNS, EDR, VPN, firewall)
- Detection engineering (pyramide des douleurs de Bianco, hypothèse-based detection)
- Langages de détection (Sigma, KQL, SPL, Lucene, YARA-L)
- SOAR (Tines, Shuffle, Splunk SOAR, XSOAR)
- Threat hunting méthodologie (TaHiTI, PEAK)
- EDR/XDR (CrowdStrike Falcon, SentinelOne, Defender for Endpoint, Elastic Security)
- Métriques SOC (MTTD, MTTR, false positive rate, coverage ATT&CK)
- Purple teaming et validation de détection (Atomic Red Team, Caldera, Red Canary)
- Use cases prioritaires par catégorie ATT&CK

**Sous-thèmes C1.10 DFIR** :
- Méthodologie IR (NIST SP 800-61, SANS PICERL)
- Acquisition (ordre de volatilité, chain of custody, FTK Imager, dd, Magnet AXIOM)
- Disk forensics (NTFS internals, MFT, USN journal, $LogFile, artefacts registry)
- Memory forensics (Volatility, Rekall, plugins clés : pslist, netscan, malfind, hollowfind)
- Network forensics (PCAP analysis, Zeek logs, full packet capture)
- Windows artifacts (SRUM, prefetch, amcache, shimcache, jumplists, LNK)
- Linux artifacts (auth logs, bash history, systemd, audit.log, last)
- Cloud forensics (AWS CloudTrail, Azure activity logs, GCP audit logs)
- Container forensics (Docker diff, runc, containerd)
- Anti-forensics et détection
- Timeline analysis (plaso/log2timeline, sleuthkit, timesketch)
- Case management (TheHive, GRR, Velociraptor)
- Rédaction de rapport IR, communication exec, legal hold

### Tier 4 — Spécialisations avancées

| # | Cluster | Pages | Priorité | Certifs alignées |
|---|---|---|---|---|
| **C1.8** | Reverse engineering et malware analysis | 50–80 | Standard | GREM, OSCE³ |
| **C1.11** | Threat Intelligence et OSINT | 50–80 | Standard | GOSI, CTIA |
| **C1.12** | Cloud Security (AWS/Azure/GCP, CSPM, CNAPP, IAM, Kubernetes sec) | 60–100 | Pilier | AWS Sec Specialty, AZ-500, CCSP |
| **C1.17** | Ransomware, APT et threat actors (profils, TTP, campagnes historiques) | 80–120 | Standard | veille |
| **C1.18** | Physical security, IoT/OT, ICS/SCADA, radio, RFID | 40–60 | Deep-cut | GICSP |

**Sous-thèmes C1.8 Reverse et malware** :
- Static analysis (PE format, ELF, Mach-O, strings, entropy, imports)
- Outils static (Ghidra ★, IDA Free, Binary Ninja, radare2, Hopper)
- Dynamic analysis (x32/x64dbg, windbg, gdb+peda/pwndbg, Frida)
- Sandboxing (Cuckoo, CAPE, Hybrid Analysis, any.run — pièges legal)
- Malware families (RAT, info stealer, loader, wiper, ransomware, rootkit, bootkit)
- Anti-analysis techniques (anti-debug, anti-VM, obfuscation, packing)
- Unpacking manuel (UPX, custom packers, ASPack)
- Emulation (unicorn, qiling, Speakeasy)
- Reversing .NET (dnSpy, ILSpy) et Java
- Mobile reversing (APK via jadx, iOS via Hopper)
- Firmware analysis (binwalk, firmwalker, emulation qemu)
- YARA rule writing

**Sous-thèmes C1.12 Cloud Security** :
- Shared Responsibility Model (détaillé par cloud)
- Identity cloud (AWS IAM, Azure Entra ID, GCP IAM, OIDC, SAML)
- Privilege escalation paths par cloud (pacu, ROADtools, pmapper, PurplePanda)
- Misconfigurations courantes (S3 public, Blob public, Kubernetes exposed)
- Network security cloud (VPC/VNet, security groups/NSG, peering, Private Link)
- Secrets management cloud (Secrets Manager, Key Vault, Secret Manager GCP, Vault)
- CSPM et CNAPP (Prisma Cloud, Wiz, Orca, OSS : CloudSploit, ScoutSuite, CloudMapper, Steampipe)
- Container / Kubernetes security (OPA/Gatekeeper, Kyverno, Falco, Trivy, kube-bench, kube-hunter)
- Serverless security
- Cloud incident response spécificités
- Multi-cloud et cross-cloud attacks
- Compliance cloud (SOC 2, CSA CCM, FedRAMP)

### Tier transverses — Gouvernance et tooling

| # | Cluster | Pages | Priorité | Certifs alignées | Notes |
|---|---|---|---|---|---|
| **C1.13** | Hardening et conformité (CIS, ANSSI, NIST 800, ISO 27001/27002, NIS2, RGPD, DORA, AI Act) | 80–120 | Pilier | CISSP, CISM, ISO 27001 LA | Fort |
| **C1.14** | Social engineering et sécurité humaine | 40–60 | Standard | — |
| **C1.19** | Roadmap certifications cyber (document vivant — ta propre planification) | 30–50 | Pilier | — |

**Sous-thèmes C1.13 Conformité** :
- ISO 27001/27002 (SMSI, contrôles Annexe A, audits)
- ISO 27005 (risk management)
- NIST Cybersecurity Framework (Identify, Protect, Detect, Respond, Recover, Govern)
- NIST SP 800-53, 800-171, 800-61, 800-63 (eIAS), 800-207 (Zero Trust)
- CIS Benchmarks (Windows, Linux, AWS, Azure, K8s)
- CIS Controls v8
- Référentiels ANSSI (PSSIE, RGS, PDIS, PRIS, PSSI-E)
- Directive NIS2 (transposition France)
- RGPD (principes, rôles DPO, AIPD, sanctions CNIL)
- DORA (finance UE)
- Cyber Resilience Act
- AI Act (classification systèmes IA, obligations)
- PCI-DSS v4 (pour commerce)
- HIPAA, SOC 2 Type II (États-Unis, souvent rencontré)
- Méthodes d'audit (interne, tierce partie, certification)

---

## 5. Stack outillée 2026 (Edu → OSS → Commercial)

### Labs et environnements d'entraînement

| Outil | Type | Fiabilité | Usage |
|---|---|---|---|
| **Cisco Networking Academy** | Edu gratuit | ★★★★★ | CCNA/CCNP officiel, Packet Tracer inclus |
| **TryHackMe Student Subscription** | Commercial avec réduction étudiant | ★★★★★ | Parcours guidés, rooms thématiques |
| **Hack The Box Student (HTB Academy)** | Commercial, **50% off étudiants** | ★★★★★ | CPTS/CBBH, meilleurs labs AD |
| **PortSwigger Web Security Academy** | Gratuit | ★★★★★ | Meilleur labo web OSS au monde |
| **pwn.college** | Gratuit (Arizona State Univ) | ★★★★★ | Exploit dev, brillant |
| **OverTheWire** | Gratuit | ★★★★★ | Bases Linux/crypto |
| **RootMe** | Gratuit (FR) | ★★★★ | Communauté francophone active |
| **VulnHub** | OSS | ★★★★ | VMs téléchargeables |
| **Immersive Labs** | Commercial | ★★★★ | Souvent fourni par employeur |
| **Altered Security** (CRTP, CRTE, CRTM) | Commercial | ★★★★★ | Référence AD offensif |
| **SANS Cyber Aces** | Gratuit SANS | ★★★★ | Fondamentaux |
| **OffSec Learn One** | Commercial | ★★★★ | Pack annuel OSCP, PEN-200/PEN-300 |

### Homelab technique

| Outil | Type | Fiabilité | Usage |
|---|---|---|---|
| **Proxmox VE** | OSS | ★★★★★ | Hyperviseur homelab référence |
| **VirtualBox** | OSS | ★★★ | Simple, pour débuter |
| **VMware Workstation Player** | Gratuit perso | ★★★★ | — |
| **GNS3** | OSS | ★★★★★ | Simulation réseau, labs CCNP |
| **EVE-NG Community** | OSS | ★★★★ | Alternative GNS3, IOS images requises |
| **Cisco Modeling Labs** (CML) | Edu via NetAcad | ★★★★★ | Version officielle Cisco |
| **Kali Linux** | OSS | ★★★★★ | Distribution offensive standard |
| **Parrot Security OS** | OSS | ★★★★ | Alternative Kali plus légère |
| **REMnux** | OSS | ★★★★★ | Distribution malware analysis |
| **SIFT Workstation** | OSS | ★★★★★ | Distribution DFIR SANS |
| **Security Onion 2.x** | OSS | ★★★★★ | SIEM/NSM pré-packagé pour labs blue team |

### Tooling offensif (C1.15 référencé)

Recon/scan : **nmap** ★, masscan, rustscan, **naabu**, amass, subfinder, httpx, nuclei

Web : **Burp Suite Community/Pro**, ZAP, Caido, ffuf, feroxbuster, gobuster, **sqlmap**, wfuzz

Exploitation : **Metasploit Framework**, **Impacket** (incontournable AD), **CrackMapExec/NetExec**, responder, mitm6

AD spécifique : **BloodHound / AzureHound**, **Rubeus**, **Certipy**, **Mimikatz**, **Certify**, **ADRecon**, **SharpHound**, **PowerView** (ported PowerSploit), **PowerUp**

C2 : **Sliver** (OSS, Go) ★, **Havoc** (OSS), **Mythic** (OSS), **Covenant** (OSS), Cobalt Strike (commercial, licence chère)

Post-exploitation : **LinPEAS/WinPEAS**, pspy, seatbelt

Cracking : **hashcat**, **John the Ripper**

Mobile : **Frida**, objection, MobSF

### Tooling défensif (C1.16 référencé)

SIEM : **Wazuh** (OSS, pré-packagé) ★, **Elastic SIEM** (OSS), **Splunk** (gratuit dev), **MS Sentinel**, Graylog, OpenSearch

EDR OSS/hybride : **Velociraptor** ★, **osquery**, **Wazuh agent**, **Sysmon** (gratuit Microsoft)

Threat hunting : **Hayabusa** (Windows EVT analysis), **Chainsaw**, **Zircolite**

Network : **Zeek** (ex-Bro) ★, **Suricata** ★, **Snort 3**, **Arkime/Moloch** (full PCAP)

Detection rules : **Sigma** ★, **Yara** ★, **Elastic Rules** (OSS), **Sigma2Splunk/Sentinel/Elastic**

Forensics : **Autopsy/Sleuthkit** (OSS), **Volatility 3** ★, **Plaso/log2timeline**, **TheHive 5**, **Cortex**, **MISP**

OSINT : **Maltego Community**, **SpiderFoot OSS**, **recon-ng**, **theHarvester**, **Sherlock**

### Plateformes bug bounty (pour monétiser tes skills web)

| Plateforme | Type | Notes |
|---|---|---|
| **HackerOne** | Commercial | Leader marché, programmes privés/publics |
| **Bugcrowd** | Commercial | Alternative US |
| **YesWeHack** | Commercial FR | Leader européen, programmes ANSSI et gouvernements |
| **Intigriti** | Commercial BE | Croissance forte en Europe |
| **Immunefi** | Commercial | Web3/smart contracts, primes élevées |

---

## 6. Ressources d'apprentissage de référence (par tier)

### Tier 0–1 (fondamentaux)

- *The Linux Command Line* — William Shotts (gratuit)
- *Windows Internals* — Russinovich et al. (référence Windows)
- *Network Security Essentials* — William Stallings
- *Computer Security: Principles and Practice* — Stallings & Brown
- **professormesser.com** — cours Security+ gratuits, excellents ★
- **ANSSI guides** (ssi.gouv.fr/guide) — gratuits, niveau pro
- **CyberChef** — outil navigateur pour apprendre l'encodage/crypto

### Tier 2 (hands-on entry)

- *The Web Application Hacker's Handbook* (Stuttard, 2nd) — vieilli mais base
- **PortSwigger Web Security Academy** (labs + lecture) ★★★
- *Penetration Testing: A Hands-On Introduction* — Georgia Weidman
- *Linux Basics for Hackers* — OccupyTheWeb
- **TryHackMe paths** : Complete Beginner, Jr Penetration Tester, SOC Level 1

### Tier 3A (offensive avancée)

- *The Hacker Playbook 3* — Peter Kim
- *Red Team Field Manual* (RTFM)
- *Black Hat Python* 2nd ed — Justin Seitz
- *The Art of Exploitation* — Jon Erickson (fondamentaux exploit)
- **ired.team** — wiki red team ★
- **hacktricks.xyz** — wiki exhaustif techniques ★
- **pentestlab.blog** — très bons walk-throughs
- **SpecterOps blog** (Bloodhound, AD attacks) — référence
- **harmj0y blog archives** (PowerSploit, etc.)

### Tier 3B (défensive avancée)

- *Blue Team Handbook: Incident Response Edition* — Don Murdoch
- *The Practice of Network Security Monitoring* — Richard Bejtlich
- *Applied Incident Response* — Steve Anson
- *Threat Hunting in the Cloud* — Peter H. Gregory
- **SANS Reading Room** (gratuit) ★
- **Red Canary blog** — detection engineering top niveau
- **Elastic Security Labs**
- **MITRE ATT&CK blog** et évaluations annuelles

### Tier 4 (spécialisations)

Reverse/Malware :
- *Practical Malware Analysis* — Sikorski & Honig (référence absolue)
- *The IDA Pro Book* — Chris Eagle
- *Practical Reverse Engineering* — Dang, Gazet, Bachaalany

Cloud Security :
- **AWS Security documentation** officielle
- **Azure Security docs**
- **Kubernetes Hardening Guide** (NSA/CISA)
- **awesome-cloud-security** (GitHub)
- **Wiz research blog**, **Orca Security blog**

ICS/OT :
- *Industrial Network Security* — Knapp & Langill
- **SANS ICS training** (coûteux mais excellent)

### Chaînes YouTube / podcasts (francophones et internationaux)

FR : **Processus Thief**, **Hackademie**, **Waked XY**, **Defend Intelligence**

INT : **IppSec** ★ (HTB walkthroughs de référence), **John Hammond**, **LiveOverflow** ★ (exploit dev), **The Cyber Mentor** (TCM), **NetworkChuck**, **Seytonic**, **David Bombal** (réseau/cyber)

Podcasts : **Darknet Diaries**, **Risky Business**, **SANS Internet Storm Center Daily Podcast**, **Malicious Life**

### Newsletters et veille

Veille vulns : **CERT-FR bulletins** ★, **CISA alerts**, **Patch Tuesday news**, **oss-security mailing list**

Veille threat intel : **The DFIR Report**, **Mandiant blog**, **Google TAG**, **Microsoft Threat Intelligence**

Général cyber : **tl;dr sec** (Clint Gibler) ★, **Risky Biz News**, **Bleeping Computer**, **Krebs on Security**

---

## 7. Phasing concret pour Anthony

Compte tenu de ton profil Bac+3 alternance cyber, voici la séquence calibrée.

### 6 prochains mois (Phase A — fondamentaux à clouer)

**Clusters Obsidian à produire** (dans l'ordre) :

1. **C1.1 Fondamentaux cybersec** (40 pages pilote, puis 40 en production)
2. **C1.3 Réseaux et sécurité réseau** — en parallèle CCNA (40 pilote)
3. **C1.2 Cryptographie** (40 pilote)
4. **C1.6 partie intro — OWASP Top 10** (40 pilote, avant même T2 technique)

**Certifs à passer** : CC (ISC²) → Security+ → eJPT

**Labs à faire** : PortSwigger Academy (au moins les catégories Auth, SQLi, XSS), TryHackMe parcours Jr Pentester et SOC L1 niveau 1-5

Budget vault : ~400 € tokens. Budget certifs : ~700-900 € si tu ne bénéficies pas de toutes les réductions étudiantes.

### Mois 7–12 (Phase B — spécialisation offensive amorcée)

**Clusters** :

5. **C1.4 MITRE ATT&CK** — énorme cluster (pilote 40, puis production en 3 vagues de 50-80)
6. **C1.5 Active Directory offensif** (pilote 40, production 80-120)
7. **C1.6 complet Web avancé** (production 80-120)
8. **C1.15 Tooling offensif complet** (production 80-120)

**Certifs** : PNPT → CRTP

**Labs** : HTB Academy parcours Pentester/Senior Pentester, Altered Security AD Advanced, CRTP labs

### Mois 13–24 (Phase C — offensive avancée + introduction défensive)

9. **C1.7 Exploitation** (pilote + production)
10. **C1.9 Blue Team opérations** (pilote + production)
11. **C1.16 Tooling défensif** (production)
12. **C1.10 DFIR** (pilote)
13. **C1.13 Hardening et conformité** (pilote, sensible → fact-check renforcé)
14. **C1.12 Cloud Security** (production, en lien avec D3 Cloud)

**Certifs** : OSCP → BTL1 → CCNP ENCOR

**Labs** : OffSec PWK PEN-200 complet, BTL1 labs, TryHackMe SOC L2

### Mois 25-36 (Phase D — expertise et gouvernance)

15. **C1.8 Reverse et malware**
16. **C1.11 Threat Intelligence et OSINT**
17. **C1.17 Ransomware et APT**
18. **C1.18 Physical/IoT/OT** (si pertinent)
19. **C1.14 Social engineering**

**Certifs** : CySA+ ou GCFA ou GCIH selon trajectoire employeur → première cert cloud security (AZ-500 ou AWS Sec Specialty)

### Maintenance en continu (à partir de la phase B)

- **C1.19 Roadmap certifications** devient un document vivant, mis à jour mensuellement
- Re-run annuel de C1.13 Hardening/Conformité (réglementaire bouge vite)
- Review trimestrielle de C1.4 MITRE ATT&CK (updates framework)
- Capture continue de CTF writeups dans un cluster vivant (voir D6 C6.6)

---

## 8. Points de vigilance spécifiques cyber

**Législation française** — avant toute pratique offensive sur une cible tierce, vérifier autorisation écrite. Articles 323-1 à 323-8 du Code pénal. Le vault doit marquer explicitement sur toute page de tooling offensif : usage strictement autorisé en lab personnel, dans un programme bug bounty, ou en mission de pentest avec autorisation explicite.

**Données sensibles** — certains clusters touchent à des données qui, si compilées et partagées, deviennent problématiques (dossiers APT, techniques d'évasion EDR). Garder le vault strictement local ou dans un repo privé chiffré. Pas de push sur un GitHub public. Option Syncthing + Git privé self-hosted.

**Hype vs réalité** — les certifications offensives génèrent beaucoup de contenu marketing. La plupart des « secrets » sont déjà dans ippsec et hacktricks. Évite d'acheter des formations à 3000 € avant d'avoir épuisé TryHackMe, HTB Academy et PortSwigger.

**Turnover des outils** — le paysage tooling change vite. Netexec a remplacé CrackMapExec, Sliver gagne contre Cobalt Strike côté budget, Havoc émerge. Le champ YAML `valide_jusqu_a` est obligatoire sur les pages outillage pour te forcer à réévaluer annuellement.

**Éthique et réputation** — une carrière cyber se construit aussi sur la réputation communautaire. CTF teams, write-ups publics bien faits, contributions open source, conférences (Pass the SALT, LeHACK, Hack.lu) comptent autant que les certifs dans certains recrutements.

---

## 9. Intégration dans le vault maître

Dans ton vault, ce track se matérialise sous `/10-Cybersecurite/` :

```
10-Cybersecurite/
├── _MOC-Cybersecurite.md
├── _Learning-Path-Cyber-2026.md          # ce document
├── C1.1-Fondamentaux/
├── C1.2-Cryptographie/
├── C1.3-Reseaux-Securite/
├── C1.4-MITRE-ATT&CK/                    # le gros
├── C1.5-Active-Directory/
├── C1.6-Offensive-Web/
├── C1.7-Exploitation/
├── C1.8-Reverse-Malware/
├── C1.9-Blue-Team/
├── C1.10-DFIR/
├── C1.11-Threat-Intel-OSINT/
├── C1.12-Cloud-Security/
├── C1.13-Hardening-Conformite/
├── C1.14-Social-Engineering/
├── C1.15-Tooling-Offensif/
├── C1.16-Tooling-Defensif/
├── C1.17-Ransomware-APT/
├── C1.18-Physical-IoT-OT/
└── C1.19-Roadmap-Certifs/
```

### Wikilinks transverses prévus

- C1.4 MITRE ATT&CK ↔ C1.9 Blue Team (mapping tactique → détection)
- C1.5 AD offensif ↔ C1.9 Blue Team (détection des attaques AD)
- C1.6 Web ↔ C2.3A.7 FastAPI + C2.3B Node (secure coding côté dev)
- C1.7 Exploitation ↔ C2.7.1 Rust (exploit dev moderne)
- C1.12 Cloud Security ↔ C3.1 AWS + C3.2 Azure + C3.4 Kubernetes
- C1.13 Conformité ↔ D9 Finances (DORA pour aspect personnel)
- C1.14 Social engineering ↔ C10.1 Biais cognitifs (fondation psycho)
- C1.15 Tooling offensif ↔ C2.3A.12 Python cybersec
- C1.17 Ransomware ↔ C1.10 DFIR (cas concrets)

---

## 10. Prochaine action recommandée

Après ton pilote C2.0.6 (Dev) validé, le cluster cybersec de démarrage naturel est **C1.1 Fondamentaux cybersec**.

Raisons :

1. Tu connais déjà une partie du terrain (tu pourras juger la qualité en checkpoint 2).
2. Cluster cadré, faible controverse technique, fact-check modéré.
3. Prérequis absolu pour les clusters suivants (C1.2 crypto, C1.3 réseaux, C1.13 conformité reposent dessus).
4. Pages pilotes réutilisables comme base de révision Security+.

Alternative si tu as déjà solidement T1 et veux passer directement à la valeur carrière : **C1.5 Active Directory offensif** (priorité maximale pour CRTP/OSCP/PNPT, ROI immédiat en alternance).

Dis-moi lequel et je te prépare le `PROMPT-PILOT` dédié avec `DESCRIPTION_CLUSTER` calibrée.
