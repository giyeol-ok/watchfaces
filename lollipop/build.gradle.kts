plugins {
    alias(libs.plugins.android.application)
}

android {
    namespace = "com.giyeol.lollipop"
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
        applicationId = "com.giyeol.lollipop"
        minSdk = 33
        targetSdk = 33
        versionCode = 1
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
