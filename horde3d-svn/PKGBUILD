# Past Maintainer: Sven-Hendrik Haase <sh at lutzhaase dot com>
# Contributor: Lukas Kropatschek <lukas.krop at gmail dot com>
# Maintainer: Axper Jan <483ken at gmail dot com>
pkgname=horde3d-svn
pkgver=354 
pkgrel=1
pkgdesc="A lightweight Next-Generation Graphics Engine"
arch=('i686' 'x86_64')
url="http://www.horde3d.org"
license=('EPL')
groups=('devel')
depends=('mesa')
optdepends=('glfw: glfw support')
makedepends=('subversion' 'cmake')
provides=('horde3d')
conflicts=('horde3d')
#source=("svn+https://horde3d.svn.sourceforge.net/svnroot/horde3d")
source=("svn+https://svn.code.sf.net/p/horde3d/code")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/code"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir/code/trunk"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/code/trunk"
  make DESTDIR="$pkgdir" install

  # Docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -a $srcdir/code/trunk/Horde3D/Docs/* "$pkgdir/usr/share/doc/$pkgname"
  find "$pkgdir/usr/share/doc/" -type f -exec chmod 644 {} \;

  # ColladaConv
  install -Dm755 ./Horde3D/Binaries/Linux/ColladaConv \
    "$pkgdir/usr/bin/ColladaConv"
}

# vim:set ts=2 sw=2 et:

