---
title: FAQ
layout: default
nav_order: 9
---

# Frequently Asked Questions

Common questions about Function Player and their answers.

## General Questions

### What is Function Player?

Function Player is a Unity editor tool that allows you to execute and test methods visually without writing additional code. It provides an intuitive interface to call functions, set parameters, and view results in real-time.

### Do I need programming knowledge to use Function Player?

Basic C# knowledge is helpful, but Function Player is designed to be accessible to designers and artists too. If you can understand method names and parameters, you can use Function Player effectively.

### Is Function Player only for Unity Pro users?

No, Function Player works with all Unity versions and license types, including Personal licenses.

### Does Function Player work in builds?

Function Player is an editor-only tool designed for development and testing. It doesn't affect your game builds and adds no overhead to the final product.

## Compatibility and Requirements

### Which Unity versions are supported?

Function Player supports Unity 2020.3 LTS and newer versions. We recommend using the latest LTS version for the best experience.

### Does it work on all platforms?

Function Player runs in the Unity Editor on Windows, macOS, and Linux. The functions you test can target any platform Unity supports.

### Can I use Function Player with other Unity assets?

Yes! Function Player works with any MonoBehaviour-based scripts, including third-party assets like Cinemachine, ProBuilder, or custom tools.

### Is there URP/HDRP support?

Function Player works with all render pipelines. Since it operates at the script level, it's render pipeline agnostic.

## Technical Questions

### How does Function Player find my methods?

Function Player uses .NET reflection to discover public methods in MonoBehaviour components. It automatically scans selected GameObjects and displays available methods.

### Can I use Function Player with static methods?

Yes! Static methods are supported. Select any GameObject with a script that contains static methods, and they'll appear in the Function Player interface.

### What parameter types are supported?

Function Player supports:
- **Primitives**: `int`, `float`, `string`, `bool`
- **Unity Types**: `Vector3`, `Color`, `Transform`, `GameObject`, etc.
- **Enums**: All enum types with dropdown selection
- **Custom Classes**: Serializable classes with property editors
- **Collections**: Arrays and Lists with dynamic editing

### Can Function Player execute async methods?

Yes, Function Player can execute `async` methods and will properly await their completion before displaying results.

### Does Function Player support method overloads?

Yes, if you have multiple methods with the same name but different parameters, Function Player will show them as separate entries.

## Usage and Workflow

### How do I make my methods appear in Function Player?

Ensure your methods are:
1. `public`
2. In a class that inherits from `MonoBehaviour`
3. Attached to a GameObject that's selected in the hierarchy

### Can I hide certain methods from Function Player?

Yes, use the `[FunctionPlayerIgnore]` attribute:

```csharp
[FunctionPlayerIgnore]
public void InternalMethod()
{
    // This won't appear in Function Player
}
```

### How do I organize methods in Function Player?

Use the `[FunctionPlayerCategory]` attribute:

```csharp
[FunctionPlayerCategory("Combat")]
public void TakeDamage(int damage) { }

[FunctionPlayerCategory("Movement")]
public void Jump() { }
```

### Can I add descriptions to methods?

Yes, use the `[FunctionPlayerDescription]` attribute:

```csharp
[FunctionPlayerDescription("Deals damage to the player with armor calculation")]
public void TakeDamage(int damage) { }
```

### How do I test methods that require specific game states?

Create setup methods to establish the required state:

```csharp
[FunctionPlayerCategory("Setup")]
public void SetupCombatTest()
{
    // Initialize combat state
    SetHealth(100);
    SetArmor(25);
    SpawnEnemies(3);
}

[FunctionPlayerCategory("Combat")]
public void TestDamageCalculation(int damage)
{
    // Your damage test
}
```

## Performance and Optimization

### Does Function Player impact game performance?

Function Player only runs in the Unity Editor and has no impact on built games. In the editor, there's minimal overhead from reflection, but it's negligible for typical usage.

### Can I use Function Player for automated testing?

While Function Player is primarily designed for manual testing, you can write scripts to execute methods programmatically:

```csharp
public void RunAutomatedTests()
{
    FunctionPlayer.ExecuteMethod("TakeDamage", new object[] { 25 });
    FunctionPlayer.ExecuteMethod("Heal", new object[] { 10 });
}
```

### How do I optimize Function Player for large projects?

- Use categories to organize methods
- Hide internal methods with `[FunctionPlayerIgnore]`
- Create focused testing scripts rather than exposing everything
- Use search functionality to quickly find methods

## Troubleshooting

### My methods aren't showing up. What's wrong?

Check that:
- Methods are `public`
- Class inherits from `MonoBehaviour`
- GameObject with the script is selected
- There are no compilation errors

### Parameter fields aren't working correctly

Ensure:
- Parameter types are supported
- Custom classes are properly serializable
- Unity Editor isn't in an error state

### Function Player window won't open

Try:
- Restarting Unity
- Resetting window layout (Window > Layouts > Default)
- Checking for console errors

### Methods execute but nothing happens

Verify:
- Method implementation is correct
- Debug.Log statements appear in console
- Method isn't being called on inactive GameObjects
- Scene is in play mode if required

## Advanced Usage

### Can I create custom parameter editors?

Yes! Create custom editors for complex parameter types:

```csharp
[CustomParameterEditor(typeof(MyCustomClass))]
public class MyCustomClassEditor : ParameterEditor<MyCustomClass>
{
    public override void OnGUI(Rect position, ref MyCustomClass value)
    {
        // Custom GUI implementation
    }
}
```

### How do I integrate Function Player with my workflow?

- **Level Design**: Create methods for spawning, positioning, and configuring game elements
- **Game Balance**: Expose parameters for tweaking gameplay values
- **Bug Testing**: Create methods to reproduce specific game states
- **Art Integration**: Methods for testing visual effects and animations

### Can I extend Function Player's functionality?

Function Player provides several extension points:
- Custom parameter editors
- Result viewers for complex return types
- Integration with other Unity tools
- Custom attributes for enhanced behavior

## Licensing and Distribution

### Can I include Function Player in my team project?

Yes, if you have a valid Function Player license, you can include it in your team projects according to Unity Asset Store terms.

### Can I modify Function Player source code?

Function Player is provided as compiled assemblies. However, you can extend its functionality through the provided API and extension points.

### Is there a trial version available?

Check the Unity Asset Store for any trial or demo versions. The documentation and screenshots provide a good overview of functionality.

## Support and Community

### Where can I get help?

1. **Documentation**: This comprehensive documentation site
2. **Unity Asset Store**: Leave questions and reviews
3. **Email Support**: Contact information provided with your purchase
4. **Community Forums**: Unity forums and Discord servers

### How do I report bugs?

- Provide detailed reproduction steps
- Include Unity version and Function Player version
- Attach console logs if applicable
- Describe expected vs actual behavior

### Can I suggest new features?

Absolutely! We welcome feedback and feature requests. Contact us through the support channels with your ideas.

### Is there a roadmap for future updates?

Major features and improvements are often shared through update notes and community channels. Follow our updates for the latest information.

---

**Don't see your question here?** Feel free to reach out through our support channels - we're always happy to help!
