# Contributor: Igor Scabini <furester@gmail.com>

pkgname=rotoscope
pkgver=0.2
pkgrel=1
pkgdesc="Free software graphics program that can be used to give photos a cartoon-like appearance."
arch=(i686)
groups=()
url="http://www.toonyphotos.com/"
license="GPL"
depends=('gtk' 'libglade' 'gdk-pixbuf')
makedepends=('check')
conflicts=()
provides=()
source=("http://downloads.sourceforge.net/rotoscope/${pkgname}_${pkgver}.orig.tar.gz")
options=('!libtool')

build() {
  
  cd $startdir/src/${pkgname}-${pkgver}/

  ./configure --prefix=/usr

  make || return 1
  make DESTDIR=$startdir/pkg install

}
md5sums=('f1e92708351b011e52193e083f3c1eac')
