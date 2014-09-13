# Maintainer: Quentin Panissier <contact@meshup.net>

pkgname=prelude-manager
pkgver=1.2.5
pkgrel=1
pkgdesc='High availability server that accepts secured connections from distributed sensors and/or other Managers'
arch=('i686' 'x86_64')
url='http://www.prelude-ids.org'
license=('GPLv2')
depends=('libprelude' 'libpreludedb' 'libxml2' 'tcp_wrappers')
install="$pkgname.install"
source=("https://www.prelude-ids.org/attachments/download/356/$pkgname-$pkgver.tar.gz"
        "$pkgname.service")
md5sums=('4ae4eb6b1f3b2a8b57c74b8a244b0b7c'
         '353cd3e846383d7230116b5b9fd0f8fd')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    # Fix permissions
    chmod 0755 $pkgdir/var/run/prelude-manager
    chmod 0755 $pkgdir/etc/prelude-manager
    chmod 0644 $pkgdir/etc/prelude-manager/prelude-manager.conf
    chmod 0755 $pkgdir/var/spool/prelude-manager/failover
    chmod 0755 $pkgdir/var/spool/prelude-manager/scheduler

    # Install systemd service
    install -Dm0644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}
