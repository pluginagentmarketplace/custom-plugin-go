---
name: ai-machine-learning
description: Master machine learning, deep learning, LLMs, prompt engineering, model training, and MLOps. From mathematical foundations to production systems.
sasmp_version: "1.3.0"
bonded_agent: 01-web-development
bond_type: PRIMARY_BOND
---

# AI & Machine Learning Skills

## Quick Start

Train your first machine learning model:

### Classical ML with Scikit-Learn
```python
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

# Load data
iris = load_iris()
X_train, X_test, y_train, y_test = train_test_split(
    iris.data, iris.target, test_size=0.2
)

# Train model
model = RandomForestClassifier(n_estimators=100)
model.fit(X_train, y_train)

# Evaluate
predictions = model.predict(X_test)
accuracy = accuracy_score(y_test, predictions)
print(f"Accuracy: {accuracy:.2%}")
```

### Deep Learning with PyTorch
```python
import torch
import torch.nn as nn
import torch.optim as optim

# Define neural network
class NeuralNet(nn.Module):
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

# Train model
model = NeuralNet()
optimizer = optim.Adam(model.parameters())
loss_fn = nn.CrossEntropyLoss()
```

### Prompt Engineering with LLMs
```python
from anthropic import Anthropic

client = Anthropic()

# Simple prompt
response = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    max_tokens=1024,
    messages=[
        {"role": "user", "content": "Explain quantum computing in 50 words"}
    ]
)

# Advanced prompt with context
system_prompt = """You are an expert Python tutor.
Explain concepts clearly with code examples.
Always provide runnable code."""

response = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    max_tokens=2048,
    system=system_prompt,
    messages=[
        {"role": "user", "content": "How do Python decorators work?"}
    ]
)

print(response.content[0].text)
```

## Machine Learning Fundamentals

### Core Concepts
- **Supervised Learning**: Learn from labeled examples
  - Classification: Predicting categories
  - Regression: Predicting continuous values
- **Unsupervised Learning**: Find patterns without labels
  - Clustering: Grouping similar data
  - Dimensionality Reduction: Simplifying data
- **Semi-supervised**: Combination of labeled and unlabeled

### Data Pipeline
1. **Collection**: Gather data from sources
2. **Exploration**: Understand data characteristics
3. **Cleaning**: Handle missing values, outliers
4. **Feature Engineering**: Transform raw data
5. **Train/Test Split**: Prepare for evaluation
6. **Training**: Fit model to training data
7. **Evaluation**: Assess performance
8. **Hyperparameter Tuning**: Optimize model
9. **Validation**: Final performance check

### Common Algorithms
- **Classification**: Logistic Regression, SVM, Decision Trees, Random Forest
- **Regression**: Linear Regression, Polynomial Regression
- **Clustering**: K-means, Hierarchical Clustering, DBSCAN
- **Dimensionality**: PCA, t-SNE, UMAP

## Deep Learning & Neural Networks

### Fundamentals
- **Perceptrons**: Basic building blocks
- **Backpropagation**: Learning algorithm
- **Activation Functions**: ReLU, Sigmoid, Tanh
- **Loss Functions**: MSE, Cross-entropy
- **Optimization**: SGD, Adam, RMSprop

### Architectures
- **Fully Connected**: Dense networks
- **CNN**: Convolutional networks for images
- **RNN/LSTM**: Sequential data processing
- **Transformer**: Attention-based, foundation of LLMs
- **Autoencoders**: Unsupervised feature learning
- **GANs**: Generative models

### Frameworks
- **PyTorch**: Research-friendly, dynamic graphs
- **TensorFlow/Keras**: Production-ready, static graphs
- **JAX**: Functional, high-performance computing

## Large Language Models (LLMs)

### LLM Basics
- **Tokenization**: Breaking text into tokens
- **Embeddings**: Vector representations of text
- **Attention Mechanism**: Focus on relevant parts
- **Transformer Architecture**: Parallel processing
- **Fine-tuning**: Adapting pre-trained models

### Prompt Engineering Techniques
- **Zero-shot**: Direct instruction without examples
- **Few-shot**: Provide examples for context
- **Chain-of-Thought**: Step-by-step reasoning
- **Role-playing**: Assign personas to model
- **System Prompts**: Define behavior and context

### Practical Applications
- **Text Generation**: Summarization, translation, writing
- **Code Generation**: Writing, debugging, explaining code
- **Information Extraction**: Parsing unstructured data
- **Reasoning**: Solving complex problems
- **Retrieval-Augmented**: Combining with knowledge bases

### Popular Models
- **OpenAI**: GPT-4, GPT-3.5-turbo
- **Anthropic**: Claude family
- **Google**: Gemini models
- **Meta**: Llama models
- **Hugging Face**: Open-source models

## Machine Learning Operations (MLOps)

### Model Development
- **Version Control**: Git for code, DVC for models
- **Experiment Tracking**: MLflow, Weights & Biases
- **Hyperparameter Tuning**: Grid search, Bayesian optimization
- **Model Registry**: Storing and versioning models

### Model Serving
- **Online Serving**: FastAPI, TensorFlow Serving
- **Batch Inference**: Scheduled predictions
- **Real-time APIs**: Low-latency endpoints
- **Model Compression**: Quantization, pruning

### Monitoring
- **Model Performance**: Accuracy, precision, recall
- **Data Drift**: Changes in input distribution
- **Model Drift**: Performance degradation
- **Retraining**: Automated update pipelines

### Infrastructure
- **Orchestration**: Airflow, Prefect, Kubeflow
- **Containerization**: Docker for reproducibility
- **Deployment**: Kubernetes, cloud platforms
- **Storage**: Feature stores, model registries

## Tools & Libraries

| Category | Tools |
|----------|-------|
| **Data** | Pandas, NumPy, Polars, DuckDB |
| **ML** | Scikit-learn, XGBoost, LightGBM |
| **DL** | PyTorch, TensorFlow, JAX |
| **LLM** | LangChain, LlamaIndex, Anthropic SDK |
| **MLOps** | MLflow, Weights & Biases, Kubeflow |
| **Monitoring** | Prometheus, Grafana, Evidently |

## Learning Paths

### Path 1: AI Engineer (6-9 months)
- Focus: Using pre-trained models and LLMs
- Skills: API integration, prompt engineering, RAG
- Timeline: Quick entry to AI development

### Path 2: ML Engineer (12-18 months)
- Focus: Building and training models
- Skills: Algorithms, deep learning, MLOps
- Prerequisites: Strong programming, math foundation

### Path 3: Prompt Engineer (2-4 months)
- Focus: LLM optimization
- Skills: Prompt design, evaluation, security
- Timeline: Fastest entry to AI field

### Path 4: MLOps Engineer (12-18 months)
- Focus: Production ML systems
- Skills: CI/CD, monitoring, deployment
- Prerequisites: DevOps + ML foundation

## Hands-On Projects

### Beginner
- Iris flower classification
- Boston housing price prediction
- Digit recognition (MNIST)
- Simple chatbot with LLM API

### Intermediate
- Sentiment analysis from reviews
- Image classification with CNNs
- Time series forecasting
- RAG system with embeddings

### Advanced
- Custom LLM fine-tuning
- Multi-model ensemble
- Recommendation system
- Production ML pipeline

## Best Practices

### Model Development
- Start simple, add complexity gradually
- Use cross-validation for reliable estimates
- Monitor for overfitting and underfitting
- Document assumptions and decisions

### Responsible AI
- Address bias in training data
- Ensure model fairness
- Maintain transparency
- Consider ethical implications
- Implement guardrails

### Production Readiness
- Comprehensive testing
- Monitoring and alerting
- Graceful degradation
- Rollback capabilities
- Documentation

## Key Concepts to Master

1. **Statistical Thinking**: Probability, distributions, hypothesis testing
2. **Algorithm Understanding**: How algorithms work, not just library calls
3. **Data Quality**: Garbage in, garbage out
4. **Evaluation Metrics**: Appropriate metrics for your problem
5. **Reproducibility**: Track experiments, versions, dependencies
6. **Scalability**: Think about production constraints early
7. **Ethics**: Consider impact of your models

## Career Paths

### ML Engineer
- Build and train models
- Research new techniques
- Optimize performance
- High technical depth

### ML Operations Engineer
- Deploy and maintain systems
- Infrastructure and tooling
- Monitoring and reliability
- DevOps with ML focus

### Research Scientist
- Novel algorithm development
- Publishing papers
- Cutting-edge techniques
- PhD often required

### AI Product Manager
- Product strategy
- Market opportunity
- User experience
- Bridge business and technical

## Related Skills

- **Programming Languages**: Python is primary
- **Cloud & DevOps**: Model serving and monitoring
- **Data Engineering**: Data pipeline management
- **Web Development**: AI-powered applications
- **Leadership**: Leading ML teams

---

*For detailed AI/ML learning paths, use `/learn ai-machine-learning`*
