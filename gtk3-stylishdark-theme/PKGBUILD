# Maintainer: Joel Almeida <aullidolunar at gmail dot com>

_contentId=168118
_contentName=StylishDark

pkgname=gtk3-stylishdark-theme
pkgver=0.5
pkgrel=0
pkgdesc="Theme get inspired by the dark default theme from WPS"
arch=('any')
url=("http://gnome-look.org/content/show.php/${_contentName}?content=${_contentId}")
license=('GPL')
depends=('gtk3>=3.14' 'gtk-engine-murrine')
source=("http://orig05.deviantart.net/592b/f/2015/079/a/6/stylishdark_by_vinceliuice-d897hi1.7z")
md5sums=('b05b5a56df02b3b19500416e5dc9b7d1')

build() {
	cd "$srcdir"
}

package() {
	cd "$srcdir/StylishDark-Gtk-Themes-For-Gtk3.14(ubuntu15.04)"
	install -dm755 "$pkgdir/usr/share/themes"
	find "." -type d -iname "${_contentName}-*" -exec cp --no-preserve=all -R "{}" "$pkgdir/usr/share/themes/{}" \;
}
