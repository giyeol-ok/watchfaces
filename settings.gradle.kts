pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "Watchfaces"

// Each top-level directory containing its own build.gradle.kts is a watch
// face module. Add a new watch face by creating a new directory with a
// build.gradle.kts and an src/main - no change needed here.
rootDir.listFiles { file -> file.isDirectory && File(file, "build.gradle.kts").exists() }
    ?.sortedBy { it.name }
    ?.forEach { moduleDir ->
        include(":${moduleDir.name}")
        project(":${moduleDir.name}").projectDir = moduleDir
    }
