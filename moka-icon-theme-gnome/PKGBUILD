# Maintainer: Narendiran <a [dot] narendiran [at] gmail [dot] com>

pkgname=moka-icon-theme-gnome
pkgver=2.0
pkgrel=2
pkgdesc="Moka Icon theme, including the Faba folder icons and Faba symbolic icons."
url="http://mokaproject.com/"
arch=('any')
license=('custom:cc-by-sa-4.0')
depends=()
optdepends=('moka-gtk-theme')
makedepends=()
conflicts=('moka-icon-theme' 'moka-icon-theme-git')
replaces=()
backup=()
source=("https://dl.dropboxusercontent.com/u/7027392/Downloads/moka-icon-theme.zip"
        "https://dl.dropboxusercontent.com/u/7027392/Downloads/faba-icon-theme.zip"
        "https://dl.dropboxusercontent.com/u/7027392/Downloads/faba-icon-theme-symbolic.zip")

md5sums=('1df1fd1afd7cef62d33dced4e99bf4db'
         'f633eda6b1fa979fae3af53570756b7d'
         '94bbcad4ba466f34e45c64228c197cde')

prepare() {
	cd "$srcdir"
	cp -ra $srcdir/Faba/* $srcdir/Moka/
}

package() {
	install -d -m 755 "$pkgdir"/usr/share/icons/Moka

	cd "$srcdir"
	cp -ra $srcdir/Moka ${pkgdir}/usr/share/icons/
	find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
	find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
}
