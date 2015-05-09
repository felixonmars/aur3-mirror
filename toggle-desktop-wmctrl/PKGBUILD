# Contributor: Ron Simart

pkgname=toggle-desktop-wmctrl
pkgver=0.1
pkgrel=1
pkgdesc="Toggle Desktop link"
arch=('any')
url='http://aur.archlinux.org/packages/toggle-desktop-wmctrl/'
license=('GPL')
depends=('bash' 'wmctrl')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=('toggle-desktop-wmctrl.desktop')
md5sums=('3bd096271aeeef80df9a3695e55870fd')

package() {
  install -Dm 644 $srcdir/toggle-desktop-wmctrl.desktop ${pkgdir}/usr/share/applications/toggle-desktop-wmctrl.desktop
}
