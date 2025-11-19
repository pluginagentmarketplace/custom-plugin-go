---
description: Advanced AI and machine learning specialist. Master ML fundamentals, deep learning, LLMs, prompt engineering, model training, MLOps, and production deployment with real-world systems and enterprise patterns.
capabilities:
  - Machine learning fundamentals and theory
  - Deep learning and neural networks
  - Large Language Models and fine-tuning
  - Prompt engineering and optimization
  - Model training and evaluation
  - MLOps and production deployment
  - Feature engineering and preprocessing
  - Distributed training and optimization
  - AI safety and bias mitigation
  - Production ML systems
---

# AI & Machine Learning Engineer

Master machine learning from theory to production systems.

## 🎯 ML Fundamentals

### Mathematics Foundation

**Linear Algebra**
- Vectors, matrices, operations
- Eigenvalues, SVD, PCA
- Matrix calculus
- Dot products, norms

**Calculus**
- Derivatives, chain rule
- Gradient descent optimization
- Taylor series approximation
- Convexity, critical points

**Statistics & Probability**
- Distributions: normal, uniform, binomial
- Bayesian inference
- Hypothesis testing
- Maximum likelihood estimation
- Confidence intervals

### Classical ML Algorithms

**Supervised Learning**
- Linear regression
- Logistic regression
- Decision trees
- Random forests (ensemble)
- Gradient boosting (XGBoost, LightGBM)
- Support Vector Machines

**Unsupervised Learning**
- K-means clustering
- Hierarchical clustering
- DBSCAN (density-based)
- Principal Component Analysis
- Autoencoders

**Model Evaluation**
- Accuracy, Precision, Recall, F1
- ROC curves, AUC
- Cross-validation
- Confusion matrices
- RMSE, MAE (regression)

## 🧠 Deep Learning

### Neural Networks

**Fundamentals**
```python
import torch
import torch.nn as nn

# Simple MLP
class MLP(nn.Module):
    def __init__(self):
        super().__init__()
        self.fc1 = nn.Linear(784, 128)
        self.relu = nn.ReLU()
        self.fc2 = nn.Linear(128, 10)

    def forward(self, x):
        x = self.fc1(x)
        x = self.relu(x)
        x = self.fc2(x)
        return x

# Training loop
optimizer = torch.optim.Adam(model.parameters())
loss_fn = nn.CrossEntropyLoss()

for epoch in range(10):
    for X, y in dataloader:
        logits = model(X)
        loss = loss_fn(logits, y)
        loss.backward()
        optimizer.step()
        optimizer.zero_grad()
```

### Advanced Architectures

**CNNs (Computer Vision)**
- Convolutional layers
- Pooling operations
- ResNet, VGG, Inception
- Transfer learning
- Image classification, detection, segmentation

**RNNs/LSTMs (Sequences)**
- Recurrent connections
- Vanishing gradient problem
- LSTM, GRU cells
- Bidirectional RNNs
- Sequence-to-sequence models

**Transformers (Modern)**
- Self-attention mechanism
- Multi-head attention
- Positional encoding
- Encoder-decoder architecture
- BERT, GPT, T5

## 🤖 Large Language Models

**LLM Concepts**
- Tokenization: breaking text into tokens
- Embeddings: vector representations
- Attention: focusing on relevant tokens
- Temperature: controlling randomness
- Top-k, top-p sampling

**Prompt Engineering**

```
Basic Prompt:
"What is machine learning?"

Few-Shot Prompt:
"Classify the sentiment:
'Love this movie!' → Positive
'Hate it' → Negative
'This is okay' → ?
```

**Advanced Techniques**
- Chain-of-Thought: step-by-step reasoning
- Role-playing: assign personas
- Few-shot: provide examples
- RAG: retrieval-augmented generation
- Fine-tuning: adapting models

**Popular Models**
- GPT-4, GPT-3.5 (OpenAI)
- Claude 3 (Anthropic)
- Gemini (Google)
- LLaMA 2 (Meta)
- Mistral (Open-source)

## 🛠️ MLOps & Production

**Experiment Tracking**
- MLflow: track runs, metrics, parameters
- Weights & Biases: collaborative platform
- Neptune: experiment versioning
- CometML: monitoring

**Model Serving**
```python
# FastAPI for serving
from fastapi import FastAPI
from pydantic import BaseModel
import pickle

app = FastAPI()

with open('model.pkl', 'rb') as f:
    model = pickle.load(f)

class PredictionRequest(BaseModel):
    features: list[float]

@app.post("/predict")
async def predict(request: PredictionRequest):
    prediction = model.predict([request.features])
    return {"prediction": prediction[0]}
```

**Deployment**
- Docker containerization
- Kubernetes orchestration
- AWS SageMaker, Vertex AI
- Model registries: MLflow, Hugging Face

**Monitoring**
- Model drift detection
- Data drift monitoring
- Performance degradation alerts
- Retraining pipelines

## 📊 Data Pipeline

**Data Collection**
- APIs, databases, files
- Data quality checks
- Privacy compliance

**Preprocessing**
- Cleaning: missing values, outliers
- Encoding: categorical to numerical
- Scaling: normalization, standardization
- Feature engineering: creating features

**Feature Stores**
- Feast: centralized feature management
- Tecton: feature engineering platform
- Store historical features
- Serve online/offline

## ✅ ML Career Path

**ML Engineer** (12-18 months)
- Build production models
- Model optimization
- Salary: $150K-$250K

**ML/Data Scientist** (6-12 months)
- Research, experimentation
- Data analysis
- Salary: $120K-$220K

**MLOps Engineer** (12-18 months)
- Production infrastructure
- Monitoring, scaling
- Salary: $140K-$240K

---

**Ready to Master ML?** Use `/learn ai-machine-learning`!
