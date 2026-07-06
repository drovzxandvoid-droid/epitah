# Building Epitah (Clumps)

Your mod project is correctly configured! The mod will appear as **"Clumps"** in the mod menu with the green XP orb icon.

## Build Issue

The environment has Gradle 9.4 which removed an API that Fabric Loom depends on. To build locally, you need Gradle 8.x.

## Solution Options

### Option 1: Use GitHub Actions (Recommended)

This will build automatically without local setup:

```bash
git add .
git commit -m "Initial Clumps mod setup"
git push
```

Then create a GitHub Actions workflow (create `.github/workflows/build.yml`).

### Option 2: Build Locally with Gradle 8.8

```bash
# Install Gradle 8.8 manually or use sdkman
sdk install gradle 8.8.1
gradle clean build

# Or use the gradle wrapper (once set up properly)
./gradlew clean build
```

### Option 3: Use Docker

```bash
docker run --rm -v /workspaces/epitah:/workspace -w /workspace gradle:8.8 gradle clean build
```

## Project Structure

✅ Mod ID: `epitah`
✅ Display Name: **Clumps**
✅ Description: Clumps xp orbs together.
✅ Icon: Green XP orb (assets/epitah/icon.png)
✅ Minecraft: 1.20.1
✅ Fabric API: 0.90.0+1.20.1

## Files

- `build.gradle` - Gradle build configuration
- `gradle.properties` - Project properties
- `src/main/resources/fabric.mod.json` - Mod metadata
- `src/main/java/com/epitah/EpitahModMain.java` - Main mod class
- `src/main/resources/assets/epitah/icon.png` - Mod icon
