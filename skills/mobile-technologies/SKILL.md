---
name: mobile-technologies
description: Master React Native and Flutter for cross-platform apps, blockchain development, game development, and cybersecurity. Build modern applications across mobile and emerging technologies.
---

# Mobile & Emerging Technologies Skills

## Quick Start

Build your first mobile app:

### React Native - Cross-Platform
```javascript
import React, { useState } from 'react';
import { View, Text, TextInput, Button, FlatList, StyleSheet } from 'react-native';

export default function TodoApp() {
  const [todos, setTodos] = useState([]);
  const [input, setInput] = useState('');

  const addTodo = () => {
    if (input.trim()) {
      setTodos([...todos, { id: Date.now().toString(), text: input }]);
      setInput('');
    }
  };

  return (
    <View style={styles.container}>
      <TextInput
        style={styles.input}
        placeholder="Add a todo"
        value={input}
        onChangeText={setInput}
      />
      <Button title="Add" onPress={addTodo} />
      <FlatList
        data={todos}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => <Text style={styles.todo}>{item.text}</Text>}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 20 },
  input: { borderBottomWidth: 1, marginBottom: 10 },
  todo: { paddingVertical: 10, borderBottomWidth: 1 },
});
```

### Flutter - Beautiful UIs
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: const TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => ListTile(title: Text(todos[index])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => todos.add(controller.text));
          controller.clear();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### Smart Contract - Blockchain
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleToken {
    mapping(address => uint256) public balances;
    uint256 public totalSupply = 1000000;

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function getBalance(address account) public view returns (uint256) {
        return balances[account];
    }
}
```

## Mobile Development

### React Native
- **Cross-platform**: iOS and Android from single codebase
- **JavaScript/TypeScript**: Familiar web development experience
- **Native Performance**: Bridge to native modules when needed
- **Hot Reload**: Quick iteration during development
- **Large Ecosystem**: Extensive libraries and community

**Best For**: Web developers entering mobile, rapid prototyping, feature parity on iOS/Android

### Flutter
- **Dart Language**: Easy to learn, null safety
- **Beautiful UIs**: Material Design and Cupertino out-of-box
- **Performance**: Ahead-of-time compilation
- **Hot Reload**: Instant iteration
- **Single Codebase**: iOS, Android, Web, Windows, macOS, Linux

**Best For**: UI-focused apps, performance-critical applications, expanding to multiple platforms

### Native Development
- **Swift (iOS)**: Modern, type-safe
- **Kotlin (Android)**: Concise, modern JVM language
- **Best Performance**: Direct platform APIs
- **Steeper Learning**: Platform-specific knowledge

**Best For**: Demanding applications, deep platform integration, maximum performance

## Game Development

### Game Engines
- **Unity**: C#, most popular, 2D/3D, asset store
- **Unreal Engine**: C++, AAA quality, powerful features
- **Godot**: Open-source, lightweight, GDScript
- **Cocos2d**: 2D games, mobile-focused
- **Phaser**: Web games, JavaScript

### Core Skills
- **Graphics Programming**: Shaders, rendering
- **Physics**: Collision detection, simulation
- **Audio**: Sound effects, music
- **Input**: Keyboard, touch, controllers
- **Networking**: Multiplayer synchronization
- **AI**: Pathfinding, behavior trees
- **Optimization**: Performance, memory

### Game Design Patterns
- **Entity-Component System**: Flexible architecture
- **State Pattern**: Managing states
- **Object Pool**: Memory efficiency
- **Factory Pattern**: Creating game objects

### Publishing
- **Platforms**: Steam, Epic Games, PlayStation, Xbox, Nintendo, mobile
- **Monetization**: Premium, F2P, ads, DLC
- **Distribution**: App stores, indie platforms
- **Marketing**: Building audience, community

## Blockchain Development

### Smart Contracts
- **Solidity**: Ethereum's language
- **Rust**: Solana, Near, Polkadot
- **Move**: Aptos, Sui
- **Vyper**: Python-like Ethereum alternative

### Core Concepts
- **Tokenomics**: Token design and economics
- **Gas Optimization**: Reducing transaction costs
- **Security**: Reentrancy, overflow/underflow
- **Upgradability**: Proxy patterns

### Applications
- **DeFi**: Decentralized finance
- **NFTs**: Non-fungible tokens
- **DAOs**: Decentralized organizations
- **Web3**: Decentralized internet

### Tools
- **Development**: Hardhat, Foundry, Remix
- **Testing**: Unit tests, fuzzing
- **Deployment**: Network selection, contract verification
- **Monitoring**: Transaction tracking, analytics

## Cybersecurity

### Secure Development
- **OWASP Top 10**: Common vulnerabilities
- **Secure Coding**: Best practices
- **Cryptography**: Encryption, hashing
- **Authentication**: Multi-factor, OAuth
- **Authorization**: Access control

### Mobile Security
- **Secure Storage**: Keychain, KeyStore
- **Certificate Pinning**: HTTPS verification
- **Data Encryption**: Encrypted databases
- **Biometric Auth**: Face ID, Touch ID

### Penetration Testing
- **Reconnaissance**: Information gathering
- **Scanning**: Vulnerability detection
- **Exploitation**: Testing vulnerabilities
- **Reporting**: Documentation, remediation

## Hands-On Projects

### Beginner - Mobile
- Weather app with API
- Notes application
- Calculator with UI
- Todo list with persistence

### Intermediate - Mobile
- Social media client
- E-commerce app with payments
- Chat application
- Maps integration

### Advanced - Mobile
- Complex multiplayer game
- AI-powered app
- Blockchain integration
- Production-ready app

### Game Development
- 2D platformer game
- 3D first-person game
- Puzzle game
- Multiplayer game

### Blockchain
- ERC-20 token contract
- NFT marketplace
- DeFi protocol
- DAO governance

## Learning Paths

### Mobile App Developer (6-12 months)
1. Learn JavaScript or Dart
2. Framework fundamentals (React Native or Flutter)
3. Navigation and state management
4. API integration
5. Testing and deployment

### Game Developer (12-24 months)
1. Choose game engine
2. Learn game design principles
3. Graphics and physics
4. Audio and input handling
5. Optimization and publishing

### Blockchain Developer (6-12 months)
1. Blockchain fundamentals
2. Choose language (Solidity, Rust)
3. Smart contract development
4. Security and testing
5. DeFi/NFT implementation

### Security Professional (12-24 months)
1. Networking fundamentals
2. Common vulnerabilities
3. Penetration testing tools
4. Secure coding practices
5. Security research

## Tech Stack Recommendations

| Goal | Mobile | Game | Blockchain |
|------|--------|------|-----------|
| **Fastest Entry** | React Native | Godot | Solidity |
| **Best Performance** | Native Swift/Kotlin | Unreal | Rust |
| **Most Accessible** | Flutter | Godot | Hardhat |
| **Largest Community** | React Native | Unity | Ethereum |

## Key Tools

| Domain | Tools |
|--------|-------|
| **Mobile** | Xcode, Android Studio, VS Code, Figma |
| **Game** | Unity, Unreal, Godot, Blender |
| **Blockchain** | Hardhat, Foundry, Remix, MetaMask |
| **Security** | Burp Suite, OWASP ZAP, Metasploit |

## Best Practices

### Mobile Development
- Test on real devices early
- Optimize for battery and data
- Follow platform design guidelines
- Monitor app performance
- Secure sensitive data

### Game Development
- Prototype quickly
- Focus on core gameplay
- Optimize before shipping
- Playtest extensively
- Plan for monetization

### Smart Contracts
- Security-first mindset
- Extensive testing
- Code audits
- Gradual deployment
- Upgrade mechanisms

## Career Paths

### Mobile Developer
- Full-time app development
- Platform specialization
- Growing mobile markets
- Competitive salaries

### Game Developer
- Studios or indie
- Passion-driven field
- Portfolio important
- Increasing opportunities

### Blockchain Engineer
- DeFi protocols
- Web3 companies
- High compensation
- Emerging field

### Security Expert
- Bug bounty hunter
- Security researcher
- Security consultant
- Pentester roles

## Key Takeaways

1. Choose technology aligned with goals
2. Build projects to learn
3. Understand trade-offs between options
4. Stay updated with ecosystem
5. Security is not optional
6. Performance matters in mobile/games
7. Community engagement is valuable

## Related Skills

- **Programming Languages**: Core language expertise
- **Cloud & DevOps**: App deployment and infrastructure
- **Web Development**: Web versions of apps
- **AI/ML**: Intelligent features
- **Leadership**: Team building

---

*For specialized mobile paths, use `/learn mobile-technologies`*
