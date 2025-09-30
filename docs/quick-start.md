---
title: Quick Start
layout: default
nav_order: 2
---

# Quick Start Guide

Get up and running with Function Player in just 3 minutes!

## Video Tutorial

Watch this complete tutorial to see Function Player in action:

<iframe width="560" height="315" src="https://www.youtube.com/embed/lQm3VVnPc0w" title="Function Player Tutorial" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Step 1: Add Function Player Component

1. Create a `GameObject` in your scene
2. Add the `Function Player` component to it
3. You will see a custom inspector with a `Create Item` button

## Step 2: Create Your First Method Call

1. Click `Create Item` in the Function Player inspector
2. A new item will appear with these fields:
   - **Target**: Select a `GameObject`
   - **Component**: Choose a component from the dropdown
   - **Method**: Pick a method to call

## Step 3: Execute the Sequence

1. **Enter Play mode** (sequences only run during Play)
2. Click the **"Play"** button in the Function Player inspector
3. Your method calls will execute in order

## Example Setup

Here's a complete example using a simple test script:

```csharp
public class TestScript : MonoBehaviour
{
    public void SayHello(string message)
    {
        Debug.Log("Hello: " + message);
    }
}
```

**Configuration**:
1. **Target**: Select the GameObject with the `TestScript` component
2. **Component**: Choose `TestScript` component 
3. **Method**: Select `SayHello` method
4. **Parameter**: Enter `"World"` in the message field

**Result**: You'll see "Hello: World" in the Console

## Built-in Utility Methods

Target the Function Player GameObject itself to access:

- **`Wait(float seconds)`** - Pause execution between method calls
- **`Log(string message)`** - Output debug messages

## Creating Sequences

Add multiple items to create sequences:

1. Item 1: `TestScript.SayHello("Starting")`
2. Item 2: `FunctionPlayer.Wait(2.0)`  
3. Item 3: `TestScript.SayHello("Done")`

Use the **Up/Down** arrows to reorder items.

## Supported Parameter Types

Function Player automatically creates UI for:

- **Basic**: `bool`, `int`, `float`, `string`, `enum`
- **Unity**: `Vector3`, `Color`, `AnimationCurve`, `Gradient`
- **Custom**: Any `[System.Serializable]` class

## What's Next?

- [API Reference](docs/api.md) - Technical documentation and advanced features
- Experiment with coroutines for animations and timed sequences
- Try cross-GameObject method calls for complex interactions
