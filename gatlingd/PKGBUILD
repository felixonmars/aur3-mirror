# Contributor: Alexander Ulrich <a.ulrich@student.uni-tuebingen.de>
# Contributor: henning mueller <henning@orgizm.net>
# Maintainer: Farhad Shahbazi-Firooz <farhad@shahbazi.at>

pkgname=gatlingd
pkgver=0.12
pkgrel=3
pkgdesc="a high performance http, ftp and smb server"
arch=(i686 x86_64)
url=http://www.fefe.de/gatling/
license=(GPL)
depends=(openssl)
conflicts=(gatling)
provides=(gatling)
makedepends=('libowfat>=0.28')
source=("http://dl.fefe.de/gatling-$pkgver.tar.bz2"
        'gatling.rc.d'
        'gatling.logrotate.d')
md5sums=('38ed634965af837142918f631f204e1b'
         'bee2471a59e15f5986da589d2770e0d2'
         'b6fa6c4356826cd0a049ba55374797a4')

build() {
  cd $srcdir/gatling-$pkgver
  sed -i '0,/\/man/s//\/share\/man/' GNUmakefile
  make DIET= || return 1
  make prefix=$pkgdir/usr install

  install -D -m755 $srcdir/gatling.rc.d $pkgdir/etc/rc.d/gatling
  install -D -m644 $srcdir/gatling.logrotate.d $pkgdir/etc/logrotate.d/gatling
  install -d -m755 -o http -g http $pkgdir/var/log/gatling/
}
