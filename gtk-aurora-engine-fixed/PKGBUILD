# Maintained by Score_Under <seejay.11@gmail.com>
# Contributors to the original PKGBUILD (gtk-aurora-engine):
#     Sergej Pupykin <pupykin.s+arch@gmail.com>
#     Dmitry N. Shilov <stormblast@land.ru>
#     Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-aurora-engine-fixed
pkgver=1.5.1
pkgrel=1
pkgdesc="gtk-engine: latest member of the clearlooks family (bugfix fork)"
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/Aurora+Gtk+Engine?content=56438"
license=('GPL')
provides=(gtk-aurora-engine)
conflicts=(gtk-aurora-engine)
replaces=(gtk-aurora-engine)
depends=('gtk2')
makedepends=('pkgconfig')
source=("$pkgname::git+https://github.com/ScoreUnder/gtk-aurora-engine-fixed#commit=b7f93081c138227f6ad4c293f4a74c7866d448ed")
md5sums=('SKIP')

build() {
	cd "$pkgname/aurora-1.5"
	./configure --prefix=/usr --enable-animation
	make
}

package() {
	cd "$pkgname/aurora-1.5"
	make "DESTDIR=$pkgdir" install

	cd ..
	mkdir -p "$pkgdir/usr/share/themes"
	cp -r Aurora "$pkgdir/usr/share/themes/"
	chown -R root:root "$pkgdir/usr/share/themes"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
