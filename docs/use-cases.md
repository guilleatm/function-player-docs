---
title: Use Cases
layout: default
nav_order: 5
---

# Use Cases & Examples

Real-world examples of how Function Player can improve your Unity development workflow.

## Game Development Scenarios

### 1. Combat System Testing

**Challenge**: Testing a complex combat system with different weapon types, damage calculations, and character stats.

**Solution with Function Player**:

```csharp
public class CombatSystem : MonoBehaviour
{
    [Header("Combat Stats")]
    public float baseHealth = 100f;
    public float currentHealth;
    public float armor = 10f;
    
    [FunctionPlayerCategory("Combat")]
    public void TakeDamage(float damage, DamageType type = DamageType.Physical)
    {
        float finalDamage = CalculateDamage(damage, type);
        currentHealth = Mathf.Max(0, currentHealth - finalDamage);
        Debug.Log($"Took {finalDamage:F1} {type} damage. Health: {currentHealth:F1}");
    }
    
    [FunctionPlayerCategory("Combat")]
    public void Heal(float amount)
    {
        currentHealth = Mathf.Min(baseHealth, currentHealth + amount);
        Debug.Log($"Healed {amount:F1}. Health: {currentHealth:F1}");
    }
    
    [FunctionPlayerCategory("Debug")]
    public void SetHealth(float health)
    {
        currentHealth = Mathf.Clamp(health, 0, baseHealth);
    }
    
    private float CalculateDamage(float baseDamage, DamageType type)
    {
        float multiplier = type == DamageType.Magic ? 1f : (100f / (100f + armor));
        return baseDamage * multiplier;
    }
}
```

**Testing Workflow**:
1. Set different health values with `SetHealth()`
2. Test various damage amounts with `TakeDamage()`
3. Try different damage types (Physical vs Magic)
4. Test healing with `Heal()`
5. Verify edge cases (overkill damage, full health healing)

### 2. AI Behavior Debugging

**Challenge**: Debugging an AI system that makes complex decisions based on multiple factors.

**Solution**:

```csharp
public class AIController : MonoBehaviour
{
    public AIState currentState;
    public Transform target;
    public float detectionRange = 10f;
    public float attackRange = 2f;
    
    [FunctionPlayerCategory("AI Debug")]
    [FunctionPlayerDescription("Force the AI into a specific state")]
    public void SetState(AIState newState)
    {
        currentState = newState;
        Debug.Log($"AI forced to state: {newState}");
    }
    
    [FunctionPlayerCategory("AI Debug")]
    public Transform GetCurrentTarget()
    {
        return target;
    }
    
    [FunctionPlayerCategory("AI Debug")]
    public float GetDistanceToTarget()
    {
        return target ? Vector3.Distance(transform.position, target.position) : float.MaxValue;
    }
    
    [FunctionPlayerCategory("AI Debug")]
    public void ForceTargetAcquisition(Transform newTarget)
    {
        target = newTarget;
        Debug.Log($"AI now targeting: {newTarget?.name ?? "None"}");
    }
    
    [FunctionPlayerCategory("AI Visualization")]
    [FunctionPlayerVisualDebug]
    public void ShowDetectionRange()
    {
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(transform.position, detectionRange);
    }
}
```

**Debugging Benefits**:
- Force specific AI states to test transitions
- Monitor target selection logic
- Visualize detection ranges
- Test pathfinding with different targets

### 3. Level Design Iteration

**Challenge**: Rapidly testing different level configurations and gameplay parameters.

**Solution**:

```csharp
public class LevelManager : MonoBehaviour
{
    [Header("Level Configuration")]
    public int maxEnemies = 10;
    public float spawnRate = 2f;
    public float difficultyMultiplier = 1f;
    
    [FunctionPlayerCategory("Level Testing")]
    public void SpawnEnemyWave(int count, EnemyType type)
    {
        for (int i = 0; i < count; i++)
        {
            SpawnEnemy(type);
        }
        Debug.Log($"Spawned {count} {type} enemies");
    }
    
    [FunctionPlayerCategory("Level Testing")]
    public void SetDifficulty([FunctionPlayerParameterRange(0.5f, 3f)] float multiplier)
    {
        difficultyMultiplier = multiplier;
        Debug.Log($"Difficulty set to {multiplier:F1}x");
        UpdateExistingEnemies();
    }
    
    [FunctionPlayerCategory("Level Testing")]
    public void ClearAllEnemies()
    {
        var enemies = FindObjectsOfType<Enemy>();
        foreach (var enemy in enemies)
        {
            DestroyImmediate(enemy.gameObject);
        }
        Debug.Log($"Cleared {enemies.Length} enemies");
    }
    
    [FunctionPlayerCategory("Analytics")]
    public LevelStats GetCurrentStats()
    {
        return new LevelStats
        {
            activeEnemies = FindObjectsOfType<Enemy>().Length,
            currentDifficulty = difficultyMultiplier,
            playerScore = GameManager.Instance.Score
        };
    }
}
```

## Technical Development Scenarios

### 4. Performance Optimization

**Challenge**: Identifying performance bottlenecks in complex systems.

**Solution**:

```csharp
public class PerformanceTester : MonoBehaviour
{
    [FunctionPlayerCategory("Performance")]
    [FunctionPlayerProfileMemory]
    public void StressTestObjectPooling(int objectCount)
    {
        var stopwatch = System.Diagnostics.Stopwatch.StartNew();
        
        for (int i = 0; i < objectCount; i++)
        {
            var obj = ObjectPool.Instance.Get<PooledObject>();
            ObjectPool.Instance.Return(obj);
        }
        
        stopwatch.Stop();
        Debug.Log($"Pooled {objectCount} objects in {stopwatch.ElapsedMilliseconds}ms");
    }
    
    [FunctionPlayerCategory("Performance")]
    public void BenchmarkPathfinding(Vector3 start, Vector3 end, int iterations)
    {
        var times = new List<float>();
        
        for (int i = 0; i < iterations; i++)
        {
            var sw = System.Diagnostics.Stopwatch.StartNew();
            PathfindingSystem.FindPath(start, end);
            sw.Stop();
            times.Add(sw.ElapsedMilliseconds);
        }
        
        Debug.Log($"Pathfinding avg: {times.Average():F2}ms, min: {times.Min():F2}ms, max: {times.Max():F2}ms");
    }
}
```

### 5. Data Validation and Testing

**Challenge**: Validating game data and configurations.

**Solution**:

```csharp
public class DataValidator : MonoBehaviour
{
    [FunctionPlayerCategory("Data Validation")]
    public ValidationResult ValidateWeaponData(WeaponData weapon)
    {
        var result = new ValidationResult();
        
        if (weapon.damage <= 0)
            result.AddError("Damage must be positive");
            
        if (weapon.fireRate <= 0)
            result.AddError("Fire rate must be positive");
            
        if (string.IsNullOrEmpty(weapon.name))
            result.AddError("Weapon name cannot be empty");
            
        return result;
    }
    
    [FunctionPlayerCategory("Data Validation")]
    public void ValidateAllWeapons()
    {
        var weapons = Resources.LoadAll<WeaponData>("Weapons");
        int errorCount = 0;
        
        foreach (var weapon in weapons)
        {
            var result = ValidateWeaponData(weapon);
            if (!result.IsValid)
            {
                Debug.LogError($"Weapon '{weapon.name}' has errors: {result.ErrorSummary}");
                errorCount++;
            }
        }
        
        Debug.Log($"Validation complete. {errorCount} weapons with errors out of {weapons.Length}");
    }
}
```

## Asset Creation Workflows

### 6. Procedural Content Generation

**Challenge**: Testing and iterating on procedural generation algorithms.

**Solution**:

```csharp
public class ProceduralGenerator : MonoBehaviour
{
    [FunctionPlayerCategory("Generation")]
    public void GenerateDungeon([FunctionPlayerParameterRange(5, 50)] int roomCount, 
                               [FunctionPlayerParameterRange(1f, 5f)] float complexity)
    {
        ClearExistingDungeon();
        
        var dungeon = DungeonGenerator.Generate(roomCount, complexity);
        InstantiateDungeon(dungeon);
        
        Debug.Log($"Generated dungeon with {dungeon.Rooms.Count} rooms");
    }
    
    [FunctionPlayerCategory("Generation")]
    public void GenerateTerrain(int width, int height, float scale, float heightMultiplier)
    {
        var heightmap = NoiseGenerator.GenerateHeightmap(width, height, scale);
        ApplyHeightmapToTerrain(heightmap, heightMultiplier);
        
        Debug.Log($"Generated {width}x{height} terrain");
    }
    
    [FunctionPlayerCategory("Generation")]
    public void SaveCurrentGeneration(string fileName)
    {
        // Save current procedural content as prefab
        var result = PrefabUtility.SaveAsPrefabAsset(gameObject, $"Assets/Generated/{fileName}.prefab");
        Debug.Log($"Saved generation as {result.name}");
    }
}
```

### 7. Animation System Testing

**Challenge**: Testing complex animation systems and state machines.

**Solution**:

```csharp
public class AnimationTester : MonoBehaviour
{
    private Animator animator;
    
    void Start()
    {
        animator = GetComponent<Animator>();
    }
    
    [FunctionPlayerCategory("Animation")]
    public void TriggerAnimation(string triggerName)
    {
        animator.SetTrigger(triggerName);
        Debug.Log($"Triggered animation: {triggerName}");
    }
    
    [FunctionPlayerCategory("Animation")]
    public void SetAnimationParameter(string paramName, float value)
    {
        animator.SetFloat(paramName, value);
        Debug.Log($"Set {paramName} to {value}");
    }
    
    [FunctionPlayerCategory("Animation")]
    public void SetAnimationSpeed([FunctionPlayerParameterRange(0f, 3f)] float speed)
    {
        animator.speed = speed;
        Debug.Log($"Animation speed set to {speed}x");
    }
    
    [FunctionPlayerCategory("Animation Debug")]
    public AnimatorStateInfo GetCurrentState()
    {
        return animator.GetCurrentAnimatorStateInfo(0);
    }
}
```

## Best Practices from Real Projects

### Organizing Methods by Workflow

Group related methods using categories:

```csharp
[FunctionPlayerCategory("Setup")]      // Initial configuration
[FunctionPlayerCategory("Testing")]    // Active testing methods
[FunctionPlayerCategory("Debug")]      // Debug utilities
[FunctionPlayerCategory("Cleanup")]    // Reset/cleanup methods
```

### Parameter Validation

Always validate parameters to prevent crashes:

```csharp
public void SpawnEnemies(int count)
{
    if (count < 0 || count > 1000)
    {
        Debug.LogError($"Invalid enemy count: {count}");
        return;
    }
    // ... spawn logic
}
```

### Documentation in Code

Use descriptions for complex methods:

```csharp
[FunctionPlayerDescription("Spawns enemies in a circle around the player. Radius affects difficulty.")]
public void SpawnEnemyCircle(int count, float radius)
{
    // Implementation
}
```

---

These examples show how Function Player can streamline development across different aspects of game creation. The key is identifying repetitive testing tasks and creating dedicated methods to handle them efficiently.

**Next Steps**: Explore the [Advanced Features]({% link docs/advanced-features.md %}) to learn about custom inspectors, batch operations, and automation capabilities.
