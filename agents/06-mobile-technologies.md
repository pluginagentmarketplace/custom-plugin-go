---
description: Mobile development expert covering React Native, Flutter, blockchain, game development, and cybersecurity. Master cross-platform development, emerging technologies, and production mobile systems.
capabilities:
  - React Native and Flutter development
  - Cross-platform app architecture
  - Blockchain and Web3
  - Game development
  - Cybersecurity fundamentals
  - Native module integration
  - Performance optimization for mobile
  - App store deployment
---

# Mobile & Emerging Technologies

Master mobile development and cutting-edge technologies.

## 📱 React Native

**Setup & Architecture**
```javascript
// Project structure
- app/
  - screens/
  - components/
  - navigation/
  - services/
  - store/ (state management)

// Basic App
import React from 'react';
import { View, Text } from 'react-native';

export default function App() {
  return (
    <View style={{ flex: 1, justifyContent: 'center' }}>
      <Text>Hello Mobile!</Text>
    </View>
  );
}
```

**Key Differences from Web**
- No CSS, use StyleSheet
- No HTML, use View/Text
- Native modules for device features
- Performance critical on mobile
- Touch events instead of click

**Navigation**
- React Navigation (popular)
- Stack, Tab, Drawer navigators
- Deep linking
- State persistence

**Performance**
- FlatList for lists (not ScrollView + map)
- useMemo for expensive calculations
- Hermes engine for faster startup
- Split testing on real devices

## 🦋 Flutter

**Dart Language**
```dart
// Variables
var name = 'John';
final age = 30;
late String email;

// Functions
String greet(String name) => 'Hello, $name!';

// Classes
class User {
  final String name;
  final int age;
  
  User({required this.name, required this.age});
}

// Async
Future<String> fetchUser() async {
  final response = await http.get(Uri.parse(url));
  return response.body;
}
```

**Flutter Widgets**
- Stateless: immutable, no state
- Stateful: mutable state
- CustomPaint: drawing
- Stream builders: real-time data

**State Management**
- Provider: recommended
- Riverpod: modern alternative
- BLoC: business logic component
- GetX: all-in-one

**Performance**
- const constructors
- RepaintBoundary
- Lazy builders
- Image caching

## ⛓️ Blockchain

**Smart Contracts**
```solidity
// Ethereum
pragma solidity ^0.8.0;

contract Token {
    mapping(address => uint) public balances;
    
    function transfer(address to, uint amount) public {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
```

**DeFi/NFTs**
- Token standards: ERC-20, ERC-721
- DEX: decentralized exchange
- Lending protocols
- Yield farming

**Platforms**
- Ethereum: largest ecosystem
- Solana: high speed, low cost
- Polygon: Layer 2 scaling
- Others: Avalanche, Polkadot

## 🎮 Game Development

**Game Engines**
- Unity (C#): most popular
- Unreal (C++): AAA quality
- Godot (GDScript): open-source

**Core Skills**
- Physics: collision, gravity
- Graphics: shaders, optimization
- AI: pathfinding, behavior trees
- Networking: multiplayer systems
- Audio: 3D sound, music

**Optimization**
- LOD (level of detail)
- Batching: reduce draw calls
- Asset streaming
- Memory management

## 🔒 Cybersecurity

**Mobile Security**
- Secure storage: Keychain, KeyStore
- Certificate pinning: prevent MITM
- Biometric auth: Face ID, Touch ID
- Root/jailbreak detection
- Encrypted communication

**OWASP Mobile Top 10**
1. Improper credential handling
2. Insecure authentication
3. Insecure communication
4. Insecure authentication
5. Insufficient cryptography
6. Insecure authorization
7. Client-side injection
8. Extraneous functionality
9. Insecure data storage
10. Extraneous functionality

**Tools**
- Burp Suite: API testing
- OWASP ZAP: scanning
- Frida: instrumentation
- Metasploit: exploitation

## ✅ Mobile Career

**Mobile Developer**
- Cross-platform preference
- Salary: $100K-$180K
- Growing demand

---

**Ready for Mobile?** Use `/learn mobile-technologies`!
