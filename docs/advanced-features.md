---
title: Advanced Features
layout: default
nav_order: 4
---

# Advanced Features

Explore Function Player's powerful capabilities for complex workflows and advanced use cases.

## Custom Parameter Inspectors

Function Player automatically generates appropriate UI controls for different parameter types, but you can create custom inspectors for specialized needs.

### Built-in Type Support

Function Player provides smart editors for:

- **Primitive Types**: int, float, string, bool with appropriate controls
- **Unity Types**: Vector3, Color, AnimationCurve, Gradient
- **Object References**: GameObject, Component, ScriptableObject with object pickers
- **Collections**: Arrays, Lists with dynamic add/remove functionality
- **Enums**: Dropdown selections with flag support

### Creating Custom Inspectors

For complex custom types, create specialized editors:

```csharp
[CustomParameterEditor(typeof(WeaponConfig))]
public class WeaponConfigEditor : ParameterEditor<WeaponConfig>
{
    public override void OnGUI(Rect position, ref WeaponConfig value)
    {
        if (value == null) value = new WeaponConfig();
        
        var rect = new Rect(position.x, position.y, position.width, EditorGUIUtility.singleLineHeight);
        
        value.damage = EditorGUI.FloatField(rect, "Damage", value.damage);
        rect.y += EditorGUIUtility.singleLineHeight + 2;
        
        value.fireRate = EditorGUI.Slider(rect, "Fire Rate", value.fireRate, 0.1f, 10f);
        rect.y += EditorGUIUtility.singleLineHeight + 2;
        
        value.weaponType = (WeaponType)EditorGUI.EnumPopup(rect, "Type", value.weaponType);
    }
}
```

## Batch Operations

Execute multiple methods or the same method with different parameters efficiently.

### Multi-Method Execution

Select and execute multiple methods simultaneously:

1. Hold `Ctrl` (Windows) or `Cmd` (Mac) while clicking methods
2. Click **Execute Selected** in the toolbar
3. Monitor all executions in the Results panel

### Parameter Variations

Test methods with multiple parameter sets:

```csharp
// Example: Testing damage calculation with different values
public float CalculateDamage(float baseDamage, float armor, float critMultiplier)
{
    return baseDamage * critMultiplier * (100f / (100f + armor));
}
```

Use the **Parameter Presets** feature:
1. Set up different parameter combinations
2. Save them as presets
3. Quickly switch between test scenarios

### Automated Testing Sequences

Create repeatable test sequences:

```csharp
[FunctionPlayerSequence("Combat Testing")]
public IEnumerator TestCombatSequence()
{
    // Setup
    SetPlayerHealth(100);
    yield return new WaitForSeconds(0.1f);
    
    // Test normal damage
    TakeDamage(25);
    yield return new WaitForSeconds(0.5f);
    
    // Test critical damage
    TakeDamage(50, true);
    yield return new WaitForSeconds(0.5f);
    
    // Test healing
    Heal(30);
    yield return new WaitForSeconds(0.5f);
}
```

## Performance Monitoring

Function Player provides comprehensive performance analysis tools.

### Execution Time Tracking

Monitor method performance in real-time:

- **Individual Calls**: See execution time for each method call
- **Aggregated Statistics**: Track average, min, max execution times
- **Performance Alerts**: Get notified when methods exceed thresholds

### Memory Profiling

Track memory usage during method execution:

```csharp
[FunctionPlayerProfileMemory]
public void CreateManyObjects(int count)
{
    for (int i = 0; i < count; i++)
    {
        GameObject.Instantiate(prefab);
    }
    // Memory usage delta will be displayed
}
```

### Call Stack Analysis

Understand method interaction patterns:

- **Nested Calls**: See which methods call other methods
- **Recursion Detection**: Identify recursive calls and potential infinite loops
- **Dependency Mapping**: Visualize method dependencies

## Debugging Integration

Seamlessly integrate with Unity's debugging tools.

### Breakpoint Integration

Function Player respects your debugger breakpoints:

1. Set breakpoints in your IDE
2. Execute methods through Function Player
3. Debugger will pause at breakpoints normally
4. Continue debugging with full IDE support

### Console Integration

Function Player links with Unity's Console:

- **Tagged Output**: Method calls are tagged for easy identification
- **Stack Trace Links**: Click console messages to jump to method definitions
- **Error Context**: Exceptions show the Function Player execution context

### Visual Debugging

Enable visual debugging features:

```csharp
[FunctionPlayerVisualDebug]
public void ShowPathfinding(Vector3 start, Vector3 end)
{
    var path = CalculatePath(start, end);
    // Function Player will visualize the path in Scene view
    DebugDraw.DrawPath(path, Color.red, 2f);
}
```

## Scripting and Automation

Automate Function Player operations through scripts.

### Programmatic Execution

Execute methods from code:

```csharp
public class AutomatedTesting : MonoBehaviour
{
    [ContextMenu("Run Automated Tests")]
    public void RunTests()
    {
        var player = FindObjectOfType<PlayerController>();
        var fp = FunctionPlayer.Instance;
        
        // Test movement
        fp.ExecuteMethod("MoveTo", new object[] { Vector3.forward * 5 });
        
        // Test combat
        fp.ExecuteMethod("TakeDamage", new object[] { 25 });
        
        // Test abilities
        fp.ExecuteMethod("UseAbility", new object[] { AbilityType.Fireball });
    }
}
```

### Custom Workflows

Create reusable testing workflows:

```csharp
[CreateAssetMenu(fileName = "TestWorkflow", menuName = "Function Player/Test Workflow")]
public class TestWorkflow : ScriptableObject
{
    [System.Serializable]
    public struct TestStep
    {
        public string methodName;
        public object[] parameters;
        public float delay;
    }
    
    public TestStep[] steps;
    
    public void Execute()
    {
        StartCoroutine(ExecuteWorkflow());
    }
    
    private IEnumerator ExecuteWorkflow()
    {
        foreach (var step in steps)
        {
            FunctionPlayer.Instance.ExecuteMethod(step.methodName, step.parameters);
            yield return new WaitForSeconds(step.delay);
        }
    }
}
```

## Integration Extensions

Extend Function Player with custom functionality.

### Custom Result Viewers

Create specialized viewers for complex return types:

```csharp
[CustomResultViewer(typeof(GameStats))]
public class GameStatsViewer : ResultViewer<GameStats>
{
    public override void OnGUI(GameStats result)
    {
        GUILayout.Label($"Score: {result.score:N0}", EditorStyles.boldLabel);
        GUILayout.Label($"Time: {result.playTime:F1}s");
        
        // Progress bar for completion
        var rect = GUILayoutUtility.GetRect(100, 20);
        EditorGUI.ProgressBar(rect, result.completionPercentage, "Progress");
    }
}
```

### Plugin Integration

Integrate with other Unity tools:

```csharp
// Integration with ProBuilder
[FunctionPlayerExtension("ProBuilder")]
public static class ProBuilderIntegration
{
    [FunctionPlayerMethod("Create Cube")]
    public static GameObject CreateProBuilderCube(Vector3 size)
    {
        var cube = ShapeGenerator.CreateShape(ShapeType.Cube);
        cube.transform.localScale = size;
        return cube.gameObject;
    }
}
```

## Security and Safety

Function Player includes several safety features for production use.

### Method Filtering

Control which methods are accessible:

```csharp
[FunctionPlayerSecurity]
public class SecuritySettings : ScriptableObject
{
    public bool allowDestructiveMethods = false;
    public string[] blockedMethods;
    public string[] allowedNamespaces;
}
```

### Execution Limits

Prevent runaway executions:

```csharp
[FunctionPlayerExecutionLimit(maxTime: 5000, maxMemory: 100 * 1024 * 1024)]
public void PotentiallySlowMethod()
{
    // This method will be terminated if it exceeds limits
}
```

### Undo Integration

Automatically support undo for state-changing operations:

```csharp
[FunctionPlayerUndoable("Set Player Position")]
public void SetPosition(Vector3 newPosition)
{
    Undo.RecordObject(transform, "Set Position");
    transform.position = newPosition;
}
```

---

Ready to put these advanced features to work? Check out our [Use Cases]({% link docs/use-cases.md %}) section for real-world examples and implementation patterns.
