# Maintainer: Artem Vorotnikov <skybon at gmail dot com>
pkgname=win-xp-theme
pkgver=1.3.1
pkgrel=2
pkgdesc="Windows XP theme collection by Noobslab.com."
arch=('any')
url="https://launchpad.net/~noobslab/+archive/themes/+files"
license=('GPL3')
depends=('gtk-engine-murrine'
            'gtk-engine-unico'
            'gdk-pixbuf2')
source=("${url}/${pkgname}_${pkgver}~trusty~Noobslab.com.tar.gz")
sha512sums=('3e7bfe684f72da395bd58e4be46afb8536d8eee4cb0a969c2aa6e86e668f3691a054a58a01aabef856974e28afdb7c95d1f1708b5c8252bfc9cb07d0ec5f6d66')

prepare() {
	rm -r "${srcdir}/win-xp/debian"
}

package() {
  cd "$srcdir/win-xp"
  install -d "$pkgdir/usr/share/themes/Win-XP-theme"
  cp -r * "$pkgdir/usr/share/themes"
}