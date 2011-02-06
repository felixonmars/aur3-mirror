# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=libbeagle-no-gnome
pkgver=0.3.5.1
pkgrel=1
pkgdesc="The famous desktop search tool's libs without its heavy Gnome dependencies"
url="http://beagle-project.org"
license=(custom)
arch=('i686' 'x86_64')
depends=('beagle-no-gnome')
makedepends=('zip' 'pkgconfig')
options=('!libtool')
conflicts=('libbeagle')
provides=('libbeagle')
source=(http://ftp.gnome.org/pub/GNOME/sources/libbeagle/0.3/libbeagle-${pkgver}.tar.bz2)
md5sums=('b72a8c38a80e2a13f164b0437e539a93')

build() {
  cd ${startdir}/src/libbeagle-${pkgver}
  ./configure --prefix=/usr --enable-python --disable-docs 
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
