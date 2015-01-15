# Maintainer: Johannes Sjolund <j sjolund at gmail com>
pkgname=skype-i18n-gd
pkgver=1.0
_pkgname=skype-translation-gd
_pkgver="1.0~ppa13_all"
pkgrel=1
pkgdesc="Scottish Gaelic translation for Skype"
url="https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation"
arch=('any')
license=("GPL3")
depends=('skype')
source=("https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation/+files/${_pkgname}_${_pkgver}.deb")
sha256sums=('674b668835a6a006576a2c16a217452fe44797ebf9a5f348d95c4a0151c1261c')

build() {
    cd $srcdir
    tar -xf data.tar.xz
}

package() {
	cd $srcdir/usr/share/doc/skype-translation-gd/
	install -Dm644 changelog.gz $pkgdir/usr/share/doc/skype-translation-gd
	install -Dm644 copyright $pkgdir/usr/share/doc/skype-translation-gd
	
	cd $srcdir/usr/share/skype/lang/
	install -Dm644 skype_00.qm $pkgdir/usr/share/skype/lang/skype_00.qm
	install -Dm644 skype_00.ts $pkgdir/usr/share/skype/lang/skype_00.ts
}
