# Contributor: Runar Tenfjord <runar.tenfjord@gmail.com>
pkgname=oce
pkgver=0.16
pkgrel=1
pkgdesc="Open CASCADE Technology, 3D modeling & numerical simulation"
url="http://github.com/tpaviot/oce"
arch=('i686' 'x86_64')
license=('Custom')
depends=('libgl' 'ftgl')
provides=('opencascade=6.7.1')
conflicts=('opencascade')
makedepends=('gcc')
source=(https://github.com/tpaviot/oce/archive/OCE-$pkgver.tar.gz 
        opencascade.sh opengl.patch)

prepare() {
  cd $srcdir/$pkgname-OCE-$pkgver
  patch -p1 -i $srcdir/opengl.patch 
}

build() {
  cd $srcdir/$pkgname-OCE-$pkgver
  
  flags=""
  flags="$flags -DOCE_INSTALL_PREFIX:PATH=${pkgdir}/usr"
  
  mkdir build
  cd build
  cmake $flags ..
  make
}

package() {
  cd $srcdir/$pkgname-OCE-$pkgver/build
  make install
  install -D -m 755 "${srcdir}/opencascade.sh" "${pkgdir}/etc/profile.d/opencascade.sh"
}
md5sums=('7a4b4df5a104d75a537e25e7dd387eca'
         '15e157f7c99fa3bed8b2ede9cd702edb'
         '4ff85333a6a408cd719596305e81a67b')
