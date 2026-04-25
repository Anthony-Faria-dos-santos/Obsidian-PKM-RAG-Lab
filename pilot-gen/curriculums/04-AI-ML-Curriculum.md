---
titre: "IA / ML / Data 2026, Carnet de Route Complet"
domaine: D4-IA-ML-Data
type: curriculum
statut: vivant
créé: 2026-04-22
révisé: 2026-04-22
valide_jusqu_a: 2026-10-22
tags: [ia, ml, llm, deep-learning, data, mlops, pytorch, huggingface, langgraph, curriculum, roadmap]
liens: ["[[00-Architecture-Vault-Second-Brain]]", "[[01-Developer-2026-Curriculum]]", "[[03-Cloud-Curriculum]]"]
---

# IA / ML / Data 2026, Carnet de Route Complet

> Document compagnon du vault. Décrit la progression pour passer de "utilisateur curieux d'IA" à "ingénieur ML / IA capable de construire, évaluer, déployer et opérer des systèmes en production", avec distinction claire entre ML et AI Application Engineering.

## 0. Distinction clé, ne pas confondre trois métiers

Un des pièges majeurs en 2026 est de confondre trois rôles distincts, parce que tout le monde dit "faire de l'IA" :

| Rôle | Focus | Compétences clés | Où dans le vault |
|---|---|---|---|
| **Data Scientist / ML Engineer "classique"** | Modèles propriétaires entraînés sur données métier (régression, classification, clustering, reco) | Stats, ML algos, feature engineering, sklearn/PyTorch, MLflow | D4 (ce document) T1-T3 |
| **Deep Learning / LLM Researcher** | Pré-entraîner, fine-tuner, quantiser, optimiser des modèles (souvent LLM/VLM) | PyTorch bas niveau, attention mechanisms, distributed training, CUDA | D4 T4 (optionnel, très spécialisé) |
| **AI Application Engineer** | Brancher des LLM commerciaux ou OSS dans des produits (RAG, agents, MCP, orchestration) | API LLM, LangGraph, Pydantic AI, MCP, évals, prompt engineering | [[01-Developer-2026-Curriculum]] T5 **(le plus demandé en 2026)** |

**Pour Anthony (dev / cybersec)** : la priorité est l'**AI Application Engineering** (Dev T5). Ce document D4 reste utile pour les fondations théoriques, comprendre ce qu'il se passe dans les modèles, faire du ML plus classique si besoin (détection d'anomalies sécurité, analyse de logs, etc.), et acquérir une cert AI cloud (AI-102 Azure, AWS ML Associate, GCP PMLE) qui a une forte valeur marché.

## 1. Paysage IA/ML en 2026

### 1.1 Les ruptures observées 2023-2026

1. **Open weights rattrape les modèles propriétaires**. Llama 3/4, Mistral, Qwen, DeepSeek, Gemma ont montré qu'un modèle open peut rivaliser avec GPT/Claude sur beaucoup d'usages. Les entreprises déploient de plus en plus en local pour des raisons de coût, confidentialité et souveraineté.
2. **Small is beautiful**. Les SLMs (Small Language Models, 1-8B paramètres) quantisés tournent sur laptop/smartphone. Phi, SmolLM, Gemma Nano.
3. **Agents et orchestration multi-étapes**. L'année 2024-2025 a fait émerger LangGraph, CrewAI, Pydantic AI, Autogen comme frameworks d'agents. Le MCP (Model Context Protocol, Anthropic) devient standard d'intégration d'outils. Voir [[01-Developer-2026-Curriculum]] C2.5.
4. **Évaluation et observabilité LLM sont critiques**. LangSmith, Langfuse (OSS), Braintrust, Helicone. "If you can't eval it, you can't ship it."
5. **Coûts GPU et inférence**. Problème FinOps majeur, voir [[03-Cloud-Curriculum]] C3.13. Inference serverless (Bedrock, Groq, Together AI, Fireworks, Mistral La Plateforme) vs self-hosted vLLM.
6. **Régulation**. AI Act européen (entrée en application progressive 2025-2027), classification des risques, obligations de transparence, interdiction de certaines pratiques. Voir [[02-Cybersec-Curriculum]] C1.13.

### 1.2 Écosystème outils 2026

| Catégorie | OSS référence | Commercial référence | Plan Edu |
|---|---|---|---|
| Framework DL | **PyTorch** (Meta, Linux Foundation) | - | - |
| Framework "haut niveau" | **HuggingFace Transformers** | - | HF Pro gratuit possible |
| LLM OSS pondéré | **Llama, Mistral, Qwen, DeepSeek, Gemma, Phi** | - | - |
| LLM commercial | - | Claude (Anthropic), GPT (OpenAI), Gemini (Google) | Parfois free tier étudiant |
| Inference OSS | **vLLM, llama.cpp, TGI, Ollama** | Groq, Together, Fireworks | - |
| Vector DB OSS | **Qdrant, Weaviate, Milvus, pgvector** | Pinecone, Turbopuffer | - |
| Évals OSS | **Langfuse, OpenInference, RAGAS** | LangSmith, Braintrust, Helicone | - |
| Orchestration agents | **LangGraph, Pydantic AI, DSPy, CrewAI, AutoGen** | - | - |
| MLOps OSS | **MLflow, Kubeflow, BentoML, DVC, ZenML** | Weights & Biases, Databricks, SageMaker | W&B gratuit academic/OSS |
| Data transform | **dbt Core, Polars, DuckDB** | dbt Cloud, Snowflake, Databricks | dbt étudiants |
| Notebooks | **Jupyter, JupyterLab, Marimo** | Google Colab, Databricks | Colab free tier, Kaggle Notebooks gratuits |

## 2. Progression par paliers

### T0, Prérequis mathématiques

Objectif : ne pas se noyer dès qu'on ouvre un papier ou qu'on tombe sur une formule.

- **Algèbre linéaire** : vecteurs, matrices, produit scalaire, normes, espaces vectoriels, valeurs/vecteurs propres, SVD, PCA.
- **Calcul différentiel** : dérivées, gradients, matrice jacobienne, règle de la chaîne (backpropagation).
- **Probabilités et stats** : variables aléatoires, distributions, espérance/variance, Bayes, maximum de vraisemblance, tests d'hypothèses, intervalles de confiance.
- **Théorie de l'information** : entropie, divergence KL, cross-entropy.
- **Optimisation** : gradient descent, SGD, Adam, RMSProp, conditions d'optimalité.

Ressources recommandées :
- **"Mathematics for Machine Learning"** (Deisenroth, Faisal, Ong), PDF gratuit officiel.
- **3Blue1Brown** sur YouTube (Essence of Linear Algebra, Essence of Calculus, Neural Networks).
- **Khan Academy** (pour reprendre les bases).
- **StatQuest with Josh Starmer** sur YouTube.

### T1, Machine Learning classique

Objectif : savoir entraîner, évaluer, déployer un modèle ML classique sur tableau de données structurées. C'est 80% des cas réels en entreprise (fraude, churn, anomalies, forecasting).

Clusters : C4.1, C4.2.

Compétences :
- **Supervisé** : régression linéaire/logistique, arbres, random forest, gradient boosting (XGBoost, LightGBM, CatBoost), SVM, kNN.
- **Non supervisé** : K-means, DBSCAN, hiérarchique, mixture models, PCA, t-SNE, UMAP, isolation forest.
- **Feature engineering** : encoding, scaling, imputation, leakage.
- **Évaluation** : train/val/test, cross-validation, métriques (accuracy, precision, recall, F1, ROC-AUC, PR-AUC, log-loss, MAE, RMSE, R², MAPE).
- **Interprétabilité** : SHAP, LIME, feature importance.
- **Déséquilibre de classes** : resampling, SMOTE, cost-sensitive.
- **Librairies** : **scikit-learn** (référence), **XGBoost**, **LightGBM**, **statsmodels** pour stats.

Projets pratiques :
1. Kaggle Titanic (classif binaire, pipeline complet sklearn).
2. Détection de fraude avec déséquilibre de classes (PaySim, IEEE-CIS).
3. Forecasting ventes (Rossmann, M5).

Ressources :
- **"Hands-On Machine Learning with Scikit-Learn, Keras & TensorFlow"** 3e éd., Aurélien Géron (référence absolue, O'Reilly).
- **"Introduction to Statistical Learning"** (ISLP Python version), gratuit PDF officiel, Stanford.
- **FastAI course Part 1** (Jeremy Howard), gratuit, très pratique.
- **Kaggle Learn** (modules courts gratuits).

### T2, Deep Learning

Objectif : comprendre et implémenter des réseaux neuronaux, y compris Transformers et attention.

Clusters : C4.3.

Compétences :
- **Fondamentaux** : perceptron multi-couches, backprop, activations (ReLU, GELU, Swish), dropout, batch norm, layer norm.
- **CNN** : convolutions, pooling, architectures (ResNet, EfficientNet, ConvNeXt, ViT).
- **RNN/LSTM/GRU** (moins critique en 2026 mais utile culturellement).
- **Transformers** : attention (Q/K/V), multi-head, position encoding, architectures encoder (BERT), decoder (GPT), encoder-decoder (T5), récents (Mamba, Mixture of Experts).
- **Training** : optimizers, schedulers, gradient clipping, mixed precision (AMP, bfloat16), DDP/FSDP pour distribué, LoRA/QLoRA pour fine-tuning efficace.
- **Transfer learning et fine-tuning**.
- **PyTorch** (référence indétrônable en 2026). **PyTorch Lightning** ou **HuggingFace Trainer** pour simplifier.
- **JAX** (Google/DeepMind) en culture secondaire.

Projets :
1. Implémenter un MLP puis un CNN sur MNIST/CIFAR en PyTorch pur.
2. Fine-tune un BERT pour classif de texte (HuggingFace).
3. Reproduire "GPT from scratch" Karpathy (`nanoGPT`).

Ressources :
- **"Deep Learning with PyTorch"**, Eli Stevens (Manning).
- **"Dive into Deep Learning"** (Zhang et al.), gratuit en ligne, avec code PyTorch/MXNet/TensorFlow.
- **FastAI course Part 2** ("From Deep Learning Foundations to Stable Diffusion").
- **Andrej Karpathy YouTube** ("Zero to Hero" series, `makemore`, `nanoGPT`).
- **3Blue1Brown** série Neural Networks.
- **CS231n Stanford** (vision), **CS224N Stanford** (NLP), **CS336 Stanford** (Language Modeling from Scratch) disponibles gratuits YouTube.

### T3, LLMs théoriques et fine-tuning

Objectif : comprendre l'anatomie d'un LLM moderne, être capable de fine-tuner en LoRA/QLoRA, servir avec vLLM, quantiser.

Clusters : C4.4.

Compétences :
- **Tokenization** : BPE, SentencePiece, WordPiece, comparaison des tokenizers.
- **Pré-entraînement** (culture, pas forcément à faire soi-même) : data mixture, chinchilla scaling laws, context length, objectif (causal LM, MLM, prefix LM).
- **Alignement** : SFT (Supervised Fine-Tuning), RLHF, DPO, KTO, Constitutional AI (Anthropic), RLAIF.
- **Fine-tuning efficace** : LoRA, QLoRA, QA-LoRA, adapters, prompt tuning. Librairies : **PEFT (HuggingFace)**, **Axolotl**, **Unsloth**, **TRL (HuggingFace)**.
- **Quantization** : INT8, INT4, FP8, GPTQ, AWQ, GGUF (llama.cpp).
- **Inference servers** : **vLLM** (référence), **TGI** (Text Generation Inference HuggingFace), **llama.cpp** (CPU/GPU léger, GGUF), **Ollama** (wrapper llama.cpp avec CLI friendly), **LMDeploy**, **TensorRT-LLM** (NVIDIA).
- **Benchmarks** : MMLU, HumanEval, HellaSwag, TruthfulQA, MT-Bench, Arena Elo. Se méfier des contaminations.

Projets :
1. Fine-tune Llama-3.1-8B ou Mistral-7B en LoRA sur un dataset custom (Axolotl ou Unsloth).
2. Déployer le modèle résultant avec vLLM derrière une API OpenAI-compatible.
3. Quantiser en GGUF Q4_K_M et servir avec Ollama local.

Ressources :
- **"LLM from Scratch"** (Sebastian Raschka), livre Manning + repo GitHub.
- **"Build a Large Language Model (From Scratch)"** Raschka (version étendue).
- **HuggingFace NLP Course** (gratuit).
- **Sebastian Raschka's blog** (excellent, hands-on).
- **Eleuther AI / Together AI / Mistral / HuggingFace blog posts**.

### T4, Spécialisations (au choix selon projet)

Clusters : C4.5, C4.6, C4.7, C4.8.

4 pistes principales :

**a. Vision Computer** :
- Segmentation (SAM 2), détection (YOLO v10/v11, RT-DETR), génération (Stable Diffusion 3/Flux), VLMs (LLaVA, InternVL, Qwen-VL).
- Frameworks : **Detectron2**, **mmdetection**, **Ultralytics YOLO**, **Diffusers** (HuggingFace).

**b. Audio et parole** :
- STT : **Whisper** (OpenAI, OSS), **Canary** (NVIDIA NeMo), **SenseVoice**.
- TTS : **Coqui TTS** (OSS, attention statut juridique), **XTTS**, **F5-TTS**, **Kokoro**.
- Voice cloning : **RVC**, **Tortoise**.

**c. Multi-modal et agents embodied** :
- VLA models (Vision-Language-Action) en robotique.
- VideoLLMs (modèles capables de raisonner sur vidéo).

**d. ML de cybersécurité (transverse D1)** :
- Détection d'anomalies dans logs/traffic (IDS ML).
- Classification de malware (binaries, PE headers).
- Détection de phishing (URLs, contenus).
- Fraud detection.
- Librairies spécifiques : **Scikit-learn**, **PyOD** (outliers), **Elastic ML**, **Splunk MLTK**.

### T5, MLOps et production

Clusters : C4.9.

Objectif : sortir du notebook, industrialiser.

Compétences :
- **Data versioning** : **DVC** (OSS), **LakeFS** (OSS), **Pachyderm**.
- **Experiment tracking** : **MLflow** (OSS, référence), **Weights & Biases** (commercial, plan academic gratuit), **Neptune**, **CometML**.
- **Feature stores** : **Feast** (OSS), **Tecton** (commercial), Databricks Feature Store.
- **Model registry et serving** : MLflow Model Registry, **BentoML** (OSS), **KServe** (K8s native), **Seldon Core** (OSS + commercial), SageMaker, Vertex AI, Azure ML.
- **Orchestration pipelines** : **Airflow** (OSS, classique), **Prefect** (OSS + SaaS), **Dagster** (OSS, très cloud-native), **Kubeflow Pipelines**, **Metaflow** (Netflix OSS), **ZenML** (OSS).
- **Monitoring ML** : data drift, concept drift, performance. **Evidently** (OSS), **NannyML** (OSS), **WhyLabs**, **Arize**, **Fiddler**.
- **LLM Observability** : **Langfuse** (OSS, self-host), **LangSmith** (LangChain), **Braintrust**, **Helicone** (OSS + SaaS), **Phoenix (Arize)** (OSS).

## 3. Clusters détaillés avec sous-thèmes

### C4.1, Fondamentaux mathématiques et statistiques pour l'IA

Sous-thèmes : algèbre linéaire, calcul, probabilités, stats inférentielles, théorie de l'info, optimisation. Pages synthétiques pour révision rapide. Anti-pattern : ne pas en faire un cours de maths universitaire, focaliser sur ce qui sert en ML.

### C4.2, Machine Learning classique (supervisé et non supervisé)

Sous-thèmes : exposés dans T1 ci-dessus. Inclure un cluster sur **séries temporelles** (ARIMA, Prophet, NeuralProphet, Chronos, TimesFM, Moirai) car c'est un cas pratique fréquent souvent oublié.

### C4.3, Deep Learning et PyTorch

Sous-thèmes : architectures, training dynamics, optimizers, régularisation, distributed training.

### C4.4, LLMs théoriques

Sous-thèmes : Transformers détaillés, tokenization, training objectives, alignement (RLHF/DPO), fine-tuning efficace, quantization, inference servers, benchmarks et leurs limites, hallucinations (pourquoi elles existent mathématiquement), long context (sliding window, RoPE scaling, Longrope, Ring Attention).

### C4.5, Computer Vision

Sous-thèmes : classification, détection, segmentation, génération (diffusion models), VLMs, multi-object tracking, OCR (PaddleOCR, TrOCR, Donut).

### C4.6, NLP et audio

Sous-thèmes : tokenization, embeddings (word2vec historique, modern: e5, bge, mxbai, nomic, voyage), NER, sentiment, topic modeling, summarization, STT/TTS.

### C4.7, ML pour cybersécurité (transverse D1)

Sous-thèmes :
- Détection d'anomalies dans logs (isolation forest, autoencoders, LSTM)
- Classification de malware (features statiques/dynamiques)
- Détection de phishing
- UEBA (User Entity Behavior Analytics)
- Adversarial ML (voir C4.10)

### C4.8, Données et data engineering léger

Sous-thèmes :
- SQL avancé (window functions, CTE, indexation)
- DuckDB (OSS, analytique embarqué, excellent)
- Polars (OSS, DataFrame en Rust, alternative Pandas très rapide)
- dbt (transformation SQL versionnée)
- Parquet, Delta Lake, Iceberg (formats de stockage analytique)
- Orchestration légère : Prefect, Dagster

### C4.9, MLOps et LLMOps

Sous-thèmes : voir T5. Insister sur que MLOps = DevOps + data versioning + model lifecycle.

### C4.10, Éthique, sécurité et régulation IA

Sous-thèmes :
- **AI Act européen** : classification (risque inacceptable / haut / limité / minimal), obligations GPAI, calendrier 2025-2027
- **NIST AI RMF** (Risk Management Framework)
- **ISO/IEC 42001** (système de management de l'IA)
- **OWASP Top 10 for LLM Applications** (prompt injection, insecure output handling, training data poisoning, model DoS, supply chain, sensitive info disclosure, insecure plugin design, excessive agency, overreliance, model theft)
- **MITRE ATLAS** (adversarial threat landscape pour AI systems, équivalent ATT&CK)
- **Red teaming LLMs** : jailbreaks, prompt injection indirecte, data exfiltration via agents
- **Bias et fairness** (Fairlearn, Aequitas)
- **Privacy** : federated learning, differential privacy, membership inference attacks
- Transverse fort avec [[02-Cybersec-Curriculum]] C1.11 et C1.13.

## 4. Certifications IA/ML 2026

### 4.1 Par hyperscaler (très demandées en alternance)

| Cert | Hyperscaler | Niveau | Valeur marché FR | Commentaire |
|---|---|---|---|---|
| **AI-900 Azure AI Fundamentals** | Microsoft | Entry | Moyenne | Très facile, bonne culture générale |
| **AI-102 Azure AI Engineer Associate** | Microsoft | Associate | **Élevée** | Référence pour poste AI Engineer MS |
| **AWS AI Practitioner (AIF-C01)** | AWS | Entry | Moyenne | Récente (2024), sortie en complément CLF |
| **AWS ML Engineer Associate (MLA-C01)** | AWS | Associate | Élevée | Récente, plus pratique que l'ancienne ML Specialty |
| **AWS ML Specialty (MLS-C01)** | AWS | Specialty (legacy) | Élevée | Très complète, va être progressivement remplacée par MLA + autre |
| **GCP Cloud Digital Leader + Generative AI Leader** | GCP | Entry | Moyenne | Rapide |
| **GCP Professional ML Engineer (PMLE)** | GCP | Pro | Très élevée | La plus exigeante des trois pro ML cert cloud |
| **GCP Professional Data Engineer** | GCP | Pro | Élevée | Complément data pipeline |
| **Azure Data Scientist Associate (DP-100)** | Microsoft | Associate | Moyenne-élevée | Pratique sur Azure ML SDK |

Recommandation Anthony :
- **AI-900** dès T1 (1-2 semaines).
- **AI-102** en T3 après expérience pratique Azure AI Foundry, Azure OpenAI Service, AI Search.
- **AWS AI Practitioner** en bonus culturel.
- **GCP PMLE** optionnel en Y3 si cible poste ML orienté data/analytics.

### 4.2 Vendor-neutral et académiques

- **TensorFlow Developer Certificate** (Google, ~100 USD, prestige faible mais accessible).
- **Coursera DeepLearning.AI Specializations** (Andrew Ng) : Deep Learning Specialization, ML Specialization, NLP Specialization, Generative AI with LLMs. Plan étudiant Coursera Plus (réduction étudiante ou accès université).
- **Hugging Face courses** (gratuits) : NLP, Deep RL, Audio, Diffusion.
- **FastAI courses** (gratuits, certificat gratuit), Jeremy Howard.
- **Stanford Online / CS courses** (CS229, CS230, CS224N, CS231n, CS336), souvent sur YouTube gratuits.
- **LangChain / Langfuse / DeepLearning.AI short courses** (gratuits, 1-2h chacun, excellent pour l'AI application).

### 4.3 Parcours académiques / labels

- **MSc/Ingénieur** : beaucoup d'écoles proposent des majeures IA, pas forcément pertinents en plus d'une alternance.
- **OpenClassrooms / Le Wagon / Datascientest / Jedha** : bootcamps commerciaux avec certifications RNCP, utile si reconversion, pas priorité ici.
- **Deep Learning Specialization Coursera** (DeepLearning.AI) : solide, certificat reconnu.

## 5. Plan de progression multi-années pour Anthony

### Année 1 (Bac+3)

- T0 maths (révision continue, 1h/semaine) + T1 ML classique (Hands-On ML + quelques projets Kaggle).
- **AI-900** pris en 2-3 semaines après avoir bossé un peu Azure AI Services.
- Premières pages du vault : C4.1 (maths), C4.2 (ML classique).

### Année 2 (Bac+4)

- T2 Deep Learning (FastAI Part 1-2 + Karpathy Zero to Hero).
- Projets PyTorch sur computer vision et NLP.
- Cert : **AI-102 Azure AI Engineer** OU **AWS ML Engineer Associate** selon alternance.
- Pages vault : C4.3 (DL), C4.5 ou C4.6 selon projet, C4.9 (début MLOps).

### Année 3 (Bac+5)

- T3 LLMs théoriques (Raschka LLM from Scratch, nanoGPT).
- Fine-tuning réel d'un Llama/Mistral.
- T4 spécialisation selon poste (cybersec ML si alternance cyber, vision ou NLP sinon).
- Cert : **GCP PMLE** si data/ML, **AI-102** si pas encore passée.
- Pages vault : C4.4 (LLMs), C4.7 (ML cybersec), C4.9 (MLOps complet), C4.10 (régulation/sécurité).

### Année 4+ (post-diplôme)

- Spécialisation poussée : audio, vision, agentic ML, RL, ML de production haute échelle.
- Cert de niche si utile : **Databricks Certified ML Associate/Professional**, **NVIDIA certs** (Deep Learning Institute).

## 6. Homelab IA/ML

### 6.1 Hardware

- **GPU** : une RTX 3060 12GB, 3090 24GB d'occasion, ou 4070 Ti Super 16GB suffisent pour la plupart des apprentissages et des fine-tunings LoRA de modèles 7-8B en 4-bit.
- **RAM** : 32GB min, 64GB confortable.
- **Alternative "pas de GPU"** : Google Colab (free tier avec T4), Kaggle Notebooks (30h/semaine T4/P100 gratuit), AWS SageMaker Studio Lab (gratuit), Hugging Face Spaces gratuit (CPU, ou petits GPU payants à l'heure).
- **Pour LLMs lourds** : louer du GPU on-demand (Vast.ai, RunPod, Lambda Labs, Modal, Together AI).

### 6.2 Stack logicielle type

- **Ubuntu LTS 24.04** ou **WSL2 Ubuntu** sur Windows.
- **CUDA 12.x + cuDNN** via drivers NVIDIA.
- **conda/mamba** ou **uv + pyenv** pour environnements Python.
- **JupyterLab** ou **VS Code** avec extensions Python/Jupyter.
- **Ollama** + **Open WebUI** pour tester des LLMs locaux sans ligne de code.
- **llama.cpp** pour le niveau bas, **vLLM** pour servir de l'API OpenAI-compatible.

### 6.3 Cartographie d'un projet type

Pour Anthony, un bon projet "fil rouge" sur 6 mois :

> Construire un assistant RAG local sur son propre vault Obsidian + notes de cours.

Étapes :
1. Ingestion : parser les `.md`, chunker intelligemment (respect des headers), embedder (bge-m3 ou voyage-3).
2. Vector store : **Qdrant** (OSS) ou **pgvector** (Postgres).
3. Orchestration : **LangGraph** ou **Pydantic AI** pour un workflow RAG + citation + re-ranking.
4. LLM : Claude Sonnet 4.6 via API (plan étudiant), ou local Llama-3.1-8B via Ollama/vLLM.
5. Observabilité : **Langfuse** self-hosted.
6. Évaluation : **RAGAS** (metrics faithfulness, answer relevancy, context precision/recall).
7. UI : **Open WebUI**, **Streamlit**, ou petit front Next.js.
8. Publication : vault Obsidian cluster C4-Project-RAG, partagé sur GitHub sans données personnelles.

## 7. Ressources de fond

### Livres de référence 2025-2026

- **"Hands-On Machine Learning with Scikit-Learn, Keras & TensorFlow"** 3e éd., Aurélien Géron (référence pratique ML+DL).
- **"Mathematics for Machine Learning"** (gratuit PDF).
- **"Deep Learning"**, Goodfellow/Bengio/Courville (référence théorique, gratuit en ligne).
- **"Dive into Deep Learning"** (gratuit en ligne).
- **"Build a Large Language Model (From Scratch)"**, Sebastian Raschka.
- **"Designing Machine Learning Systems"**, Chip Huyen (production ML, excellent).
- **"AI Engineering"**, Chip Huyen (2024, orienté AI app engineering).
- **"Machine Learning Engineering for Production"**, Andrew Ng (Coursera + livre).
- **"Probabilistic Machine Learning"**, Kevin Murphy (très théorique, gratuit en ligne).

### Newsletters et veille

- **The Batch** (DeepLearning.AI, Andrew Ng).
- **Import AI** (Jack Clark, ex-OpenAI/Anthropic policy).
- **Ben's Bites** / **TLDR AI**.
- **Simon Willison's Weblog** (excellent blog LLM hands-on).
- **Sebastian Raschka's "Ahead of AI"**.
- **Alignment Forum / LessWrong** (recherche safety/alignement).
- **Papers with Code** (arXiv + code).
- **HuggingFace daily papers / blog**.

### YouTube FR

- **Machine Learnia** (Guillaume Saint-Cirgue, ML bases en français).
- **Defend Intelligence** (IA et société).
- **Thibault Neveu** (vulgarisation ML).

### YouTube INT

- **Andrej Karpathy** (masterclasses, "Zero to Hero", "Let's build GPT-2", "Deep Dive into LLMs").
- **3Blue1Brown** (visualisations math/ML).
- **Sebastian Raschka** (implémentations hands-on).
- **Yannic Kilcher** (analyse papiers).
- **StatQuest** (ML expliqué simplement).
- **Umar Jamil** (deep dives architectures récentes).
- **Two Minute Papers**.
- **DeepLearning.AI** channel.

### Podcasts

- **Lex Fridman Podcast** (interviews IA, long format).
- **Machine Learning Street Talk** (technique poussé, anglais).
- **The Gradient Podcast**.
- **No Priors**.

### Papiers à lire en priorité (culture de base)

- "Attention Is All You Need" (Vaswani 2017).
- "BERT" (Devlin 2018).
- "GPT-2" et "GPT-3" papers (Radford, Brown et al.).
- "Chinchilla" (Hoffmann 2022, scaling laws).
- "LoRA" (Hu 2021), "QLoRA" (Dettmers 2023).
- "Retrieval-Augmented Generation" (Lewis 2020).
- "Constitutional AI" (Anthropic 2022).
- "Reward is enough" (Silver 2021) pour RL.
- Les key blog posts : Anthropic (Mechanistic Interpretability), OpenAI (alignment), Google DeepMind (Gemini reports).

## 8. Points de vigilance

### 8.1 Ne pas se noyer dans les papiers

ArXiv publie 100+ papiers IA par jour. Filtrer : Papers with Code (trending), HuggingFace daily papers, Sebastian Raschka/Simon Willison recap.

### 8.2 Ne pas confondre "AI app engineering" et "ML engineering"

Pour un dev en 2026, l'AI App Engineering (brancher des LLM existants) a un ROI immédiat énorme et c'est le métier le plus demandé. Le ML classique reste utile mais moins demandé hors data scientist spécialisé.

### 8.3 Piège des certs seules

Les certs AI cloud sont très marketing-friendly mais évaluent surtout la connaissance des services managés (pas de l'IA profonde). Les combiner avec des projets réels.

### 8.4 Bench et leaderboards mensongers

MMLU, Chatbot Arena, etc. sont utiles mais contaminés (entraînement sur bench) ou sujets à pratiques douteuses. Toujours évaluer sur son propre cas d'usage (evals custom).

### 8.5 Coût inférence et surcoûts cloud

Une API LLM intensive peut coûter plusieurs milliers d'euros/mois rapidement. Voir [[03-Cloud-Curriculum]] C3.13 FinOps. Cache réponses, batch, choisir le bon modèle (Haiku/Flash pour le simple, Opus/GPT-4o pour le complexe).

### 8.6 Sécurité des systèmes IA

Prompt injection, data exfiltration, hallucinations en production, modèle compromis. Voir C4.10 et transverse D1. OWASP LLM Top 10 à intégrer dans tout système en production.

### 8.7 Aspect éthique et responsabilité

AI Act impose des obligations de transparence et de gouvernance. Les déployements de systèmes IA "à risque élevé" sont soumis à évaluation. Connaître avant de proposer des solutions à des clients.

## 9. Intégration vault et wikilinks transverses

- **YAML frontmatter** avec `valide_jusqu_a` 3-6 mois (le domaine évolue très vite).
- Référence systématique vers [[01-Developer-2026-Curriculum]] C2.5 (AI Application Engineering) pour la partie pratique.
- Transverse [[02-Cybersec-Curriculum]] C1.11 (malware analysis ML), C1.13 (régulation AI Act), C1.18 (recherche sécurité ML adversarial).
- Transverse [[03-Cloud-Curriculum]] C3.12 (sécurité cloud des workloads ML), C3.13 (FinOps GPU).
- MOC : `40-IA-ML-Data/00-MOC-IA-ML.md`.

## 10. Action immédiate recommandée

**Ordre suggéré après le pilote Dev** :
1. Cluster C4.2 (ML classique) pour bâtir la culture de base, parallèlement à la cert **AI-900**.
2. Puis C4.3 (Deep Learning) avec FastAI et Karpathy.
3. Puis C4.4 (LLMs théoriques) avec Raschka + un vrai fine-tuning.
4. Au même moment, côté dev, progresser sur [[01-Developer-2026-Curriculum]] C2.5 (AI App) pour le côté produit.

Le premier cluster à générer avec le prompt pilote : **C4.2 ML classique** (40-50 pages, ~1-2h de run, calibration identique au modèle `PROMPT-PILOT-C2.0.6-Collaboration-IA.md`).

---

*Document compagnon de [[00-Architecture-Vault-Second-Brain]] pour le domaine D4 IA / ML / Data.*
