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
︡969599b9-2095-40a9-8f16-fa63f161cf24︡{"file":{"filename":"ff7aa6a0-eb30-4059-80ca-af6467d55876.sage3d","uuid":"ff7aa6a0-eb30-4059-80ca-af6467d55876"}}︡{"done":true}︡
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
︡a8ac903d-a624-46bd-970b-39e7ee4c3ec2︡{"file":{"filename":"03a5e33b-3d43-425a-b9a3-7d5f44cf583d.sage3d","uuid":"03a5e33b-3d43-425a-b9a3-7d5f44cf583d"}}︡{"done":true}︡
︠83e4468e-8f76-4369-a0e5-e8780747d505s︠
# Parametrise sphere over z-coordinate and angle

s_r0 = 1 # Radius
s_umin = -s_r0
s_umax = s_r0

s_r(u) = sqrt(s_r0^2 - u^2)
s_rp(u) = s_r.diff(u)

s(u, phi) = [s_r(u) * cos(phi), s_r(u) * sin(phi), u]

# Coordinate Curves
def s_ucurve(phi0):
    return s.subs(phi == phi0)

def s_phicurve(u0):
    return s.subs(u == u0)

# Coordinate tangents
su = s.diff(u)
sphi = s.diff(phi)

# Normal in ambient Minkowski space
#s_norm_normal(u, phi) = (d_rp(u)^2 - d_r0^2)^(-1/2)
#s_normal(u, phi) =  [d_norm_normal(u, phi) * cos(phi), d_norm_normal(u, phi) * sin(phi), d_norm_normal(u, phi) * d_rp(u)]

# Plot sphere
def cf(u,phi): return sin(phi+u)^2
sphere = parametric_plot3d(s, [u, s_umin, s_umax], [phi, phimin, phimax], opacity=0.2, color=(cf, colormaps.rainbow))
sphere = parametric_plot3d(s, [u, s_umin, s_umax], [phi, phimin, phimax], opacity=0.2)

# Draw mesh of u and phi coordinate curves
sphere_mesh = Graphics()

# u coordinate
u_n = 10

ustep = (1/u_n) * (phimax/2-phimin)
upoints = [phimin + ustep * i for i in range(u_n+1)]

u_curves = Graphics()
for phi0 in upoints:
    u_curves += parametric_plot3d(s_ucurve(phi0), (u, s_umin, s_umax), color="gray")
    u_curves += parametric_plot3d(s_ucurve(phimax-phi0), (u, s_umin, s_umax), color="gray")

sphere_mesh += u_curves

#phi coordinate
phi_n = 10

phistep = (1/phi_n) * (s_umax-s_umin)
phipoints = [s_umin + phistep * i for i in range(phi_n+1)]

phi_curves = Graphics()
for u0 in phipoints: phi_curves += parametric_plot3d(s_phicurve(u0), (phi, phimin, phimax), color="gray")

sphere_mesh += phi_curves

s_plot = sphere + sphere_mesh
s_plot.show(aspect_ratio=(1,1,1), frame=False)

︡2d449886-e562-4727-a500-46e34d756056︡{"file":{"filename":"d16db2fc-931c-4789-93e6-0db96c3a8fdc.sage3d","uuid":"d16db2fc-931c-4789-93e6-0db96c3a8fdc"}}︡{"done":true}︡
︠f6b01bae-4256-4b7f-b13b-49b8ce5c4a57s︠

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
︡af849ac0-ad3d-42fa-9d4c-26d55d7f2b1e︡{"file":{"filename":"f5de632e-a0e2-4810-9566-18b92fc7c823.sage3d","uuid":"f5de632e-a0e2-4810-9566-18b92fc7c823"}}︡{"file":{"filename":"86985765-3cba-49b6-ac15-7ca642e188ab.sage3d","uuid":"86985765-3cba-49b6-ac15-7ca642e188ab"}}︡{"done":true}︡
︠29dd93c4-650d-4daf-8f3f-48d1f551b4b3s︠
# Plot some geodesic spheres in the sphere space with normals
spherical_spheres = Graphics()
gaussmap_spherical_spheres = Graphics()

# Partition points for tangents
n = 10
start = phimin
end = phimax
step = (1/n) * (end - start)
points = [start + step * i for i in range(n+1)]

for geodesic_sphere in [[s_r0/4, 'red', '--', 0], [(5/8)*s_r0, 'blue', ':', step/2]]:
    u0 = geodesic_sphere[0]
    colour = geodesic_sphere[1]
    linestyle = geodesic_sphere[2]
    phase = geodesic_sphere[3]

    s_phicurve_normal = -vector(su(u=u0, phi=phi)).normalized()
    spherical_spheres += parametric_plot3d(s_phicurve(u0), (phi, phimin, phimax), color=colour, thickness=2, linestyle=linestyle)
    gaussmap_spherical_spheres += parametric_plot3d(s_phicurve_normal(u=u0, phi=phi), (phi, phimin, phimax), color=colour, thickness=2, linestyle=linestyle)

    # Draw tangents along geodesic sphere
    curve_points = [(s_phicurve(u0))(phi=t+phase) for t in points]

    spherical_field_u = [s_phicurve_normal(u=u0, phi=t+phase) for t in points]
    spherical_field_phi = [sphi(u=u0, phi=t+phase) for t in points]
    #spherical_field_normal = [s_normal(u=u0, phi=t+phase) for t in points]

    for i in range(n+1):
        spherical_spheres += arrow3d(curve_points[i], curve_points[i] + (2/3)*spherical_field_u[i], color=colour, width=1, linestyle=linestyle) #(2/3) makes the image look a little nice
        gaussmap_spherical_spheres += arrow3d([0,0,0], spherical_field_u[i], color=colour, width=1, linestyle=linestyle)

splot = sphere_mesh + sphere + spherical_spheres
splot.show(aspect_ratio=(1,1,1), frame=False)
splot.save('sphere.png', frame=False, aspect_ratio=(1,1,1))

dualsplot = sphere_mesh + sphere + gaussmap_spherical_spheres
dualsplot.show(aspect_ratio=(1,1,1), frame=False)
dualsplot.save('dual_sphere.png', frame=False)
︡bee5ccdd-0586-412b-9bed-24d9f477348b︡{"file":{"filename":"3c59c40e-6717-464e-b989-7e34a4c8bfe1.sage3d","uuid":"3c59c40e-6717-464e-b989-7e34a4c8bfe1"}}︡{"file":{"filename":"8473f0af-f6bf-46d3-a6e5-cdd4862e2683.sage3d","uuid":"8473f0af-f6bf-46d3-a6e5-cdd4862e2683"}}︡{"done":true}︡
︠96345604-d6c1-4ce1-9a35-5d6fad4dd41c︠









