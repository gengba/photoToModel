import QtQuick 2.7 as QQ2
import Qt3D.Core 2.1
import Qt3D.Render 2.1
import Qt3D.Extras 2.1
import Qt3D.Input 2.1


Entity {
    id: sceneRoot

    // 相机参数设定
    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        nearPlane: 0.1
        farPlane: 1000.0
        position: Qt.vector3d(0.0, 0.0, 40.0)
        upVector: Qt.vector3d(0.0, 1.0, 0.0)
        viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
    }

    FirstPersonCameraController { camera: camera }

    components: [
        // 指定渲染策略和拾取设置, RenderSettings部件必须被设置为场景根实体的部件
        RenderSettings {
            activeFrameGraph: ForwardRenderer {
                camera: camera
                clearColor: "transparent"
            }
        },
        InputSettings {}
    ]
    // 提供冯氏光线效果的默认实现
    PhongMaterial {
        id: material
    }
    // 环形
    TorusMesh {
        id: torusMesh
        radius: 5
        minorRadius: 1
        rings: 100
        slices: 20
    }
    Transform {
        id: torusTransform
        scale3D: Qt.vector3d(1.5, 1, 0.5)
        rotation: fromAxisAndAngle(Qt.vector3d(1, 0, 0), 45)
    }
    Entity {
        id: torusEntity
        components: [torusMesh, material, torusTransform]
    }
    // 球形
    SphereMesh {
        id: sphereMesh
        radius: 3
    }
    Transform {
        id: sphereTransform
        property real userAngle: 0.0
        matrix: {
            var m = Qt.matrix4x4();
            m.rotate(userAngle, Qt.vector3d(0, 1, 0))
            m.translate(Qt.vector3d(20, 0, 0));
            return m;
        }
    }
    // 动画
    QQ2.NumberAnimation {
        target: sphereTransform
        property: "userAngle"
        duration: 10000
        from: 0
        to: 360

        loops: QQ2.Animation.Infinite
        running: true
    }

    Entity {
        id: sphereEntity
        components: [sphereMesh, material, sphereTransform]
    }
}
