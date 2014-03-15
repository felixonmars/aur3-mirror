# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=openspades-data-git
pkgver=0.0.10.190.g670f41f
_rlver=0.0.10
pkgrel=1
pkgdesc="A clone of Voxlap Ace of Spades 0.75"
arch=('any')
url="https://github.com/yvt/openspades"
license=('GPL3')
makedepends=('imagemagick')
provides=('openspades-data')
source=("$pkgname"::'git://github.com/yvt/openspades.git' "http://yvt.jp/files/programs/osppaks/DevPaks25.zip" "http://yvt.jp/files/programs/osppaks/font-unifont.pak" "http://yvt.jp/files/programs/osppaks/font-unifont-ru.pak" "http://yvt.jp/files/programs/osppaks/font-mplus-ja-12.pak")
md5sums=('SKIP'
         '850813153e2732eec19979b46c77d7cf'
         'bd5025c83aacd4bddc52980b30d77453'
         'f7ecb5f025d5244802076f369c7ac776'
         '82a06b2fcefe08e1bac34b87a06dc022')

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

package() {
	mkdir "${pkgdir}/usr"
	mkdir "${pkgdir}/usr/share"
	mkdir "${pkgdir}/usr/share/${pkgname}"
	mkdir "${pkgdir}/usr/share/pixmaps"

	cd "$pkgname"
	cp -r "Resources/Gfx/Killfeed" "Resources/"
	cp -r Resources "${pkgdir}/usr/share/${pkgname}"
	
	cd "Resources/Icons"
	convert OpenSpades.ico openspades.png
	cp openspades-7.png "${pkgdir}/usr/share/pixmaps/openspades.png"
	
	cd "${srcdir}"
	cp *.pak "${pkgdir}/usr/share/${pkgname}/Resources"
	cp -r "Gfx" "${pkgdir}/usr/share/${pkgname}/Resources"
	cp pak999-References.pak "${pkgdir}/usr/share/${pkgname}/Resourcespak999-References.pak"

	cd "${pkgdir}/usr/share/${pkgname}/Resources"
	rm mkpak.sh
}
