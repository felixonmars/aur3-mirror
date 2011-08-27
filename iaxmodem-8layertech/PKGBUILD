#
# Created by: Joel Bryan Juliano <jbjuliano@8layertech.com>,
#                                <joelbryan.juliano@gmail.com>
#
# This package is part of 8ix Zenith CE project.
# For more information, visit http://www.8layertech.com
#
_realpkgname=iaxmodem
pkgname=$_realpkgname-8layertech
pkgver=1.2.0
pkgrel=3
pkgdesc="IAXModem is a software-based modem (With SSE2 & MMX Optimizations)"
url="http://sourceforge.net/projects/iaxmodem"
arch=('i686' 'x86_64')
license=('GPL')
install=iaxmodem.install
depends=('libtiff')
backup=(etc/iaxmodem/modem.conf)
source=(http://nchc.dl.sourceforge.net/sourceforge/iaxmodem/$_realpkgname-$pkgver.tar.gz
        iaxmodem.init.arch
        iaxmodem.logrotate
        optimization-flags.patch
        modem.conf)

md5sums=('f8b26cfeed188e5c1dcbc5ae5ef923b3'
         '484a779c3fd38ef12f8bff5cf2141e47'
         '4e3c2a4901bccad3faf5c9662f76e347'
         '215fde1e3ecd7d124f25ea1d7f6bdbb8'
         '38b9f08b30f1cccac8cd144342839f1e')

build() {
        mkdir -p $pkgdir/var/log/iaxmodem
        mkdir -p $pkgdir/etc/logrotate.d
        mkdir -p $pkgdir/etc/iaxmodem
        mkdir -p $pkgdir/usr/share/man/man1
        mkdir -p $pkgdir/usr/share/iaxmodem
        mkdir -p $pkgdir/usr/sbin
        mkdir -p $pkgdir/etc/rc.d
        mkdir -p $pkgdir/var/spool/uucp

        cd $srcdir/iaxmodem-1.2.0 && patch -p1 < $srcdir/optimization-flags.patch
        cd $srcdir/iaxmodem-1.2.0 && ./configure --prefix=/usr && make
        gzip $srcdir/iaxmodem-1.2.0/iaxmodem.1

        install $srcdir/modem.conf $pkgdir/etc/iaxmodem
        install $srcdir/iaxmodem-1.2.0/config.ttyIAX $pkgdir/usr/share/iaxmodem
        install $srcdir/iaxmodem-1.2.0/iaxmodem-cfg.ttyIAX $pkgdir/usr/share/iaxmodem
        install $srcdir/iaxmodem-1.2.0/iaxmodem.inf $pkgdir/usr/share/iaxmodem
        install $srcdir/iaxmodem-1.2.0/iaxmodem.1.gz $pkgdir/usr/share/man/man1

        install -m 755 $srcdir/iaxmodem-1.2.0/iaxmodem $pkgdir/usr/sbin
        install -m 755 $srcdir/iaxmodem.init.arch $pkgdir/etc/rc.d/iaxmodem
        install $srcdir/iaxmodem.logrotate $pkgdir/etc/logrotate.d/iaxmodem
}
