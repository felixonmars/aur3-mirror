# Contributor: bender02 at gmx dot com
pkgname=linuxlogger
pkgver=0.7
pkgrel=1
pkgdesc="A minimal replacement for syslogd and klogd that works with freedt (daemontools)"
url="http://offog.org/code"
license=('custom')
arch=('i686' 'x86_64')
makedepends=(dietlibc)
source=(http://offog.org/files/linuxlogger-0.7.tar.gz LICENSE)
md5sums=('fe86a53069e6a57c52dbcf0bdebdeb66'
         '5a645688f1647d655e17f003e28dcc3d')

build() {
    cd $srcdir/$pkgname-$pkgver
    CC='/opt/diet/bin/diet -Os gcc' ./configure --prefix=/usr || return 1
    make CC='/opt/diet/bin/diet -Os gcc' || return 1
    make DESTDIR=$pkgdir install || return 1
    install -D -m 644 $srcdir/$pkgname-$pkgver/README \
      $pkgdir/usr/share/linuxlogger/README || return 1
    install -D -m 644 $srcdir/LICENSE \
      $pkgdir/usr/share/licenses/linuxlogger/LICENSE || return 1
}
