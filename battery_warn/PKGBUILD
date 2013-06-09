pkgname=battery_warn
pkgver=0.1
pkgrel=2
pkgdesc="Blink ThinkPad power led on low battery"
url="https://github.com/wrigleyster/arch-pkgs/"
arch=(any)
license=('MIT')
depends=('acpi')
makedepends=()
source=('battery_warn'
        'battery_warn.service')
md5sums=('a2717512eec31bf81d92dc8e527ec6a4'
         '7fc22ccd53a92906ac806b5b86fa310a')


package(){
    cd "$srcdir"
    install -Dm755 battery_warn $pkgdir/usr/bin/battery_warn
    install -Dm755 battery_warn.service $pkgdir/usr/lib/systemd/system/battery_warn.service

}
