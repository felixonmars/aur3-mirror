# Contributor: Alexander Drozdov <adrozdoff@gmail.com>
pkgname=ulog-acctd
# note: if the pkgver had been '0.99-10' then use an underscore. like '0.99_10'
pkgver=0.4.3
pkgrel=2
pkgdesc="A userspace network accounting daemon"
arch=(i686 x86_64)
url="http://alioth.debian.org/projects/pkg-ulog-acctd"
license=('GPL')
depends=(glibc)
backup=(etc/ulog-acctd.conf)
source=(http://alioth.debian.org/frs/download.php/949/${pkgname}_${pkgver}.orig.tar.gz
        ulog-acctd.logrotate
        ulog-acctd-makefile.patch
        ulog-acctd-logfile-perms.patch)
md5sums=('faa701ef5d9ffd0e783a58e339afb336'
         '02a872029ed4120881aa5c97dec5f5d3'
         '5461f26b28a4e8272230f660a7347dbc'
         '2d96d0217d210042df6af79b2a729a9b')

build() {
  cd $startdir/src/$pkgname-$pkgver.orig

  patch -p0 < ../ulog-acctd-makefile.patch
  patch -p0 < ../ulog-acctd-logfile-perms.patch

  cd src
  make

  install -d $startdir/pkg/usr/bin
  install -d $startdir/pkg/var/log/$pkgname
  install -d $startdir/pkg/usr/man/man8
  install -d $startdir/pkg/etc/logrotate.d

  install -m 755 $pkgname $startdir/pkg/usr/bin/
  install -m 644 $pkgname.conf $startdir/pkg/etc/
  install -m 644 ../doc/ulog-acctd.8 $startdir/pkg/usr/man/man8/
  install -m 644 $startdir/src/ulog-acctd.logrotate $startdir/pkg/etc/logrotate.d/ulog-acctd
}
