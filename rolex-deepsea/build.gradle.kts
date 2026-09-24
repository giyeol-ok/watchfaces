plugins {
    alias(libs.plugins.android.application)
}

android {
    namespace = "com.giyeol.rolexdeepsea"
    compileSdk = 33

    signingConfigs {
        getByName("debug") {
            storeFile = rootProject.file("debug.keystore")
            storePassword = "android"
            keyAlias = "androiddebugkey"
            keyPassword = "android"
        }
    }

    defaultConfig {
        applicationId = "com.giyeol.rolexdeepsea"
        minSdk = 33
        targetSdk = 33
        // Auto-incrementing so every build (same signing key) installs as an
        // update over whatever is already on the watch, no uninstall needed.
        versionCode = (System.currentTimeMillis() / 60000L).toInt()
        versionName = "0.1.0"
    }

    buildTypes {
        debug {
            isMinifyEnabled = true
        }
        release {
            // TODO:Add your signingConfig here to build release builds
            isMinifyEnabled = true
            isShrinkResources = false

            signingConfig = signingConfigs.getByName("debug")
        }
    }
}
