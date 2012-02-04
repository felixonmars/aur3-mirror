# Contributor: Marcelo Avalos Tejeda <marcelo <dot> avalos <at> gmail <dot> com>
pkgname=e17-bg-animated
pkgver=0.1
pkgrel=1
arch='i686'
pkgdesc="e17 Animated Backgrounds from get-e.org for enlightenment DR17"
url="http://www4.get-e.org/Backgrounds/Animated/"
depends=("e")
source=(http://www4.get-e.org/Backgrounds/Animated/_files/circuit.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/india-0.76.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/squares_and_letters.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/handmade-0.1.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/the_awakening-0.1.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17_bg_savrien.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17_c3d2_23c3.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/colors_of_freedom.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17_pong.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17_bg_Avrien.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/paddleballs.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/multipleballs.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/gentoo.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/tamanu-0.4.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/earthviews-0.5.1.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/matrix-rad_background_0.0.1.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17GoldRed.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17_bg_ladybug_animated.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/whiteCarbon-0.2.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/leftaloneHouses-0.1.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/road_to_enlightenment_anim.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17_bg_white_fortune.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17_bg_white.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17_bg_ripple.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/blue_eyed_trees.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17_bg_black_stains.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17_bg_rising_a2.edj \
http://www4.get-e.org/Backgrounds/Animated/_files/e17_bg_layered_sky.edj)

md5sums=()
build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/opt/e17/share/enlightenment/data/backgrounds
  install -m644 *.edj $startdir/pkg/opt/e17/share/enlightenment/data/backgrounds/
}
