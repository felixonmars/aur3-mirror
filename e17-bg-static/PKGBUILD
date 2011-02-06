# Contributor: Marcelo Avalos Tejeda <marcelo <dot> avalos <at> gmail <dot> com>
pkgname=e17-bg-static
pkgver=0.1
pkgrel=1
arch='i686'
pkgdesc="e17 Static Backgrounds from get-e.org for enlightenment DR17"
url="http://www4.get-e.org/Backgrounds/Static/"
depends=("e")
source=(http://www4.get-e.org/Backgrounds/Static/_files/rocke.edj \
http://www4.get-e.org/Backgrounds/Static/_files/3d_render.tar.gz \
http://www4.get-e.org/Backgrounds/Static/_files/red-e.edj \
http://www4.get-e.org/Backgrounds/Static/_files/glass.edj \
http://www4.get-e.org/Backgrounds/Static/_files/road_to_enlightenment.edj \
http://www4.get-e.org/Backgrounds/Static/_files/BlackE.edj \
http://www4.get-e.org/Backgrounds/Static/_files/e17_bg_ocean.edj \
http://www4.get-e.org/Backgrounds/Static/_files/ep3.edj \
http://www4.get-e.org/Backgrounds/Static/_files/e17_bg_carbon_fibre.edj \
http://www4.get-e.org/Backgrounds/Static/_files/e17_bg_ivy_wall_light.edj \
http://www4.get-e.org/Backgrounds/Static/_files/e17_bg_ladybug_rock_light.edj \
http://www4.get-e.org/Backgrounds/Static/_files/e17_bg_sunbeams.edj \
http://www4.get-e.org/Backgrounds/Static/_files/e17-tree.edj \
http://www4.get-e.org/Backgrounds/Static/_files/just_e.edj \
http://www4.get-e.org/Backgrounds/Static/_files/wallpaper-e-azul.edj)

md5sums=()
build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/opt/e17/share/enlightenment/data/backgrounds
  tar xvfz 3d_render.tar.gz
  install -m644 *.edj $startdir/pkg/opt/e17/share/enlightenment/data/backgrounds/
}
