import QtQuick 2.7
import Qt3D.Core 2.1
import Qt3D.Render 2.1
import Qt3D.Extras 2.1
// import QtQml.Models 2.2
import Qt3D.Input 2.1


Entity {
    id: rootEntity

    // 相机参数设定
    Camera {
        id: mainCamera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        nearPlane: 0.01
        farPlane: 1000.0
        position: Qt.vector3d(24.0, 25.0, -20.0)
        upVector: Qt.vector3d(0.0, 1.0, 0.0)
        viewCenter: Qt.vector3d(0.0, 0.0, 0.0)

        Entity {
            components: [
                PointLight {
                    color: "white"
                }
            ]
        }
    }

    FirstPersonCameraController { camera: mainCamera }

    components: [
        // 指定渲染策略和拾取设置, RenderSettings部件必须被设置为场景根实体的部件
        RenderSettings {
            activeFrameGraph: ForwardRenderer {
                camera: mainCamera
                clearColor: "transparent"
            }
        },
        InputSettings {}
    ]

    Grid3D { enabled: true }
}
