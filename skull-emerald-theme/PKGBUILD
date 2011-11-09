# Maintainer: Malina <mali@irc>

pkgname=skull-emerald-theme
pkgver=1
pkgrel=1
pkgdesc="Skull emerald theme"
url="http://votritis.deviantart.com/#/d2wnqtv"
license=('GPL')
arch=('any')
depends=('emerald')
source=("http://www.deviantart.com/download/194580974/skull____emerald_theme_by_votritis-d37ujn2.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')

package() {
#unzip -o skull____emerald_theme_by_votritis-d37ujn2.zip
	cd ${srcdir}
    for file in *emerald ; do 
		mkdir -p ${pkgdir}/usr/share/emerald/themes/"${file/.emerald/}"
		bsdtar -x -f "${file}" -C ${pkgdir}/usr/share/emerald/themes/"${file/.emerald/}"
	done
}
md5sums=('16d0e8dff28288767f651280e9763119')
