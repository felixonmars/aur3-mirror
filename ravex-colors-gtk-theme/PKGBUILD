# Contributor: Joel Almeida <aullidolunar at gmail dot com>

_distro="utopic"
pkgname=ravex-colors-gtk-theme
pkgver=17.2
pkgrel=1
pkgdesc="RAVE X Colors (Formally Mint-X Colors) Brings you a unique and beautiful GTK 3 (And 2) desktop theme in your choice to 16 Awesome Refined Colors"
arch=('any')
url="http://www.ravefinity.com/p/rave-x-colors-gtk-theme.html"
license=('GPL')
depends=('gtk3>=3.10' 'gtk-engine-unico')
source=("https://launchpad.net/~ravefinity-project/+archive/ubuntu/ppa/+files/${pkgname}_${pkgver}~${_distro}~Noobslab.com.tar.gz")
md5sums=('02a391a9920baaba4a342252932de4ba')

build() {
	cd "$srcdir"
}

package() {
	# copy the license
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 $srcdir/rave-x-theme/debian/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# theme stuff
	install -dm755 "$pkgdir/usr/share/themes"
	cd "$srcdir/rave-x-theme/RAVE-X-Colors-GTK"
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/themes/{}" \;
}
