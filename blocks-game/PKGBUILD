# Maintainer: andy123 < ajs @ online . de >

pkgname=blocks-game
pkgver=1.12
pkgrel=1
pkgdesc="A 3D Jump & Run set in a small world of wood-blocks"
url="http://blocks-game.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('libvorbis' 'ftgl')
makedepends=('scons' 'glfw')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/Blocks-${pkgver}.tar.bz2"
	"launcher.sh")
sha512sums=('336f0deca5c170edd21d383ff54734923f61961bc89343889a291df19700d29c8b83cf3776715bf8a50a129ef6dbec1f4dcdc9992f8f39b7a9a25907fb199e29'
	'a52b8b5d4b17ff065ab55c3917b67b4bb0886029ce514b3e217db201a267044f10d34eb41a2c7b7bbc71c5e681c730ba1dfc45e16f9264d2838bdbd518eb70b4')

build() {
  cd "${srcdir}/Blocks-${pkgver}"
  scons
}

package() {
  cd "${srcdir}/Blocks-${pkgver}"
  mkdir -p $pkgdir/usr/share/$pkgname/
  mkdir -p $pkgdir/usr/bin/
  cp -R data/ $pkgdir/usr/share/$pkgname/
  cp -R levels/ $pkgdir/usr/share/$pkgname/
  cp -R shaders/ $pkgdir/usr/share/$pkgname/
  cp Blocks $pkgdir/usr/share/$pkgname/
  cp config.xml $pkgdir/usr/share/$pkgname/
  chmod a+rw $pkgdir/usr/share/$pkgname/config.xml
  cp "${srcdir}"/launcher.sh $pkgdir/usr/bin/$pkgname
  chmod +x $pkgdir/usr/bin/$pkgname
}