allprojects {
    repositories {
        google()
        mavenCentral()
    }
//    dependencies {
//        classpath 'com.android.tools.build:gradle:8.10.2';
//        classpath 'org.jetbrains.kotlin:kotlin-gradle-plugin:1.5.31'
//    }

}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}


tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
