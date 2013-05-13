# Maintainer: poison <rc.poison@gmail.com>
pkgname=pacmannrd
pkgver=1.0
pkgrel=1
pkgdesc="pacman no rape my disk! Simple wrapper that prevents package install hooks from running fucking gtk-update-icon-cache after every package. Saves 50GB of writes and speeds up upgrade by factor 200 on full KDE upgrade."
arch=(any)
url="https://aur.archlinux.org/"
license=('GPL')
depends=('bash')
makedepends=()
optdepends=()
backup=('etc/pacmannrd.conf')
source=('pacmannrd' 'pacmannrd.conf' 'gtk-update-icon-cache')

md5sums=('41f00c5c5d849ef7c8a8dd697afce294'
         '41c4015ac95442ee5f66e87e684350aa'
         '8607d39001fcefa1b2a35e9ea7946be0')

build() {
	echo "successfully built. Don't forget to tune your compiler settings to maximize performance!"
	# Heh, I made you look :P
}

package() {
  cd "$srcdir"
	mkdir -p $pkgdir/usr/bin $pkgdir/etc $pkgdir/usr/share/pacmannrd
	install pacmannrd $pkgdir/usr/bin/
	install pacmannrd.conf $pkgdir/etc/
	install gtk-update-icon-cache $pkgdir/usr/share/pacmannrd/
}
