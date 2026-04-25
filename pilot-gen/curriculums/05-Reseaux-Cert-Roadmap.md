---
titre: "Réseaux et Certifications Cisco, Carnet de Route Complet (CCNA, CCNP, CCIE)"
domaine: D5-Reseaux
type: curriculum
statut: vivant
créé: 2026-04-22
révisé: 2026-04-22
valide_jusqu_a: 2026-10-22
tags: [reseaux, cisco, ccna, ccnp, ccie, routing, switching, sdn, sdwan, curriculum, roadmap]
liens: ["[[00-Architecture-Vault-Second-Brain]]", "[[02-Cybersec-Curriculum]]", "[[03-Cloud-Curriculum]]"]
---

# Réseaux et Certifications Cisco, Carnet de Route Complet

> Document compagnon du vault. Décrit la progression pour maîtriser les réseaux TCP/IP modernes et passer les certifications Cisco (CCNA, CCNP) qui restent la référence marché, en couvrant aussi les alternatives open source et vendor-neutral.

## 0. Pourquoi les réseaux en 2026 ?

Trois raisons pour un profil dev/cybersec :

1. **Toute la cybersécurité repose sur le réseau**. Pas d'analyse de trafic, pas de détection, pas de segmentation sans comprendre OSI/TCP-IP, VLAN, routage, VPN, firewalling. Voir [[02-Cybersec-Curriculum]] C1.9 (Linux, Windows, réseau).
2. **Le cloud repose sur le réseau**. VPC, peering, transit gateway, VPN, ExpressRoute, Private Link, CDN, anycast : tout réutilise les fondamentaux. Voir [[03-Cloud-Curriculum]] C3.5.
3. **Cisco reste la référence certification** en entreprise (banques, industrie, opérateurs, administrations). Alternatives : Juniper (JNCIA/JNCIS/JNCIP), Arista, Fortinet (NSE). CCNA reste le "bagage commun" le plus reconnu mondialement.

Pour Anthony (cybersec + dev), un CCNA bien réalisé est un **investissement à rentabilité très élevée** : il débloque les missions réseau en alternance, renforce les compétences offensives/défensives, et se complète naturellement avec la cert Sec+ ou eJPT.

## 1. Paysage 2026

### 1.1 Évolutions récentes

- **CCNA 200-301** : examen courant, mis à jour en 2024 (v1.1, puis léger refresh 2025). Reste le seul CCNA (plus de tracks séparés depuis 2020).
- **CCNP Enterprise** en deux étapes : ENCOR 350-401 (core, obligatoire) + une concentration (ENARSI, ENSLD, ENWLSI, ENWLSD, ENAUTO, SPCOR, etc.).
- **CCIE Enterprise Infrastructure** : cert expert, qualification + lab 8h.
- **DevNet certifications** (Cisco) : **DevNet Associate**, **DevNet Professional**. Parfaitement complémentaires avec un profil dev (automation réseau Python, NETCONF/RESTCONF, Ansible, Terraform).
- **SD-WAN et SD-Access** intégrés dans CCNP Enterprise ENARSI/ENSDWI.
- **Zero Trust Networking** pousse la partie firewall/identité/microseg (Cisco ISE, SecureX, Umbrella) à jour.

### 1.2 Certifications non-Cisco pertinentes

| Cert | Vendor | Niveau | Valeur marché |
|---|---|---|---|
| **CompTIA Network+** | CompTIA | Entry | Faible-moyenne en FR, utile comme introduction |
| **JNCIA-Junos** | Juniper | Associate | Moyenne, très utile en opérateur/ISP |
| **JNCIS / JNCIP / JNCIE** | Juniper | Pro/Expert | Reconnue opérateurs |
| **Aruba ACA / ACP** | HPE Aruba | Associate/Pro | Dans contexte Aruba WiFi/switching |
| **Arista ACE** | Arista | Associate | Datacenter, niche |
| **Fortinet NSE 4/5/6/7/8** | Fortinet | Progressif | Très demandée en PME/ETI FR (firewall) |
| **Palo Alto PCNSA / PCNSE** | Palo Alto | Associate/Pro | Haut de gamme firewall |
| **SD-WAN specifics** | Cisco, VMware VCP-NV | - | - |

Pour Anthony en FR : **CCNA en priorité**, puis selon alternance éventuellement **Fortinet NSE 4** (très fréquent en PME/ETI) ou **Palo Alto PCNSA**.

## 2. Progression par paliers

### T0, Prérequis

- Linux basique (ip a, ip route, iptables/nftables basiques, tcpdump) : voir [[02-Cybersec-Curriculum]] C1.9.
- Connaître ce qu'est une adresse IP, un port, un DNS (culture basique).
- Python de base pour l'automation réseau en T4.

### T1, Fondamentaux réseau (3-4 mois)

Objectif : maîtriser OSI/TCP-IP, IPv4/IPv6 subnetting, Ethernet, VLAN, routage statique.

Clusters : C5.1 (OSI et TCP/IP), C5.2 (IPv4/IPv6 subnetting), C5.3 (Switching), C5.4 (Routing fondamentaux).

**Labs recommandés** :
- **Cisco Packet Tracer** (gratuit via Cisco Networking Academy, plan Edu Cisco NetAcad gratuit). Suffit pour 80% du CCNA.
- **Boson NetSim** (commercial, le simulateur payant de référence).

**Ressources** :
- Cours **Cisco Networking Academy "Introduction to Networks"** (CCNAv7), gratuit avec inscription NetAcad (souvent via école).
- **Jeremy's IT Lab** (YouTube, CCNA 200-301 cours complet gratuit, référence absolue).
- **"CCNA 200-301 Official Cert Guide"**, Wendell Odom (Cisco Press).

### T2, Routing/Switching avancé + services (3-4 mois)

Objectif : OSPF, EIGRP (culture), STP, EtherChannel, DHCP/DNS/NAT, ACL, VPN site-to-site (IPsec, GRE).

Clusters : C5.4 (suite routing, OSPF), C5.3 (suite switching STP/EtherChannel), C5.6 (services réseau), C5.7 (WAN/VPN).

**Labs** : GNS3 ou EVE-NG en complément de Packet Tracer (surtout pour OSPF multi-area, ACL avancées).

**Certification cible** : **CCNA 200-301**.

### T3, CCNP Enterprise ENCOR (6-9 mois)

Objectif : approfondir et toucher aux technologies modernes (SDN/SD-WAN/SD-Access, QoS, sécurité réseau, wireless, automation).

Clusters : C5.5 (BGP culture, OSPF avancé), C5.7 (SD-WAN), C5.8 (Wireless), C5.9 (Security), C5.10 (Automation).

**Certification cible** : **CCNP Enterprise ENCOR 350-401**.

### T4, Spécialisation CCNP Concentration (3-6 mois)

Au choix selon projet :
- **ENARSI 300-410** : routing avancé (BGP profond, MPLS intro, IPv6, infra services).
- **ENSDWI 300-415** : SD-WAN Cisco Viptela profond.
- **ENSLD 300-420** : Network design.
- **ENWLSI / ENWLSD 300-430 / 300-425** : Wireless implementation / design.
- **ENAUTO 300-435** : Network automation (très pertinent pour Anthony dev !).

### T5, Expert (post-diplôme)

- **CCIE Enterprise Infrastructure** (qualification + lab 8h, 6-18 mois de prépa).
- Alternatives : **JNCIE**, spécialisations datacenter, sécurité.

## 3. Clusters détaillés

### C5.1, Modèles OSI et TCP/IP

Sous-thèmes :
- 7 couches OSI vs 4/5 couches TCP/IP
- Encapsulation/désencapsulation (frame, packet, segment, datagramme)
- PDU par couche
- Unités (bit, byte, frame, MTU, MSS)
- Câblage (cat 5e/6/6a/7/8, fibre mono/multi-mode, connecteurs LC/SC)
- Standards Ethernet (10M → 400G, les différentes physical layers)
- Hub vs switch vs router (contexte historique)
- Broadcast, unicast, multicast, anycast

### C5.2, IPv4, IPv6, subnetting

Sous-thèmes :
- Classes historiques A/B/C (culture)
- CIDR notation et VLSM
- Subnetting à vue (méthode magic number, méthode par puissance de 2)
- Adresses privées RFC1918, APIPA, loopback, multicast 224.0.0.0/4
- NAT static/dynamic/PAT
- IPv6 : format 128 bits, SLAAC, EUI-64, link-local (fe80::/10), global unicast (2000::/3), unique local (fc00::/7)
- Transition IPv6 : dual stack, tunneling (6to4, 6rd, Teredo), NAT64/DNS64
- Discovery IPv6 : NDP (Neighbor Discovery Protocol) remplaçant ARP

Exercices : lister 10 scénarios de subnetting, les faire à la main, valider avec un script Python.

### C5.3, Switching et Ethernet

Sous-thèmes :
- Adresses MAC (OUI, format, unicité)
- Ethernet frame (preamble, SFD, src/dst MAC, EtherType, payload, FCS)
- VLAN : access vs trunk, 802.1Q tagging, native VLAN
- VTP (Cisco, souvent évité en prod), DTP
- Inter-VLAN routing : router-on-a-stick vs SVI sur switch L3
- STP : 802.1D (legacy), PVST+, Rapid PVST+, MST (802.1s). Root bridge election, port states (blocking, listening, learning, forwarding, disabled), PortFast, BPDU Guard, Root Guard, Loop Guard
- EtherChannel : LACP (802.3ad), PAgP, static. L2 vs L3 EtherChannel
- DHCP snooping, Dynamic ARP Inspection (DAI), IP Source Guard, Port Security : mécanismes de sécurité L2 (transverse [[02-Cybersec-Curriculum]] C1.9)

### C5.4, Routing fondamentaux

Sous-thèmes :
- Routing statique, default route
- Dynamic routing : distance-vector vs link-state vs path-vector
- Administrative distance (table Cisco classique)
- Metric par protocole
- **OSPFv2 (IPv4)** et **OSPFv3 (IPv6)** : area, types de LSA, adjacency states, DR/BDR, authentification
- **EIGRP** : DUAL algorithm, composite metric (bande passante, délai, load, reliability, MTU culture), feasible successor, offset-list (culture Cisco CCNA, moins utilisé en pratique hors Cisco pure)
- **RIPv2** (culture uniquement)
- Route redistribution, metric manipulation, route filtering
- Equal-cost multipath (ECMP)

### C5.5, BGP et Internet

Sous-thèmes :
- iBGP vs eBGP
- BGP attributes : AS-path, next-hop, local preference, MED, origin, community, weight (Cisco spécifique)
- BGP selection process (13 steps officiels)
- Route reflectors, confederations
- BGP neighbor states
- BGP pour multi-homing Internet, peering opérateurs
- MP-BGP pour IPv6, VPNv4, EVPN
- Sécurité BGP : RPKI, ROA, route hijacking (transverse cybersec)
- Looking glasses, BGP mirror, LG tools

### C5.6, Services réseau

Sous-thèmes :
- **DNS** : hiérarchie, types d'enregistrements (A, AAAA, CNAME, MX, TXT, SRV, NS, SOA), TTL, DNSSEC, DoH/DoT, DNS over QUIC
- **DHCP** : DORA process, options DHCP, relay agent, DHCPv6 (stateful vs stateless)
- **NTP** : hiérarchie stratums, pool.ntp.org, Chrony vs NTPd, NTS (Network Time Security)
- **SNMP** : v1/v2c/v3, MIB/OID, traps. Sécurité SNMPv3 obligatoire en 2026
- **Syslog** : facility/severity, RFC 5424, fiabilisation RELP, transport TCP/TLS
- **Netflow / IPFIX / sFlow** : exports de flux pour visibilité
- **FHRP** : HSRP (Cisco), VRRP (standard), GLBP (Cisco)

### C5.7, WAN, VPN, SD-WAN

Sous-thèmes :
- Technologies WAN historiques (Frame Relay, ATM) : culture rapide
- MPLS, L3VPN (MPLS VPN), L2VPN (VPLS, EVPN)
- **IPsec** : IKEv1 vs IKEv2, phase 1/2, ESP/AH, transport vs tunnel mode, DPD
- **VPN site-to-site** classique, DMVPN (Cisco), FlexVPN
- **GRE** et GRE over IPsec
- **SSL/TLS VPN** : OpenVPN, AnyConnect, WireGuard (moderne, préféré quand possible)
- **SD-WAN** : overlay sur MPLS/Internet/LTE/5G, orchestration centralisée, zero-touch provisioning, vendors (Cisco Viptela/Meraki, Fortinet, Palo Alto Prisma, VMware VeloCloud, Aruba EdgeConnect)
- **SASE** : convergence SD-WAN + SSE (ZTNA, CASB, SWG, FWaaS), vendors (Cisco+Cloudflare, Zscaler, Palo Alto Prisma, Netskope)

### C5.8, Wireless (WiFi)

Sous-thèmes :
- Normes 802.11 : a/b/g/n/ac (Wi-Fi 5) / ax (Wi-Fi 6/6E) / be (Wi-Fi 7)
- Bandes 2.4 / 5 / 6 GHz, channels, channel bonding
- WLAN architecture : autonomous AP vs lightweight AP + WLC (CAPWAP), cloud-managed (Meraki)
- Sécurité : WEP (brisé), WPA2 Personal/Enterprise (PSK vs 802.1X), WPA3, PMF
- 802.1X et EAP : EAP-TLS, PEAP, EAP-TTLS, EAP-FAST
- Roaming : 802.11r (fast transition), 802.11k, 802.11v
- Wi-Fi security attacks (transverse cybersec) : Evil twin, KRACK (WPA2), FragAttack, WPA3 Dragonblood, OWE opportunistic wireless encryption

### C5.9, Sécurité réseau

Transverse fort avec [[02-Cybersec-Curriculum]] C1.9 et C1.4.

Sous-thèmes :
- **ACL** : standard, extended, named, object-group, time-based
- **Stateful firewall** : connexion tracking, NAT traversal
- **NGFW** : application awareness, IPS intégré, TLS inspection, user identity
- **Zero Trust Network Access (ZTNA)** : remplace progressivement le VPN traditionnel. Vendors : Cloudflare Zero Trust, Zscaler Private Access, Cisco Secure Access, Tailscale (OSS + SaaS, plan gratuit personnel généreux), NetBird (OSS)
- **Segmentation** : VLAN, VRF, micro-segmentation, Cisco TrustSec/SGT, VMware NSX
- **IDS/IPS** : Snort, Suricata (OSS référence), Zeek (ex-Bro, analyse comportementale)
- **Authentification** : 802.1X, RADIUS, TACACS+, ISE (Cisco), Aruba ClearPass, FreeRADIUS (OSS)
- **Monitoring** : Netflow, IPFIX, sFlow, Arkime (ex-Moloch, full packet capture OSS), Zeek logs
- **DDoS mitigation** : cloud (Cloudflare, AWS Shield, Azure DDoS Protection), on-prem (Radware, Arbor, Fastly)

### C5.10, Automation et NetDevOps

Sous-thèmes :
- **Python pour le réseau** : Netmiko, NAPALM, Nornir, Scrapli, Genie/pyATS (Cisco test framework OSS)
- **YANG models, NETCONF, RESTCONF, gNMI** : APIs structurées modernes
- **Ansible** pour la config réseau (modules cisco.ios, cisco.iosxr, junipernetworks.junos, arista.eos, fortinet.fortios, etc.)
- **Terraform providers réseau** : cisco-iosxe (officiel), junipernetworks, fortios, panos (Palo Alto), meraki
- **CI/CD réseau** : tests pré-déploiement (Batfish, suzieq, SnapShot testing), canary deployment
- **Source of truth réseau** : **NetBox** (OSS, référence IPAM/DCIM), **Nautobot** (fork OSS de NetBox avec plugins étendus)
- **Observability** : Prometheus SNMP exporter, Telegraf, Grafana
- **Events et ChatOps** : webhooks, Slack/Teams intégrations

**Certification clé pour cette partie** : **Cisco DevNet Associate 200-901** et **DevNet Professional**. Très pertinent pour Anthony (dev + réseau).

## 4. Labs : équipement progressif

### 4.1 Niveau étudiant / début CCNA

- **Packet Tracer** (gratuit, Cisco NetAcad). Couvre 80% CCNA, limite en fonctionnalités avancées.
- **Cisco NetAcad** : accès via école si partenariat. Sinon, inscription individuelle gratuite possible.
- **Boson NetSim** (commercial) : simulateur officieusement "recommandé" pour préparer CCNA, fidèle au comportement Cisco.

### 4.2 Niveau CCNP

- **GNS3** (OSS, gratuit). Émule des IOS réels, supporte des images IOL, IOSvL2, IOSv, et VMs (Linux, Windows, FortiOS, PAN-OS images trial). Pré-requis : machine avec 16-32 Go RAM, VT-x activé. Peut tourner sur un serveur distant (VM Proxmox).
- **EVE-NG Community Edition** (OSS limitée, version Pro payante). Plus moderne que GNS3, interface web. Recommandé en 2026.
- **Containerlab** (OSS, Nokia). Orchestration de labs réseau en conteneurs (sr-linux, ceos, frr, clab-specific images, vrnetlab pour NXOS/Arista vEOS/Junos). Excellent pour CI/CD labs.
- **FRRouting (FRR)** (OSS) : suite routing open source (OSPF, BGP, IS-IS, PIM). Excellent pour apprendre les protocoles sans devoir avoir d'image Cisco.

### 4.3 Niveau CCIE ou cas particuliers

- **Cisco Modeling Labs (CML)** : licence commerciale, version Personal abordable (~200 USD/an, parfois remisée). C'est le simulateur officiel Cisco, utilisé pour préparer CCIE.
- **dCloud Cisco** (accès Partner / Training) : labs managés par Cisco, souvent utilisé en formation.

### 4.4 Équipement physique d'occasion

Optionnel mais formateur :
- Switches Cisco 2960, 3560, 3750 : quelques dizaines d'euros sur eBay/leboncoin.
- Routeurs Cisco 1841, 2800, 2900 : abordables.
- Switches Juniper EX-series d'occasion : alternatives intéressantes.
- Petit rack 12U : environ 80-150 EUR.

## 5. Plan de certifications pour Anthony (3 ans)

### Année 1 : Fondamentaux et CCNA

- Mois 1-3 : C5.1, C5.2 (subnetting à fond, pratique quotidienne), C5.3 (switching).
- Mois 4-6 : C5.4 (routing OSPF), C5.6 (services), ACL basiques C5.9.
- Mois 7-9 : révisions intensives CCNA 200-301 + labs Packet Tracer + Boson ExSim (simulateur de questions).
- Mois 10-12 : **Passer le CCNA** (~300 USD). Prévoir 1-2 essais, s'autoriser à échouer et réviser ses points faibles.

Budget : CCNA ~300 USD + Boson ExSim optionnel 100 USD. Packet Tracer gratuit.

### Année 2 : CCNP Enterprise ENCOR + DevNet Associate

- Mois 1-6 : C5.5 (BGP), C5.7 (WAN/VPN/SD-WAN), C5.8 (Wireless), C5.9 (Security avancée), C5.10 (Automation début). Labs sur GNS3/EVE-NG.
- Mois 7-9 : révisions ENCOR 350-401.
- Mois 10-12 : **Passer ENCOR 350-401** (~400 USD) + en parallèle **DevNet Associate 200-901** (~300 USD) qui complète parfaitement le profil dev.

Budget : ~700 USD pour les deux.

### Année 3 : Concentration + approfondissement

- Choisir une concentration CCNP selon orientation :
  - Automation : **ENAUTO 300-435**.
  - Routing profond : **ENARSI 300-410**.
  - SD-WAN : **ENSDWI 300-415**.
- CCNP complet (ENCOR + une concentration) ~800 USD total.
- Optionnel en parallèle : **Fortinet NSE 4** ou **Palo Alto PCNSA** si orientation sécu.
- Objectif long terme éventuel : **CCIE Enterprise Infrastructure** (pas avant 3-5 ans d'expérience).

## 6. Stack d'outils Edu / OSS / Commercial

### Simulation / Émulation

| Outil | Type | Commentaire |
|---|---|---|
| **Cisco Packet Tracer** | Edu gratuit (NetAcad) | Suffit pour CCNA, limité au-delà |
| **GNS3** | OSS | Émulation IOS, images à fournir, 15 ans de maturité |
| **EVE-NG Community** | OSS (Pro commercial) | Plus moderne, web UI, référence en 2026 |
| **Containerlab** | OSS (Nokia) | Labs en conteneurs, CI/CD-friendly |
| **FRRouting** | OSS | Routing OSS (OSPF, BGP, IS-IS) |
| **VyOS** | OSS (community edition gratuite) | OS de routeur open source |
| **OPNsense / pfSense** | OSS | Firewalls/routeurs BSD, excellent pour labs firewall |
| **Cisco Modeling Labs Personal** | Commercial | Labs Cisco officiels, prépa CCIE |
| **Boson NetSim / ExSim** | Commercial | Simulateur et banque questions |

### Monitoring / Analyse

| Outil | Type | Commentaire |
|---|---|---|
| **Wireshark** | OSS | L'analyseur de paquets universel |
| **tcpdump** | OSS | Capture CLI |
| **iperf3** | OSS | Test throughput |
| **Nmap** | OSS | Scan et fingerprint, transverse cybersec |
| **Zeek** | OSS | Analyse réseau comportementale |
| **Suricata** | OSS | IDS/IPS NGFW OSS |
| **Arkime** | OSS | Full packet capture |
| **LibreNMS** | OSS | SNMP monitoring |
| **Observium Community** | OSS limité | SNMP monitoring |
| **NetBox / Nautobot** | OSS | Source of truth IPAM/DCIM |
| **SolarWinds NPM** | Commercial | Enterprise classique |
| **PRTG / Zabbix** | OSS (Zabbix) / Commercial (PRTG) | Monitoring réseau |

### Automation

| Outil | Type | Commentaire |
|---|---|---|
| **Netmiko, NAPALM, Nornir, Scrapli** | OSS Python | Scripting CLI réseau |
| **Ansible collections réseau** | OSS (Red Hat) | Idempotent config |
| **Terraform providers réseau** | OSS (HashiCorp/OpenTofu) | IaC pour réseaux supportés |
| **pyATS / Genie** | OSS (Cisco) | Test framework réseau |
| **Batfish** | OSS (Intentionet) | Analyse pré-déploiement de configs |
| **SuzieQ** | OSS | Network observability |

## 7. Ressources

### Livres

- **"CCNA 200-301 Official Cert Guide Volume 1 & 2"**, Wendell Odom (Cisco Press). La référence, ~50 USD par volume.
- **"CCNP Enterprise ENCOR 350-401 Official Cert Guide"**, Brad Edgeworth (Cisco Press).
- **"Routing TCP/IP Volume I & II"**, Jeff Doyle (Cisco Press). Classique profond.
- **"Network Warrior"** 2e éd., Gary Donahue (O'Reilly). Plus pratique, moins Cisco-centric.
- **"BGP"**, Iljitsch van Beijnum (O'Reilly). Classique BGP.
- **"Internet Routing Architectures"** 2e éd., Sam Halabi.
- **"Network Programmability and Automation"**, Edelman/Lowe/Oswalt (O'Reilly). Référence NetDevOps.
- **"Day One" Juniper series** (gratuits, par Juniper Networks).

### YouTube FR

- **Formip / Formatip** (chaîne FR sur réseaux et certifs Cisco, contenu solide).
- **Elie Kornbluth (Gentil Informaticien)** : vulgarisation réseau, parfois CCNA.

### YouTube INT

- **Jeremy's IT Lab** (le cours CCNA YouTube le plus recommandé, gratuit, complet).
- **Keith Barker** (CBT Nuggets, aussi YouTube).
- **David Bombal** (networking + automation).
- **Kevin Wallace** (CCIE, beaucoup de contenu CCNA/CCNP gratuit).
- **Networkchuck** (pop, motivant, parfois technique).
- **Ivan Pepelnjak / ipSpace.net** (haut niveau, réseaux cloud et SDN).

### Newsletters / Blogs

- **Packet Pushers** (podcast + blog, excellent).
- **NANOG mailing list** (opérateurs).
- **APNIC blog** (RIPE pour l'Europe, APNIC pour l'Asie-Pacifique).
- **ipSpace.net (Ivan Pepelnjak)** (haut niveau).
- **Cumulus Networks blog / NVIDIA Spectrum** (datacenter).

### Forums

- **r/networking** (Reddit).
- **Network Engineering Stack Exchange**.
- **Cisco Learning Network** (communauté officielle Cisco).

## 8. Phasing Anthony 3 ans

### Année 1

| Trimestre | Focus |
|---|---|
| T1 | C5.1, C5.2, début Packet Tracer |
| T2 | C5.3, C5.4 OSPF, subnetting à vue validé |
| T3 | C5.6 services, C5.7 VPN basiques, C5.9 ACL |
| T4 | **Passer CCNA 200-301** |

### Année 2

| Trimestre | Focus |
|---|---|
| T1 | C5.5 BGP, EVE-NG setup |
| T2 | C5.7 SD-WAN, C5.8 Wireless, C5.9 NGFW |
| T3 | C5.10 automation (Python, Ansible, NetBox) |
| T4 | **Passer ENCOR + DevNet Associate** |

### Année 3

| Trimestre | Focus |
|---|---|
| T1 | Concentration CCNP (ENAUTO recommandé) |
| T2 | Lab de production personnel (VyOS, FRR, NetBox, Prometheus) |
| T3 | **Passer concentration CCNP** |
| T4 | Optionnel Fortinet NSE 4 ou Palo Alto PCNSA |

## 9. Intégration avec D1 (Cybersec) et D3 (Cloud)

### 9.1 Avec D1 Cybersécurité

- C5.9 se recoupe avec [[02-Cybersec-Curriculum]] C1.9 (Linux/Windows/Réseau) et C1.4 (MITRE ATT&CK techniques réseau).
- C5.10 (automation) réutilise Python et DevOps, utile pour détection as code et analyse de logs réseau.
- Capture et analyse avec Wireshark/Zeek/Suricata : transverse CC / Sec+ / CySA+ / BTL1.
- Compréhension MPLS/BGP pour attaques BGP hijacking, Route Origin Authorization.

### 9.2 Avec D3 Cloud

- C5.5 BGP indispensable pour comprendre CloudFront/Front Door/Anycast.
- C5.7 VPN/SD-WAN se retrouve dans VPN Gateway Azure, Site-to-Site VPN AWS, Cloud Router GCP, ExpressRoute/Direct Connect.
- VPC/VNet reprennent les fondamentaux CIDR/subnetting.
- Zero Trust remplace progressivement le VPN traditionnel (voir C5.9), cloud-delivered.

## 10. Points de vigilance

### 10.1 Subnetting, le pilier

Si le subnetting n'est pas automatique "en 10 secondes", toute la suite est fragile. S'entraîner tous les jours 15 min jusqu'à la maîtrise complète avant le CCNA.

### 10.2 Packet Tracer n'est pas une vraie machine

Pour aller au-delà du CCNA, passer impérativement à GNS3/EVE-NG avec images réelles. Packet Tracer a des simplifications qui masquent des comportements.

### 10.3 Ne pas négliger IPv6

Depuis 2024, la présence d'IPv6 en exam CCNA/CCNP est significative et croissante. Traiter IPv6 en parallèle d'IPv4, pas comme un ajout de dernière minute.

### 10.4 Automation, le vrai différenciateur en 2026

Un CCNA classique sans exposition à Ansible/Python/NetBox est déjà daté. Même sans viser ENAUTO/DevNet, intégrer l'automation dans les labs.

### 10.5 Cisco-only est un piège

CCNA oblige à connaître la CLI Cisco. Mais en 2026, un ingénieur réseau travaille souvent avec du multi-vendor (Juniper, Arista, Fortinet, cloud). Garder une culture vendor-neutral (FRR, VyOS, concepts standards).

### 10.6 Examens en ligne vs centre

Les exams Cisco (CCNA/CCNP) sont passables via Pearson VUE en centre ou en ligne (OnVUE). La version en ligne est pratique mais exige un environnement calme, cam allumée, pièce vide. Beaucoup échouent au "check-in" pour non-conformité.

### 10.7 Réputation du matériel réseau chinois

Éviter dans les contextes pro sensibles (cybersec, administration, opérateur) les équipements dont la provenance pose des questions (certains vendors chinois blacklistés en UE/US). Privilégier Cisco, Juniper, Arista, HPE Aruba, Fortinet, Palo Alto, Nokia pour les expérimentations pro.

## 11. Intégration vault et action immédiate

### 11.1 Structure dans le vault

- Domaine D5 Réseaux, dossier `50-Reseaux/` selon Johnny Decimal (voir [[00-Architecture-Vault-Second-Brain]]).
- MOC : `50-Reseaux/00-MOC-Reseaux.md`.
- Wikilinks transverses systématiques vers [[02-Cybersec-Curriculum]] et [[03-Cloud-Curriculum]].
- YAML frontmatter avec `valide_jusqu_a` 12 mois (évolutions plus lentes que cloud/IA, mais SD-WAN/SASE évoluent vite).
- `certif_liee:` à remplir : CCNA-200-301, CCNP-ENCOR, DevNet-Associate, etc.

### 11.2 Premier cluster à lancer

**Cluster C5.2 Subnetting IPv4/IPv6 complet** comme premier run pilote (20-30 pages très ciblées avec exercices). Alternative : C5.4 OSPF profond (40-50 pages). Les deux peuvent tourner en parallèle ou séquentiel.

Modèle de prompt pilote à générer : `PROMPT-PILOT-C5.X-[sujet].md` en reprenant la structure du `PROMPT-PILOT-C2.0.6-Collaboration-IA.md`.

---

*Document compagnon de [[00-Architecture-Vault-Second-Brain]] pour le domaine D5 Réseaux et Certifications Cisco.*
