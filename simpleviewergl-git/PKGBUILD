# Contributor: Anton Kalugin aka strafer <strafer at ufaley dot su>
pkgname=simpleviewergl-git
pkgver=2.5
pkgrel=2
pkgdesc="Simple image viewer using OpenGL for acceleration."
arch=('i686' 'x86_64')
url="http://www.ugolnik.info/?p=1302"
license=('GPL')
depends=('freeglut' 'freetype2' 'imlib2' 'libjpeg' 'libpng' 'giflib' 'zlib')
makedepends=('git' 'libconfig' 'cmake')
conflicts=('simpleviewergl-svn')
source=('formatgif.patch' "$pkgname"::'git+https://bitbucket.org/andreyu/simple-viewer-gl')
md5sums=('cbc1f54f92e5347903697e6f1208dea3' 'SKIP')
install=install

pkgver() {
    cd "$srcdir/$pkgname"

    git describe --tags | sed -e 's/[a-zA-Z]*\([0-9.]*\)/\1/'
}

build() {
  patch -p0 <"$srcdir"/formatgif.patch

  cd "$srcdir/${pkgname}"

  msg "Starting make..."
  make linux
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm 755 sviewgl ${pkgdir}/usr/bin/sviewgl

  mkdir -p "${pkgdir}/usr/share/doc/simpleviewergl/"
  install -Dm 644 config.example "${pkgdir}/usr/share/doc/simpleviewergl/"
}
# vim:set ts=2 sw=2 et:
