---
title: Quick Start
layout: default
nav_order: 2
---

# Quick Start Guide

Get up and running with Function Player in just 5 minutes!

## Step 1: Open Function Player

After [installation]({% link docs/installation.md %}), open the Function Player window:

1. Go to **Window > Function Player > Function Player Window**
2. Dock the window wherever convenient in your Unity layout

## Step 2: Select a Target Object

Function Player works with GameObjects that have MonoBehaviour components:

1. Select a GameObject in your scene that has a script component
2. The Function Player window will automatically detect available methods
3. You'll see a list of public methods that can be executed

## Step 3: Execute Your First Function

Let's execute a simple function:

1. Find a method in the list (e.g., a `SetActive` method)
2. If the method has parameters, input values will appear
3. Click the **Execute** button next to the method
4. Watch the function execute in real-time!

## Step 4: Monitor Results

Function Player provides immediate feedback:

- **Return Values**: See what the function returned
- **Execution Time**: Monitor performance
- **Console Output**: Any Debug.Log messages appear in context

## Example: Testing a Simple Script

Here's a simple script to test Function Player:

```csharp
using UnityEngine;

public class TestScript : MonoBehaviour
{
    public int health = 100;
    
    public void TakeDamage(int damage)
    {
        health -= damage;
        Debug.Log($"Took {damage} damage. Health now: {health}");
    }
    
    public int GetHealth()
    {
        return health;
    }
    
    public void ResetHealth()
    {
        health = 100;
        Debug.Log("Health reset to 100");
    }
}
```

### Try These Actions:

1. **Call `TakeDamage(25)`** - Input 25 in the parameter field
2. **Call `GetHealth()`** - See the current health value
3. **Call `ResetHealth()`** - Reset health back to 100

## What's Next?

Now that you've executed your first function, explore more features:

- [Getting Started Guide]({% link docs/getting-started.md %}) - Learn core concepts
- [Advanced Features]({% link docs/advanced-features.md %}) - Discover powerful capabilities
- [Use Cases]({% link docs/use-cases.md %}) - Real-world examples

## Pro Tips

- **Pin Frequently Used Methods**: Right-click methods to pin them for quick access
- **Use Keyboard Shortcuts**: Press `Ctrl+E` (Windows) or `Cmd+E` (Mac) to execute selected methods
- **Batch Operations**: Hold Shift to select multiple methods for batch execution
