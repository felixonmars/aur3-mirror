# Maintainer: Ybalrid <ybalrid@cecmu.org>
pkgname=numlockontty
pkgver=0.1
pkgrel=5
pkgdesc="Systemd service + script, automacily activate numpad on ttys"
arch=('any')
depends=(systemd)
license=('GPL')
source=(http://datalove.cecmu.org/aur/$pkgname-$pkgver.tar.gz)
url="http://datalove.cecmu.org/aur/numlockontty.html"
noextract=()
md5sums=('f7b69626dd83f5da5269b226688ff1b8')

package() {
    cd "$srcdir"
    chmod +x numlockOnTty

    mkdir --parent $pkgdir/usr/bin
    mkdir --parent $pkgdir/etc/systemd/system

    cp numlockOnTty "$pkgdir"/usr/bin/numlockOnTty
    cp numLockOnTty.service "$pkgdir"/etc/systemd/system/numLockOnTty.service
    echo "please run 'systemctl enable numLockOnTty' as root"

}
