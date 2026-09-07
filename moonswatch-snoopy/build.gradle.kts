plugins {
    alias(libs.plugins.android.application)
}

android {
    namespace = "com.giyeol.moonwatch"
    compileSdk = 33

    defaultConfig {
        applicationId = "com.giyeol.moonwatch"
        minSdk = 33
        targetSdk = 33
        versionCode = 5
        versionName = "1.3.0"
    }

    buildTypes {
        debug {
            isMinifyEnabled = true
        }
        release {
            // TODO:Add your signingConfig here to build release builds
            isMinifyEnabled = true
            // Ensure shrink resources is false, to avoid potential for them
            // being removed.
            isShrinkResources = false

            signingConfig = signingConfigs.getByName("debug")
        }
    }
}
