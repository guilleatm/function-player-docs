---
title: Getting Started
layout: default
nav_order: 3
---

# Getting Started with Function Player

Now that you've completed the [Quick Start]({% link docs/quick-start.md %}), let's dive deeper into Function Player's core concepts and workflows.

## Understanding Function Player

Function Player is built around the concept of **visual function execution**. Instead of writing test code or using console commands, you can directly interact with your methods through an intuitive interface.

### Key Concepts

#### 1. **Target Objects**
Function Player works with any GameObject that contains MonoBehaviour scripts. When you select an object:
- All public methods become visible
- Static methods are also accessible
- Generic methods are supported with type specification

#### 2. **Method Categories**
Methods are automatically categorized:
- **Actions**: Methods that perform operations (`void` return type)
- **Queries**: Methods that return values
- **Properties**: Getters and setters
- **Events**: UnityEvent and custom event methods

#### 3. **Parameter Handling**
Function Player provides smart input controls for different parameter types:
- **Primitives**: Text fields for int, float, string, bool
- **Unity Objects**: Object pickers for GameObjects, Transforms, etc.
- **Custom Classes**: Expandable property editors
- **Arrays/Lists**: Dynamic list editors with add/remove functionality

## The Function Player Window

### Main Interface Areas

#### Method List Panel
- Displays all available methods for the selected object
- **Search Bar**: Filter methods by name or return type
- **Category Tabs**: Switch between Actions, Queries, Properties
- **Favorites**: Pin frequently used methods

#### Parameter Panel
- **Dynamic Input Fields**: Automatically generated based on method signature
- **Type Validation**: Real-time validation of input values
- **Default Values**: Shows method parameter defaults when available
- **History**: Recent parameter values for quick reuse

#### Results Panel
- **Return Values**: Formatted display of method results
- **Execution Time**: Performance monitoring
- **Call Stack**: Track nested method calls
- **Console Integration**: Linked with Unity's console output

### Toolbar Features

#### Execution Controls
- **Execute Button**: Run the selected method
- **Execute All**: Run all methods in current selection
- **Stop**: Halt long-running operations
- **Clear Results**: Reset the results panel

#### View Options
- **Group by Type**: Organize methods by return type
- **Show Inherited**: Include methods from base classes
- **Show Private**: Display non-public methods (debug mode)

## Working with Different Method Types

### Simple Methods
```csharp
public void Jump()
{
    // Simple parameterless method
}
```
Just click Execute - no setup needed!

### Methods with Parameters
```csharp
public void MoveTo(Vector3 position, float speed)
{
    // Method with multiple parameters
}
```
Function Player automatically creates:
- Vector3 input field for `position`
- Float slider/input for `speed`

### Methods with Return Values
```csharp
public float CalculateDistance(Transform target)
{
    return Vector3.Distance(transform.position, target.position);
}
```
Results appear immediately in the Results Panel with:
- Return value: `12.34`
- Execution time: `0.002ms`

### Generic Methods
```csharp
public T GetComponent<T>() where T : Component
{
    return GetComponent<T>();
}
```
Function Player provides a type selector dropdown.

## Workflow Examples

### Testing Game Mechanics

**Scenario**: Testing a player health system

1. Select your Player GameObject
2. Find the `TakeDamage(int damage)` method
3. Input different damage values (10, 25, 50)
4. Monitor health changes in real-time
5. Use `Heal(int amount)` to restore health
6. Test edge cases (0 damage, negative damage, damage > max health)

### Debugging AI Behavior

**Scenario**: Debugging an AI state machine

1. Select the AI GameObject
2. Use `SetState(AIState newState)` to force specific states
3. Call `GetCurrentTarget()` to inspect AI decision-making
4. Use `DebugDrawPath()` to visualize pathfinding
5. Monitor performance with `GetProcessingTime()`

### Level Design Iteration

**Scenario**: Adjusting gameplay parameters

1. Select your GameManager
2. Use `SetDifficulty(float multiplier)` to test balance
3. Call `SpawnWave(int enemyCount, EnemyType type)` for testing
4. Use `GetPlayerStats()` to monitor progression
5. Quickly iterate without restarting the scene

## Best Practices

### Organization
- **Pin Important Methods**: Right-click methods you use frequently
- **Use Search**: Filter methods quickly during debugging sessions
- **Group Related Methods**: Use favorites to create custom workflows

### Performance
- **Monitor Execution Times**: Watch for performance bottlenecks
- **Batch Operations**: Use Execute All for related method chains
- **Profile Results**: Use the built-in timing for optimization

### Safety
- **Test in Play Mode**: Most testing should happen during runtime
- **Backup Before Experiments**: Save scenes before major testing sessions
- **Validate Parameters**: Double-check parameter values before execution

## What's Next?

Ready to explore more advanced capabilities?

- [Advanced Features]({% link docs/advanced-features.md %}) - Custom inspectors, batch operations, and scripting
- [API Reference]({% link docs/api.md %}) - Complete technical documentation
- [Use Cases]({% link docs/use-cases.md %}) - Real-world implementation examples
- [Troubleshooting]({% link docs/troubleshooting.md %}) - Solutions to common issues
