︠a27bfa6b-b611-42a8-a05e-3c235d1024cds︠
u, phi = var('u,phi')

phimin=0
phimax=2*pi

# Parametrise one-sheeted Hyperboloid over z-coordinate and angle
h_umin = 0
h_umax = 5

h_r0 = 1 # Radius
h_r(u) = sqrt((u + h_r0)^2 - h_r0^2)
h_rp(u) = h_r.diff(u)

h(u, phi) = [h_r(u) * cos(phi), h_r(u) * sin(phi), u+h_r0]

# Coordinate Curves
def h_ucurve(phi0):
    return h.subs(phi == phi0)

def h_phicurve(u0):
    return h.subs(u == u0)

# Coordinate tangents
hu = h.diff(u)
hphi = h.diff(phi)

# Normal in ambient Minkowski space
h_norm_normal(u, phi) = (h_rp(u)^2 - h_r0^2)^(-1/2)
h_normal(u, phi) =  [h_norm_normal(u, phi) * cos(phi), h_norm_normal(u, phi) * sin(phi), h_norm_normal(u, phi) * h_rp(u)]

# Plot one-sheeted hyperboloid
def cf(u,phi): return sin(phi+u)^2
hyperbolic = parametric_plot3d(h, [u, h_umin, h_umax], [phi, phimin, phimax], opacity=0.2, color=(cf, colormaps.rainbow))
hyperbolic = parametric_plot3d(h, [u, h_umin, h_umax], [phi, phimin, phimax], opacity=0.2)


# Draw mesh of u and phi coordinate curves
hyperbolic_mesh = Graphics()

# u coordinate
u_n = 15

ustep = (1/u_n) * (phimax/2-phimin)
upoints = [phimin + ustep * i for i in range(u_n+1)]

u_curves = Graphics()
for phi0 in upoints:
    u_curves += parametric_plot3d(h_ucurve(phi0), (u, h_umin, h_umax), color="gray")
    u_curves += parametric_plot3d(h_ucurve(phimax-phi0), (u, h_umin, h_umax), color="gray")

hyperbolic_mesh += u_curves

#phi coordinate
phi_n = 10

phistep = (1/phi_n) * (h_umax-h_umin)
phipoints = [h_umin + phistep * i for i in range(phi_n+1)]

phi_curves = Graphics()
for u0 in phipoints: phi_curves += parametric_plot3d(h_phicurve(u0), (phi, phimin, phimax), color="gray")

hyperbolic_mesh += phi_curves

h_plot = hyperbolic + hyperbolic_mesh
h_plot.show(aspect_ratio=(1,1,1), frame=False)
︡0651417b-070f-48bd-be6f-d9ce57bd1790︡{"file":{"filename":"8e6d1a82-b7ed-4ec9-b676-b323ac3453ab.sage3d","uuid":"8e6d1a82-b7ed-4ec9-b676-b323ac3453ab"}}︡{"done":true}︡
︠04c27a70-d584-4437-a4e8-14dad7f22a37s︠
# Parametrise de Sitter over z-coordinate and angle
d_umin = -8
d_umax = 8

d_r0 = 1 # Radius
d_r(u) = sqrt(u^2 + d_r0^2)
d_rp(u) = d_r.diff(u)

d(u, phi) = [d_r(u) * cos(phi), d_r(u) * sin(phi), u]

# Coordinate Curves
def d_ucurve(phi0):
    return d.subs(phi == phi0)

def d_phicurve(u0):
    return d.subs(u == u0)

# Coordinate tangents
du = d.diff(u)
dphi = d.diff(phi)

# Normal in ambient Minkowski space
d_norm_normal(u, phi) = (d_rp(u)^2 - d_r0^2)^(-1/2)
d_normal(u, phi) =  [d_norm_normal(u, phi) * cos(phi), d_norm_normal(u, phi) * sin(phi), d_norm_normal(u, phi) * d_rp(u)]

# Plot de Sitter
def cf(u,phi): return sin(phi+u)^2
deSitter = parametric_plot3d(d, [u, d_umin, d_umax], [phi, phimin, phimax], opacity=0.2, color=(cf, colormaps.rainbow))
deSitter = parametric_plot3d(d, [u, d_umin, d_umax], [phi, phimin, phimax], opacity=0.2)

# Draw mesh of u and phi coordinate curves
deSitter_mesh = Graphics()

# u coordinate
u_n = 15

ustep = (1/u_n) * (phimax/2-phimin)
upoints = [phimin + ustep * i for i in range(u_n+1)]

u_curves = Graphics()
for phi0 in upoints:
    u_curves += parametric_plot3d(d_ucurve(phi0), (u, d_umin, d_umax), color="gray")
    u_curves += parametric_plot3d(d_ucurve(phimax-phi0), (u, d_umin, d_umax), color="gray")

deSitter_mesh += u_curves

#phi coordinate
phi_n = 10

phistep = (1/phi_n) * (d_umax-d_umin)
phipoints = [d_umin + phistep * i for i in range(phi_n+1)]

phi_curves = Graphics()
for u0 in phipoints: phi_curves += parametric_plot3d(d_phicurve(u0), (phi, phimin, phimax), color="gray")

deSitter_mesh += phi_curves

d_plot = deSitter + deSitter_mesh
d_plot.show(aspect_ratio=(1,1,1), frame=False)
︡eef7a45a-2d48-477b-b2fe-5db358e8bec1︡{"file":{"filename":"17a190be-d2db-49b9-b64d-660ee2431e48.sage3d","uuid":"17a190be-d2db-49b9-b64d-660ee2431e48"}}︡{"done":true}︡
︠83e4468e-8f76-4369-a0e5-e8780747d505s︠

# Plot some geodesic spheres in Hyperbolic space with normals
hyperbolic_spheres = Graphics()
gaussmap_hyperbolic_spheres = Graphics()

# Partition points for tangents
n = 10
start = phimin
end = phimax
step = (1/n) * (end - start)
points = [start + step * i for i in range(n+1)]

for sphere in [[2, 'red', '--', 0], [4, 'blue', ':', step/2]]:
    u0 = sphere[0]
    colour = sphere[1]
    linestyle = sphere[2]
    phase = sphere[3]

    hyperbolic_spheres += parametric_plot3d(h_phicurve(u0), (phi, phimin, phimax), color=colour, thickness=2, linestyle=linestyle)
    gaussmap_hyperbolic_spheres += parametric_plot3d(h_phicurve(u0) + hu(u=u0, phi=phi), (phi, phimin, phimax), color=colour, thickness=2, linestyle=linestyle)

    # Draw tangents along geodesic sphere
    curve_points = [(h_phicurve(u0))(phi=t+phase) for t in points]

    hyperbolic_field_u = [hu(u=u0, phi=t+phase) for t in points]
    hyperbolic_field_phi = [hphi(u=u0, phi=t+phase) for t in points]
    hyperbolic_field_normal = [h_normal(u=u0, phi=t+phase) for t in points]

    for i in range(n+1):
        hyperbolic_spheres += arrow3d(curve_points[i], curve_points[i] + hyperbolic_field_u[i], color=colour, width=2, linestyle=linestyle)
        gaussmap_hyperbolic_spheres += arrow3d([0,0,0], curve_points[i] + hyperbolic_field_u[i], color=colour, width=2, linestyle=linestyle)
        #hyperbolic += arrow3d(curve_points[i], curve_points[i] + hyperbolic_field_phi[i], color="black", width=2)
        #hyperbolic += arrow3d(curve_points[i], curve_points[i] + hyperbolic_field_normal[i], color="black", width=2)

hplot = hyperbolic_mesh + hyperbolic_spheres + hyperbolic
hplot.show(aspect_ratio=(1,1,1), frame=False)
hplot.save('hyperbolic.png', frame=False, aspect_ratio=(1,1,1))

dplot = deSitter_mesh + gaussmap_hyperbolic_spheres + deSitter
dplot.show(aspect_ratio=(1,1,1), frame=False)
dplot.save('deSitter.png', frame=False)
︡695fedfc-acdd-4ce9-9149-d70974c85365︡{"file":{"filename":"8b1f3f4a-6c2e-4684-824e-540a01542112.sage3d","uuid":"8b1f3f4a-6c2e-4684-824e-540a01542112"}}︡{"file":{"filename":"c8f9016f-2e62-4ca0-9b25-e85d1a8b6d2d.sage3d","uuid":"c8f9016f-2e62-4ca0-9b25-e85d1a8b6d2d"}}︡{"done":true}︡









