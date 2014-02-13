#Maintainor: Jameson Pugh <imntreal@gmail.com>
#Contributor: Paul Nicholson <brenix@gmail.com>

pkgname=echovnc-server
pkgver=1.67
pkgrel=1
pkgdesc="EchoVNC packet relay server. Connects EchoWare-enabled applications together"
arch=('x86_64')
url="http://www.echogent.com/"
license=('sleepycat')
depends=('lib32-openssl098' 'lib32-gcc-libs')
source=(http://www.echogent.com/img/echoserver_linux_$pkgver.tgz
        'echoserver.service')
sha256sums=('a6503f3cc75e65c8ccfcee98dcd295c7b451b6d1d8ddf01d97bd63a5a03ca060'
            '549896d34751c2592a2d50635c87a9923d87d7253a6f8895e1de487fd30498a5')

package() {
    cd ${srcdir}/echoserver_linux_$pkgver
    install -D -m755 linux-i386/echoserver-$pkgver $pkgdir/usr/bin/echoserver
    install -D -m755 linux-i386/utilities/echo-passwd-util $pkgdir/usr/bin/echo-passwd-util
    install -D -m755 linux-i386/echoserver.conf $pkgdir/etc/echoserver.conf
    install -D -m755 ../echoserver.service $pkgdir/usr/lib/systemd/system/echoserver.service
}
