# Maintainer: Zbynek Moravec <zbynek@ithvezda.cz>
# Contributor: Zbynek Moravec <zbynek@ithvezda.cz>
# Based on Greybird and Greybird Mac http://xfce-look.org/content/show.php/Greybird-Mac?content=149800
pkgname=xfce-theme-mac-greybird-z
pkgver=1
pkgrel=1
pkgdesc="Mac graybird mod. Use with greybird, greenbird etc."
arch=('any')
url=("http://xfce-look.org/content/show.php?content=169819" "http://zbynek.php5.cz")
license=('GPL')
optdepends=('xfce-theme-greenbird' 'xfce-theme-greybird')
source=("https://dl.dropboxusercontent.com/s/xkv6jlhfegwacog/Mac-Greybird-Z.tar.gz")
md5sums=('11a3e414dbe0abff0db66e93b3172386')


package() {
	themesDir=${pkgdir}/usr/share/themes/
	install -d ${themesDir}
	tar xzvf ./Mac-Greybird-Z.tar.gz -C ${themesDir}
}

