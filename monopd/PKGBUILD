# Maintainer : Tasos Latsas <tlatsas2000@gmail.com>

pkgname=monopd
pkgver=0.9.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A dedicated game server daemon for playing Monopoly-like board games"
url="http://www.robertjohnkaper.com/software/atlantik/"
license=('GPL')
depends=('libcapsinetwork' 'libmath++')
backup=(etc/monopd/monopd.conf)
source=(gcc4.3.patch \
  http://ftp.de.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('4aaadb534ce40348f77c63ce61e73fab' 'e1d9f3be887baf35fbb46886cea8038f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # remove -dist extension from config file
  sed -i 's/monopd.conf-dist/monopd.conf/g' "conf/Makefile.in"
  sed -i 's/monopd.conf-dist/monopd.conf/g' "conf/Makefile.am"
  cp conf/monopd.conf-dist conf/monopd.conf

  patch -Np1 -i "$srcdir/gcc4.3.patch"
  ./configure --prefix=/usr --sysconfdir=/etc/$pkgname
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
