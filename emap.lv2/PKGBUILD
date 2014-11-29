# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
pkgname=emap.lv2
pkgver=0.0.2
pkgrel=1
pkgdesc="Easy Midi Audio Production: LV2 plugin interface for the fluidsynth soundfont synthesizer"
arch=(x86_64)
url="http://www.colorfulsoftware.com/emap"
license=('apache')
groups=('lv2-plugins')
depends=('fluidsynth' 'gtkmm3')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.colorfulsoftware.com/bin/emap.lv2-gtk3-linux-amd64.zip)
noextract=()
md5sums=('62ff6682669feb97d7ba7975677334d0')

package() {
	cd "$srcdir/$pkgname"

	install -d "$pkgdir/usr/lib/lv2/$pkgname"
	install * "$pkgdir/usr/lib/lv2/$pkgname"
}
