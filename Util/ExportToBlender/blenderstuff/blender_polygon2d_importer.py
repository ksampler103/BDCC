import bpy
from pathlib import Path
import json

#mydata = '{"verts":[[-5.17241,247.845001],[0,210.776001],[13.7931,197.845001],[33.189701,194.828003],[44.827599,183.621002],[59.051701,154.309998],[60.344799,132.759003],[42.241402,82.327599],[7.32759,13.3621],[70.689697,-12.5],[134.914001,41.379299],[133.190002,134.483002],[120.259003,162.5],[105.602997,200.862],[96.120697,237.5],[73.275902,253.016998],[37.931,252.585999],[20,230],[31.6667,225],[53.333302,224],[66,206.667007],[72,193],[83.666702,158.332993],[94.333298,133.667007],[86,82.666702],[70.666702,38.666698]],"faces":[[17,16,0],[17,1,0],[17,2,1],[17,18,2],[17,16,18],[15,16,19],[18,16,19],[18,3,19],[18,2,3],[14,20,19,15],[20,4,19],[3,19,4],[20,21,5,4],[20,14,13,21],[13,12,22,21],[22,6,5,21],[22,23,11,12],[23,24,10,11],[23,6,22],[23,24,7,6],[24,25,10],[25,9,10],[25,8,9],[25,7,8],[25,7,24]],"globalpos":[-47.2887,153.477997]}'
#mydata = '{"verts":[[248.957993,136.457993],[280.208008,163.542007],[313.541992,191.667007],[350,221.875],[391.666992,255.207993],[432.291992,286.458008],[477.083008,327.083008],[512.5,365.625],[559.375,410.416992],[606.25,450],[661.458008,494.791992],[716.666992,526.041992],[765.625,536.458008],[803.125,503.125],[797.916992,444.791992],[760.416992,388.541992],[696.875,348.958008],[630.208008,333.333008],[580.208008,293.75],[535.416992,251.042007],[483.333008,204.167007],[438.541992,154.167007],[386.458008,104.167],[342.708008,58.333302],[296.875,20.8333],[243.75,-18.75],[291.588989,96.261703],[324.299011,123.363998],[364.485992,162.617004],[416.821991,208.410995],[457.944,248.598007],[506.541992,287.850006],[549.53302,326.167999],[602.804016,371.028015],[637.414978,395.238007],[704.672974,435.514008],[732.710022,461.682007]],"faces":[[0,26,25],[1,26,0],[24,26,25],[27,26,1,2],[27,28,3,2],[27,23,22,28],[27,26,24,23],[3,4,29,28],[5,4,29,30],[6,5,30,31],[6,7,32,31],[8,7,32,33],[8,9,34,33],[10,35,34,9],[35,36,11,10],[12,36,11],[13,36,12],[14,36,13],[14,15,35,36],[16,34,35,15],[16,34,33,17],[32,18,17,33],[32,18,19,31],[19,20,30,31],[20,21,29,30],[21,22,28,29]],"globalpos":[-228.080002,-98.7808]}'
#mydata = '{"verts":[[119.328003,197.479004],[93.277298,78.9916],[136.975006,115.966003],[156.302994,131.091995],[182.352997,152.100998],[210.923996,176.470993],[243.697006,206.723007],[277.311005,239.496002],[317.647003,273.950012],[356.302002,312.605011],[392.437012,344.537994],[434.45401,389.075989],[410.924011,411.765015],[381.513,432.77301],[339.496002,386.554993],[301.681,348.739014],[263.024994,314.286011],[221.848999,277.311005],[184.873993,239.496002],[160.503998,216.807007],[144.537994,204.201996],[130.251999,198.319],[136.735001,155.781998],[154.421997,170.748001],[174.830002,192.516998],[204.082001,215.645996],[248.298996,252.380997],[290.476013,290.476013],[331.972992,329.932007],[368.027008,365.985992]],"faces":[[13,12,29,14],[12,11,10,29],[10,9,28,29],[9,8,27,28],[8,7,26,27],[7,6,25,26],[6,5,24,25],[5,4,23,24],[4,3,22,23],[3,2,22],[15,14,29,28],[15,16,27,28],[16,17,26,27],[17,18,25,26],[18,19,24,25],[19,20,23,24],[20,21,22,23],[21,0,1,2,22]],"globalpos":[-70.794899,-190.638],"texturew":512,"textureh":512}'
#mydata = '{"verts":[[104.245003,245.283005],[93.277298,78.9916],[136.975006,115.966003],[156.302994,131.091995],[182.352997,152.100998],[210.923996,176.470993],[243.697006,206.723007],[271.697998,232.074997],[313.678986,269.811005],[351.415009,310.848999],[392.437012,344.537994],[434.45401,389.075989],[410.924011,411.765015],[381.513,432.77301],[319.811005,401.415009],[275,373.584991],[242.925003,342.453003],[195.755005,303.773987],[169.339996,280.660004],[154.244995,271.697998],[137.735992,259.43399],[118.396004,249.057007],[133.490997,163.207993],[151.886993,182.546997],[172.169998,200.942993],[201.414993,226.886993],[241.037994,263.678986],[283.962006,299.528015],[327.358002,333.490997],[368.027008,365.985992]],"faces":[[13,12,29,14],[12,11,10,29],[10,9,28,29],[9,8,27,28],[8,7,26,27],[7,6,25,26],[6,5,24,25],[5,4,23,24],[4,3,22,23],[3,2,22],[15,14,29,28],[15,16,27,28],[16,17,26,27],[17,18,25,26],[18,19,24,25],[19,20,23,24],[20,21,22,23],[21,0,1,2,22]],"globalpos":[-85.491898,-206.302002],"texturew":512,"textureh":512}'
mydata = '{"verts":[[49.771702,41.552502],[61.187199,49.771702],[74.885803,57.534302],[87.671204,67.579903],[98.630096,77.1689],[110.501999,85.3881],[121.917999,94.977203],[137.442993,104.566002],[151.141998,114.612],[165.753006,126.941002],[177.169006,138.813004],[190.867996,152.968002],[202.740005,167.123001],[215.524994,181.735001],[192.694,202.283005],[167.123001,221.005005],[147.488998,205.022995],[134.703003,193.606995],[122.374001,182.192001],[110.501999,170.320007],[98.1735,157.990997],[81.278503,142.921997],[66.666702,131.050003],[52.967999,119.178001],[62.557098,91.7808],[78.538803,102.739998],[95.890404,114.154999],[109.132004,126.484001],[123.744003,136.072998],[133.789993,146.574997],[144.292007,155.251007],[153.880997,163.470001],[167.123001,176.255997],[177.169006,185.845001],[183.561996,193.606995]],"faces":[[23,24,0],[23,24,22],[24,1,0],[2,24,1],[25,2,24],[25,3,2],[25,4,3],[25,26,4],[4,26,5],[26,6,5],[26,6,27],[27,7,6],[28,7,27],[28,8,7],[29,8,28],[29,9,8],[30,9,29],[31,9,30],[31,10,9],[31,11,10],[32,11,31],[33,11,32],[33,12,11],[34,12,33],[34,13,12],[34,14,13],[34,15,14],[34,16,15],[33,16,34],[32,16,33],[17,32,16],[17,31,32],[18,31,17],[18,30,31],[18,30,19],[19,29,30],[20,29,19],[20,28,29],[20,27,28],[21,27,20],[21,26,27],[22,25,24],[25,21,26],[25,22,21]],"globalpos":[-25.921301,-137.033997],"texturew":256,"textureh":256}'
textureW = 1024.0#128.0
textureH = 512.0#256.0

j=json.loads(mydata) 
textureW = j["texturew"]#1024.0#128.0
textureH = j["textureh"]#512.0#256.0

print(j)

verts = [
         ]  # 4 verts made with XYZ coords
edges = []
faces = []

posshift = j["globalpos"]
posshift[0] = posshift[0] / 100.0
posshift[1] = -posshift[1] / 100.0

for vert in j["verts"]:
    verts.append( (vert[0] / 100.0 + posshift[0], 0.0, -vert[1] / 100.0 + posshift[1]) )

faces = j["faces"]

mesh = bpy.data.meshes.new("myBeautifulMesh")  # add the new mesh
obj = bpy.data.objects.new(mesh.name, mesh)
col = bpy.data.collections.get("Collection")
col.objects.link(obj)
bpy.context.view_layer.objects.active = obj
mesh.from_pydata(verts, edges, faces)

me = obj.data
uvlayer = me.uv_layers.new() # default naem and do_init

me.uv_layers.active = uvlayer

for face in me.polygons:
    for vert_idx, loop_idx in zip(face.vertices, face.loop_indices):
        uvlayer.data[loop_idx].uv = (j["verts"][vert_idx][0] / textureW, 1.0 - j["verts"][vert_idx][1] / textureH)