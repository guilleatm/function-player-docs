---
title: API Reference
layout: default
nav_order: 10
---

# API Reference

Complete technical reference for Function Player's API and extensibility features.

## Core Classes

### FunctionPlayer

Main controller class for the Function Player system.

```csharp
public class FunctionPlayer : EditorWindow
{
    // Core functionality
    public static FunctionPlayer Instance { get; }
    public void RefreshMethods()
    public void ExecuteMethod(MethodInfo method, object[] parameters)
    public void ClearResults()
}
```

### MethodExecutor

Handles method invocation and result processing.

```csharp
public class MethodExecutor
{
    public ExecutionResult Execute(MethodInfo method, object target, object[] args)
    public Task<ExecutionResult> ExecuteAsync(MethodInfo method, object target, object[] args)
    public void Cancel()
}
```

### ExecutionResult

Contains the results of method execution.

```csharp
public class ExecutionResult
{
    public object ReturnValue { get; set; }
    public TimeSpan ExecutionTime { get; set; }
    public Exception Exception { get; set; }
    public bool IsSuccess => Exception == null;
}
```

## Attributes

Function Player provides several attributes for customizing method behavior:

### FunctionPlayerIgnore

Hides methods from Function Player interface.

```csharp
[FunctionPlayerIgnore]
public void InternalMethod()
{
    // This method won't appear in Function Player
}
```

### FunctionPlayerCategory

Organizes methods into custom categories.

```csharp
[FunctionPlayerCategory("Debug")]
public void DebugMethod()
{
    // Appears under "Debug" category
}
```

### FunctionPlayerDescription

Adds tooltips and descriptions to methods.

```csharp
[FunctionPlayerDescription("Calculates damage with armor resistance")]
public float CalculateDamage(float baseDamage, float armor)
{
    return baseDamage * (100f / (100f + armor));
}
```

### FunctionPlayerParameterRange

Defines ranges for numeric parameters.

```csharp
public void SetVolume([FunctionPlayerParameterRange(0f, 1f)] float volume)
{
    // Parameter will show as slider from 0 to 1
}
```

## Custom Parameter Editors

Create custom editors for complex parameter types:

```csharp
[CustomParameterEditor(typeof(MyCustomClass))]
public class MyCustomClassEditor : ParameterEditor<MyCustomClass>
{
    public override void OnGUI(Rect position, ref MyCustomClass value)
    {
        // Custom GUI for your parameter type
        EditorGUI.LabelField(position, "Custom Editor");
        // ... your custom editor code
    }
    
    public override float GetPropertyHeight()
    {
        return EditorGUIUtility.singleLineHeight;
    }
}
```

## Events and Callbacks

Subscribe to Function Player events:

```csharp
public class MyEventListener
{
    void OnEnable()
    {
        FunctionPlayer.OnMethodExecuted += HandleMethodExecuted;
        FunctionPlayer.OnSelectionChanged += HandleSelectionChanged;
    }
    
    void OnDisable()
    {
        FunctionPlayer.OnMethodExecuted -= HandleMethodExecuted;
        FunctionPlayer.OnSelectionChanged -= HandleSelectionChanged;
    }
    
    private void HandleMethodExecuted(MethodInfo method, ExecutionResult result)
    {
        Debug.Log($"Method {method.Name} executed in {result.ExecutionTime.TotalMilliseconds}ms");
    }
    
    private void HandleSelectionChanged(GameObject newSelection)
    {
        Debug.Log($"Selected object: {newSelection?.name}");
    }
}
```

## Configuration

Customize Function Player behavior:

```csharp
public static class FunctionPlayerSettings
{
    public static bool ShowPrivateMethods { get; set; }
    public static bool ShowInheritedMethods { get; set; }
    public static bool EnableAsyncExecution { get; set; }
    public static int MaxExecutionTime { get; set; } = 5000; // milliseconds
}
```

## Scripting API

Execute methods programmatically:

```csharp
public class ScriptingExample : MonoBehaviour
{
    public void Start()
    {
        // Get Function Player instance
        var fp = FunctionPlayer.Instance;
        
        // Execute method by name
        var target = FindObjectOfType<PlayerController>();
        var method = typeof(PlayerController).GetMethod("Jump");
        fp.ExecuteMethod(method, new object[] { });
        
        // Execute with parameters
        var moveMethod = typeof(PlayerController).GetMethod("MoveTo");
        fp.ExecuteMethod(moveMethod, new object[] { Vector3.forward, 2.0f });
    }
}
```

## Integration with Unity Systems

### Undo System Integration

Function Player automatically integrates with Unity's Undo system:

```csharp
[FunctionPlayerUndoable]
public void ModifyObject(string newName)
{
    Undo.RecordObject(this, "Modify Object");
    name = newName;
}
```

### Serialization Support

Handle serialized properties:

```csharp
public class SerializedPropertyExample : MonoBehaviour
{
    [SerializeField] private int health = 100;
    
    [FunctionPlayerPropertyBinding("health")]
    public void SetHealth(int newHealth)
    {
        // Function Player will automatically update the serialized property
        health = newHealth;
    }
}
```

## Performance Considerations

### Async Execution

For long-running operations:

```csharp
[FunctionPlayerAsync]
public async Task<string> LoadDataAsync(string url)
{
    using var client = new HttpClient();
    var response = await client.GetStringAsync(url);
    return response;
}
```

### Caching

Optimize repeated calls:

```csharp
[FunctionPlayerCacheable(Duration = 5)] // Cache for 5 seconds
public ExpensiveData GetExpensiveData()
{
    // This result will be cached
    return CalculateExpensiveData();
}
```

## Error Handling

Handle exceptions gracefully:

```csharp
public class SafeMethodExample : MonoBehaviour
{
    [FunctionPlayerSafe] // Prevents exceptions from breaking the editor
    public void RiskyOperation()
    {
        throw new InvalidOperationException("Something went wrong!");
    }
}
```

## Validation

Add parameter validation:

```csharp
public void SetPlayerLevel([FunctionPlayerValidation("ValidateLevel")] int level)
{
    // level is validated before method execution
}

private bool ValidateLevel(int level)
{
    return level >= 1 && level <= 100;
}
```

---

For more detailed examples and advanced usage patterns, see our [GitHub repository](https://github.com/guilleatm/function-player-docs) or check out the [Use Cases]({% link docs/use-cases.md %}) section.
