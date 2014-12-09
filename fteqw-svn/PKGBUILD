# Maintainer: qs9rx < that nick at enjoys döt it>
pkgname=fteqw-svn
pkgver=4797
pkgrel=1
pkgdesc="A modern Quake 1 engine with many advanced features. Supports Quake 2, Quake 3 Arena, Hexen 2 and QTest too. Client and server. SVN version."
arch=('i686' 'x86_64')
url="http://www.fteqw.com/"
license=('GPL2')
depends=('libxxf86dga' 'libxxf86vm' 'libvorbis' 'libjpeg' 'libpng')
makedepends=('subversion' 'make')
optdepends=('speex')
install=$pkgname.install
md5sums=('SKIP')

source=('svn://svn.code.sf.net/p/fteqw/code/trunk')

pkgver() {
  cd "$srcdir/trunk"
  svnversion
}

build() {
  msg "Starting make..."
  cd "$srcdir/trunk/engine/"
  make gl-rel
  make sv-rel
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,share/licenses}
  install -m755 $srcdir/trunk/engine/release/fteqw.* "$pkgdir"/usr/bin/
  install -Dm644 $srcdir/trunk/engine/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
