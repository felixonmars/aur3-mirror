# Maintainer: Alexander De Sousa <archaur .dot. xandy21 .at. spamgourmet .dot. com>
# Contributor: Kao Dome <kaodome .:at:. gmail .:dot:. com>

pkgname=dropbox-humanity-emblems
pkgver=1.0
pkgrel=1
pkgdesc="Humanity styled emblems for Dropbox."
url="http://forums.dropbox.com/topic.php?id=7818"
arch=('any')
license=('unknown')
depends=('nautilus-dropbox')
conflicts=('dropbox-tango-emblems')
install=dropbox.install
source=(dropbox-humanity-emblems.tar.gz::http://dl.dropbox.com/u/62148/Misc/Dropbox%20Emblems%20Humanity.tar.gz)
md5sums=('4560fc0b03bf69434beef7f55223f95a')
sha1sums=('4ee594134e595b144b0595b6e71be15c2ba36806')

package() {
	cd "$srcdir/Dropbox Emblems Humanity/"
	install -dm755 "$pkgdir/usr/share/icons"
	cp -r hicolor "$pkgdir/usr/share/icons"
}

# vim: set ft=sh ts=3 sw=3 tw=0:
