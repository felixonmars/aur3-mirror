# Maintainer: Ivan Petruk <localizator at ukr dot net>

_realname=EvoPop
pkgname=evopop-icon-theme
pkgver=0.4
pkgrel=1
pkgdesc='A simple icon theme with some google material design inspiration.'
arch=('any')
url='https://github.com/solus-project/evopop-icon-theme'
license=('GPL3')
optdepends=('evopop-gtk-theme: EvoPop GTK Theme'
            'evopop-shell-theme-git: EvoPop Gnome Shell Theme')
makedepends=('git')
provides=("evopop-icon-theme-git")
conflicts=("evopop-icon-theme-git")
options=('!strip')
install="${pkgname}.install"
source=($_realname-$pkgver.tar.xz::https://github.com/solus-project/$pkgname/releases/download/$pkgver/$_realname-$pkgver.tar.xz)
sha256sums=('f2849ba6218ae2bb7651968b917c785ba1486deeb05bdc8074c8f8e7c392963e')

package() {
  cd $_realname-$pkgver

  install -dm 755 "$pkgdir"/usr/share/icons
  cp -dr --no-preserve=ownership $_realname "$pkgdir"/usr/share/icons/
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
}

# vim: ts=2 sw=2 et:
