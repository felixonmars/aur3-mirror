# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
pkgname=cable-scripts
pkgver=0.1
pkgrel=4
pkgdesc="Set of scripts for easy configuring pptp connection"
license=('GPL')
depends=('pptpclient')
backup=(etc/ppp/pptp.conf)
arch=('any')
url="http://www.kodsweb.ru/forum/index.php?showtopic=711"

source=(cable
        cable-guard
        cable-setup
        cable-start
        cable-status
        cable-stop
        pptp.conf)

md5sums=('e50e7c5b5d82ef3d242c57622bde8296'
         '68e99eea6428bbd505b6f6a581282e3a'
         '2dc917eca1f39a7193635f9035bf9e1e'
         'b77b28d91a6241141f54edc23cadfc5c'
         '7fae0e280bcf6d851fc4822005b914eb'
         '131906244452fe7fadecbe47594c67d9'
         '5989762a1c711a114f094380d0812695')

package() {
    mkdir -p $pkgdir/etc/{rc.d,ppp} $pkgdir/usr/sbin

    cd $srcdir
    install -m744 cable cable-guard $pkgdir/etc/rc.d
    install -m644 pptp.conf $pkgdir/etc/ppp
    install -m744 cable-setup cable-start cable-status cable-stop $pkgdir/usr/sbin
}
