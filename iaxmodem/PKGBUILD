# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Joel Bryan Juliano <jbjuliano@8layertech.com> 
# Contributor: Sergey Datsevich <sergey@datsevich.de>

pkgname=iaxmodem
pkgver=1.2.0
pkgrel=2
pkgdesc="An IAX channel software modem"
backup=('etc/iaxmodem/ttyIAX0.conf')
url="http://sourceforge.net/projects/iaxmodem"
arch=('i686' 'x86_64')
license=('GPL')
install=iaxmodem.install
depends=('libtiff')
source=('http://downloads.sourceforge.net/project/iaxmodem/iaxmodem/iaxmodem-1.2.0/iaxmodem-1.2.0.tar.gz'
        iaxmodem.service
        iaxmodem.logrotate
        optimization-flags.patch
        ttyIAX0.conf)

sha256sums=('fa263c0df0870cb8133c4bee141146ca5db47ece6db50899a6acf508d76591ed'
            '3146b8e883fb9507eec31fc7b9cc31378819994e4f5846614a1239aee88c9ed6'
            'e56da0dd2dfb3d9a11bccf4aad753ecaa3b0bb8c9e5eea1659d1bb529f34b36b'
            'dacdb5c2601df37728a38203ad7e75f10970a0192770c384f9b78d898ede29c4'
            'c93b321d2596a2e8781d91cc7a8d722dd64427958b036c9eee60268d40c44961')

build() {
        cd ${srcdir}/${pkgname}-${pkgver}
	patch -p1 < ${srcdir}/optimization-flags.patch
        cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
        mkdir -p ${pkgdir}/var/log/iaxmodem
        mkdir -p -m 1777 ${pkgdir}/var/spool/uucp

        install -D -m 600 ${srcdir}/ttyIAX0.conf ${pkgdir}/etc/iaxmodem/ttyIAX0.conf
        install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/config.ttyIAX ${pkgdir}/usr/share/iaxmodem/config.ttyIAX
        install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/iaxmodem-cfg.ttyIAX ${pkgdir}/usr/share/iaxmodem/iaxmodem-cfg.ttyIAX
        install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/iaxmodem.inf ${pkgdir}/usr/share/iaxmodem/iaxmodem.inf
        gzip -f ${srcdir}/${pkgname}-${pkgver}/iaxmodem.1
        install -D -m 644 ${srcdir}/${pkgname}-${pkgver}/iaxmodem.1.gz ${pkgdir}/usr/share/man/man1/iaxmodem.1.gz

        install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/iaxmodem ${pkgdir}/usr/sbin/iaxmodem
        install -D -m 644 ${srcdir}/iaxmodem.service ${pkgdir}/usr/lib/systemd/system/iaxmodem.service
        install -D -m 644 ${srcdir}/iaxmodem.logrotate ${pkgdir}/etc/logrotate.d/iaxmodem
}
