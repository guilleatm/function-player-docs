---
title: API Reference
layout: default
nav_order: 10
---

# API Reference

## 🚧 Work in Progress

This section is currently being updated to reflect the actual Function Player API and features.

## Built-in Methods

When targeting a GameObject with FunctionPlayer, you get access to utility methods:

```csharp
Wait(float seconds)      // Pause execution
Log(string message)      // Debug output
```

## Parameter Support

Function Player automatically creates UI for:

- **Basic Types**: `bool`, `int`, `float`, `string`, `enum`
- **Unity Types**: `Vector2/3/4`, `Color`, `AnimationCurve`, `Gradient`
- **Custom Classes**: Any `[System.Serializable]` class

---

*Complete API documentation coming. For now, refer to the included documentation in the package.*
