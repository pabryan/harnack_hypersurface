︠79c3405f-3af0-4bfc-8211-112e6ad8e81es︠
var('x,y,z')

norm = (-z^2 + x^2 + y^2).function(x, y, z)
cm = colormaps.gist_rainbow
cm_func = (z).function(x,y,z)

hyperbolic = implicit_plot3d(norm, (x, -5, 5), (y, -5, 5), (z, 0, 8), contour=-1, color=(cm_func, cm))
hyperbolic_geodesic_sphere = parametric_plot3d([lambda u: 3 * sin(u) , lambda u: 3 * cos(u), lambda u: sqrt(10)], (0, 2*pi), color="red", thickness=3)
show(hyperbolic_geodesic_sphere + hyperbolic)
︡539f08ec-2959-466f-9ac4-e9531bdc86fe︡{"stdout":"(x, y, z)\n"}︡{"file":{"filename":"857a0efd-6c46-436a-9ba8-6e16c2d02365.sage3d","uuid":"857a0efd-6c46-436a-9ba8-6e16c2d02365"}}︡{"done":true}︡
︠b8cb837d-fde2-4618-8629-4aa9d3d4377fs︠
desitter = implicit_plot3d(norm, (x, -5, 5), (y, -5, 5), (z, -5, 5), contour=1, region=lambda x,y,z: x^2 + y^2 >=1)
desitter_geodesic_sphere = parametric_plot3d([lambda u: 3 * sin(u) , lambda u: 3 * cos(u), lambda u: sqrt(8)], (0, 2*pi), color="red", thickness=3)
show(desitter + desitter_geodesic_sphere)
︡e81c7387-ae2b-417b-8c61-b6e01f4fa815︡{"file":{"filename":"3d247a95-69af-479a-af18-9be0727f9d75.sage3d","uuid":"3d247a95-69af-479a-af18-9be0727f9d75"}}︡{"done":true}︡









