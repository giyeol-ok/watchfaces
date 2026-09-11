plugins {
    alias(libs.plugins.android.application)
}

android {
    namespace = "com.giyeol.rolexdeepsea"
    compileSdk = 33

    defaultConfig {
        applicationId = "com.giyeol.rolexdeepsea"
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
