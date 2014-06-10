# Contributor: Philip MÃ¼ller <philm_at_manjaro_dot_org>
# Maintainer: Pablo Lezaeta <prflr88 (arroba) gmail (dot) com>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=xfce-theme-adwaita-manjaro-git
pkgver=20140609
pkgrel=1
pkgdesc="Modified Adwaita Themes for Manjaro Linux"
arch=('any')
url="https://github.com/manjaro/artwork-adwaita-manjaro-themes"
license=('GPL2' 'CCPL')
depends=('gtk-engine-murrine' 'gnome-themes-standard')
makedepends=('git')
provides=("adwaita-manjaro-themes")
conflicts=("adwaita-manjaro-themes")
optdepends=('faenza-green-icon-theme')

build() {
	cd "$srcdir"
	git clone "https://github.com/manjaro/artwork-adwaita-manjaro-themes"
}

package() {
	cd "$srcdir/artwork-adwaita-manjaro-themes"
	find "Adwaita-Manjaro-dark" -name "*" -type f -exec install -Dm644 {} "$pkgdir/usr/share/themes/{}" \;
	find "Adwaita-Manjaro-light" -name "*" -type f -exec install -Dm644 {} "$pkgdir/usr/share/themes/{}" \;
}
