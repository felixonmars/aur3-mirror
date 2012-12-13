# Maintainer: Fabiano Furtado < fusca14 -at- gmail -dot- com >
pkgname=hashkill
pkgver=0.3.1
pkgrel=1
pkgdesc="An open-source multithreaded password recovery tool."
arch=(i686 x86_64)
url="http://www.gat3way.eu/hashkill"
license=('GPL')
depends=(json-c
         opencl-catalyst
         opencl-headers
         opencl-nvidia
         openssl
         zlib
         )
makedepends=()
optdepends=()
options=()
source=(https://github.com/gat3way/hashkill/archive/${pkgver}.tar.gz
       )

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #patch -p0 < ../../Makefiles.patch
  aclocal
  #autoconf
  #automake --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

md5sums=('6a9ca282b2156fe340c583fdedc2fccb'
        )
