---
title: Troubleshooting
layout: default
nav_order: 8
---

# Troubleshooting Guide

Common issues and solutions for Function Player.

## Installation Issues

### Function Player Menu Not Appearing

**Problem**: After importing Function Player, the menu items don't appear in Unity's menu bar.

**Solutions**:
1. **Restart Unity** - Close and reopen Unity completely
2. **Check Console** - Look for compilation errors that might prevent scripts from loading
3. **Verify Import** - Ensure all Function Player files were imported correctly
4. **Unity Version** - Confirm you're using Unity 2020.3 LTS or newer

### Compilation Errors After Import

**Problem**: Console shows compilation errors after importing Function Player.

**Common Causes & Solutions**:

#### Missing Dependencies
```
CS0246: The type or namespace name 'UnityEditor' could not be found
```
- **Solution**: Function Player requires UnityEditor namespace. Ensure scripts are in an Editor folder or use `#if UNITY_EDITOR` preprocessor directives.

#### Namespace Conflicts
```
CS0104: 'MethodInfo' is an ambiguous reference
```
- **Solution**: Add explicit using statements:
```csharp
using System.Reflection;
using UnityEngine;
```

#### Version Compatibility
- **Solution**: Update to the latest Function Player version compatible with your Unity version.

## Runtime Issues

### Methods Not Appearing in Function Player Window

**Problem**: Your methods don't show up in the Function Player interface.

**Checklist**:
- ✅ Methods must be `public`
- ✅ Class must inherit from `MonoBehaviour`
- ✅ GameObject must be selected in hierarchy
- ✅ Component must be attached to the GameObject

**Example of Visible Method**:
```csharp
public class MyScript : MonoBehaviour  // ✅ Inherits MonoBehaviour
{
    public void MyMethod()  // ✅ Public method
    {
        // This will appear in Function Player
    }
    
    private void PrivateMethod()  // ❌ Won't appear (private)
    {
        // Hidden from Function Player
    }
}
```

### Function Player Window Won't Open

**Problem**: Clicking Window > Function Player > Function Player Window does nothing.

**Solutions**:
1. **Check for Modal Dialogs** - Close any open modal dialogs in Unity
2. **Reset Layout** - Go to Window > Layouts > Default to reset Unity's layout
3. **Clear Preferences** - Delete Unity's preference files (backup first!)
   - Windows: `%APPDATA%\Unity\Editor-5.x`
   - macOS: `~/Library/Preferences/Unity`
   - Linux: `~/.config/unity3d`

### Parameters Not Accepting Input

**Problem**: Parameter fields appear but don't accept input or show incorrect types.

**Debugging Steps**:
1. **Check Parameter Types** - Ensure parameters use supported types
2. **Verify Method Signature** - Confirm method parameters match expected types
3. **Restart Unity** - Sometimes editor state gets corrupted

**Supported Parameter Types**:
- Primitives: `int`, `float`, `string`, `bool`
- Unity types: `Vector3`, `Color`, `GameObject`, `Transform`
- Enums and custom classes with proper serialization

## Performance Issues

### Slow Method Execution

**Problem**: Methods take much longer to execute through Function Player than normal calls.

**Possible Causes**:
1. **Reflection Overhead** - First-time method calls include reflection setup
2. **Parameter Serialization** - Complex parameters take time to serialize
3. **Unity Editor Overhead** - Editor-only code runs during execution

**Solutions**:
- Use simple parameter types when possible
- Consider caching for frequently called methods
- Profile methods to identify bottlenecks

### Memory Leaks During Testing

**Problem**: Memory usage increases during extended Function Player sessions.

**Prevention**:
- Clean up created objects in your methods
- Use `DestroyImmediate()` for editor-time object destruction
- Implement proper disposal for IDisposable objects

```csharp
public void CreateTestObjects(int count)
{
    var objects = new List<GameObject>();
    
    try
    {
        for (int i = 0; i < count; i++)
        {
            objects.Add(Instantiate(prefab));
        }
        
        // Do testing...
    }
    finally
    {
        // Cleanup
        foreach (var obj in objects)
        {
            if (obj != null)
                DestroyImmediate(obj);
        }
    }
}
```

## UI and Display Issues

### Function Player Window Layout Broken

**Problem**: Function Player window layout appears corrupted or elements overlap.

**Solutions**:
1. **Resize Window** - Try resizing the Function Player window
2. **Dock/Undock** - Undock and redock the window
3. **Reset Preferences** - Clear Unity editor preferences

### Parameters Display Incorrectly

**Problem**: Parameter inputs show wrong types or are missing entirely.

**Debugging**:
```csharp
// Problematic method signature
public void MyMethod(CustomClass param)  // May not display correctly

// Better approach
public void MyMethod(string paramName, float paramValue)  // Clear, simple types
```

**Use Attributes for Better Display**:
```csharp
public void SetVolume([Range(0f, 1f)] float volume)  // Shows slider
{
    // Unity's Range attribute helps Function Player create appropriate UI
}
```

## Integration Issues

### Conflicts with Other Editor Tools

**Problem**: Function Player conflicts with other Unity editor extensions.

**Common Conflicts**:
- **Custom Inspectors**: May interfere with parameter editing
- **Editor Windows**: Shared resources or GUI conflicts
- **Menu Items**: Duplicate menu paths

**Solutions**:
1. **Update All Tools** - Ensure all editor extensions are up to date
2. **Check Load Order** - Some tools are sensitive to script execution order
3. **Isolate Issues** - Temporarily disable other extensions to identify conflicts

### Version Control Issues

**Problem**: Function Player settings don't sync across team members.

**Best Practices**:
- Include Function Player in version control
- Document setup procedures for team members
- Use consistent Unity versions across the team
- Avoid committing personal Function Player preferences

## Platform-Specific Issues

### macOS Permission Issues

**Problem**: Function Player can't access certain files or folders on macOS.

**Solutions**:
- Grant Unity full disk access in System Preferences > Security & Privacy
- Check folder permissions where Unity is installed
- Run Unity with appropriate user privileges

### Linux Display Issues

**Problem**: Function Player UI elements don't render correctly on Linux.

**Solutions**:
- Update graphics drivers
- Try different Unity editor versions
- Check GTK theme compatibility
- Use Unity Hub for consistent setup

## Getting More Help

### Enable Debug Mode

Add this to see more detailed information:

```csharp
#if UNITY_EDITOR
[MenuItem("Function Player/Enable Debug Mode")]
public static void EnableDebugMode()
{
    FunctionPlayerSettings.debugMode = true;
    Debug.Log("Function Player debug mode enabled");
}
#endif
```

### Collect System Information

When reporting issues, include:
- Unity version and platform
- Function Player version
- Console error messages
- Steps to reproduce the issue
- System specifications

### Contact Support

If you can't resolve the issue:

1. **Check Documentation** - Review all relevant documentation sections
2. **Search Issues** - Look for similar problems in our support channels
3. **Create Detailed Report** - Include all relevant information and steps to reproduce
4. **Contact Support** - Reach out through the Unity Asset Store or our support email

### Community Resources

- **Unity Forums**: Search Function Player discussions
- **Discord Communities**: Unity developer servers often have helpful members
- **GitHub Issues**: If available, check our public issue tracker

---

**Still having issues?** Don't hesitate to reach out - we're here to help you get the most out of Function Player!
