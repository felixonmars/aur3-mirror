pkgname=slim-theme-arch_mac
pkgver=1
pkgrel=6
pkgdesc='A minimal SLiM theme based on the OS X login screen'
url="http://www.archlinux.org"
arch=('any')
license=('LGPL')
depends=('slim')
groups=('slim-themes')
install="arch_mac.install"
source=("$pkgname-$pkgver.tar.gz" "arch_mac.install")
md5sums=('0698ba5e6b3e251aa9d663be26cff868' '4877719ced0ce7d86c9fb9cc4de1be2a')

package() {
    install -m 644 -D background.jpg $pkgdir/usr/share/slim/themes/arch_mac/background.png
    install -m 644 -D panel.png $pkgdir/usr/share/slim/themes/arch_mac/panel.png
    install -m 644 -D slim.theme $pkgdir/usr/share/slim/themes/arch_mac/slim.theme
    install -m 644 -D README $pkgdir/usr/share/slim/themes/arch_mac/README
}