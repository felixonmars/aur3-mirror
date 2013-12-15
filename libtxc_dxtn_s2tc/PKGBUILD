# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=libtxc_dxtn_s2tc
pkgver=0.0.20130326
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A replacement for the texture compression library for Mesa"
url="https://github.com/divVerent/s2tc"
license=(MIT)
depends=(mesa)
options=(!libtool)
provides=('libtxc_dxtn')
conflicts=('libtxc_dxtn')
source=(dxtn_s2tc.zip::https://github.com/divVerent/s2tc/archive/master.zip)
md5sums=('ea6da51fb27e663214554ee18b1f8314')

build() {
  cd "$srcdir"/s2tc-master
  
  sh autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/s2tc-master

  make DESTDIR="$pkgdir" install
}
