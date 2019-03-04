import QtQuick 2.7
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

// Grid
Entity {
    id: gridEntity
    components: [
        GeometryRenderer {
            primitiveType: GeometryRenderer.Lines
            geometry: Geometry {
                Attribute {
                    id: gridPosition
                    attributeType: Attribute.VertexAttribute
                    vertexBaseType: Attribute.Float
                    vertexSize: 3
                    count: 0
                    name: defaultPositionAttributeName
                    buffer: Buffer {
                        type: Buffer.VertexBuffer // 顶点缓冲区
                        data: {
                            function buildGrid(first, last, offset, attribute) {
                                var vertexCount = (((last - first) / offset) + 1) * 7;
                                var f32a = new Float32Array(vertexCount * 2);
                                for(var id = 0, i = first; i <= last; i += offset, id++){
                                    f32a[12*id] = i;
                                    f32a[12*id+1] = 0.0;
                                    f32a[12*id+2] = first;

                                    f32a[12*id+3] = i;
                                    f32a[12*id+4] = 0.0;
                                    f32a[12*id+5] = last;

                                    f32a[12*id+6] = first;
                                    f32a[12*id+7] = 0.0;
                                    f32a[12*id+8] = i;

                                    f32a[12*id+9] = last;
                                    f32a[12*id+10] = 0.0;
                                    f32a[12*id+11] = i;

                                    f32a[12*id+12] = i;
                                    f32a[12*id+13] = 0.0;
                                }
                                attribute.count = vertexCount;
                                return f32a;
                            }
                            return buildGrid(-14, 14, 1, gridPosition);
                        }
                    }
                }
            }
        },
        PhongMaterial {
            ambient: "#FFF"
            diffuse: "#222"
            specular: diffuse
            shininess: 0
        }
    ]
}
