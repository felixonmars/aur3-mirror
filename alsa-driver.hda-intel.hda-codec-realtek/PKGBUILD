pkgname=alsa-driver.hda-intel.hda-codec-realtek
_pkgname=alsa-driver
pkgver=1.0.23
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support"
arch=('i686' 'x86_64')
provides=(alsa-driver)
install='alsa-driver.install'
url="http://www.alsa-project.org"
license=('GPL')
options=(!libtool)
source=(ftp://ftp.alsa-project.org/pub/driver/$_pkgname-$pkgver.tar.bz2)

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=/usr --with-cards=hda-intel --with-card-options=hda-codec-realtek
  make || return 1
  make DESTDIR=$pkgdir install
}
md5sums=('4be102f995bd4cc68e6e8178b0d19ec2')
