# Contributor: twa022 <twa022 at gmail dot com>

pkgname=faelementary-icon-theme
pkgver=0.10
pkgrel=1
pkgdesc="Faelementary Icon theme (Elementary feel, Faenza apps)"
arch=('any')
url="http://shrubhill.deviantart.com/art/Faelementary-Icons-194994315"
license=('GPL')
depends=('gtk2')
makedepends=('unrar')
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
source=(http://www.deviantart.com/download/194994315/faelementary_icons_by_shrubhill-d383ekr.rar)
md5sums=('5016c78ff89c67f5461c40ba6d71cf1b')

build() {
	cd "${srcdir}"
	unrar x faelementary_icons_by_shrubhill-d383ekr.rar
	mkdir -p "${pkgdir}"/usr/share/icons
	tar -zxf Faelementary.tar.gz -C "${pkgdir}"/usr/share/icons/
	find "${pkgdir}"/usr/share/icons -type d -exec chmod 755 '{}' \;
	find "${pkgdir}"/usr/share/icons -type f -exec chmod 644 '{}' \;
}

md5sums=('f69ceb73d136d67c1eec8bbd45a59a76')
