# Maintainer: SpepS <dreamspepser at yahoo dot it>

_p=Horde3D
_pkg=${_p}_SDK_
pkgname=horde3d
pkgver=1.0.0_Beta5
pkgrel=2
pkgdesc="A lightweight Next-Generation Graphics Engine"
arch=(i686 x86_64)
url="http://www.horde3d.org/"
license=('EPL')
depends=('libgl')
makedepends=('cmake')
conflicts=("$pkgname-svn")
source=("http://downloads.sourceforge.net/project/horde3d/Horde3D%20SDK/Horde3D%20SDK%20%5B1.0.0%5D%20Beta5/$_pkg$pkgver.zip")
md5sums=('5bdec8c9b6d004f64a0a103ef9befea7')

build() {
  cd "$srcdir/$_pkg$pkgver"

  [ -d bld ] || mkdir bld && cd bld

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkg$pkgver/bld"

  make DESTDIR="$pkgdir/" install

  cd ../$_p

  # docs
  install -d "$pkgdir/usr/share/docs/$pkgname"
  cp -a Docs/* "$pkgdir/usr/share/docs/$pkgname"
  find "$pkgdir/usr/share/docs/" -type f -exec chmod 644 {} \;

  # ColladaConv
  install -Dm755 Binaries/Linux/ColladaConv \
    "$pkgdir/usr/bin/ColladaConv"
}

# vim:set ts=2 sw=2 et:
