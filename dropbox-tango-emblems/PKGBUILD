# Maintainer: Alexander De Sousa <archaur .dot. xandy21 .at. spamgourmet .dot. com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Kao Dome <kaodome .:at:. gmail .:dot:. com>

pkgname=dropbox-tango-emblems
pkgver=2.0
pkgrel=2
pkgdesc="Tango status emblems for Dropbox."
url="http://forums.dropbox.com/topic.php?id=7818"
arch=('any')
license=('unknown')
depends=('nautilus-dropbox')
conflicts=('dropbox-humanity-emblems')
install=dropbox.install
source=(dropbox-tango-emblems.tar.gz::http://dl.dropbox.com/u/62148/Misc/Dropbox%20Emblems%20Tango.tar.gz)
md5sums=('0fe5a39d81d242750da4862eafbcabe7')
sha1sums=('84727288074695dbf8843819fc016dea565f0fc5')

package() {
	cd "$srcdir/Dropbox Emblems Tango/"
	install -dm755 "$pkgdir/usr/share/icons"
	cp -r hicolor "$pkgdir/usr/share/icons"
}

# vim: set ft=sh ts=3 sw=3 tw=0:
