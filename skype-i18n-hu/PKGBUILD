# Maintainer: Johannes Sjolund <j sjolund at gmail com>
pkgname=skype-i18n-hu
pkgver=1.0
_pkgname=skype-translation-hu
_pkgver="1.0~ppa13_all"
pkgrel=1
pkgdesc="Hungarian translation for Skype"
url="https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation"
arch=('any')
license=("GPL3")
depends=('skype')
source=("https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation/+files/${_pkgname}_${_pkgver}.deb")
sha256sums=('3293d839daecbbf3bbd4dbf341323d1b5672ac77acef02aee7f3ca3e2b68b796')

build() {
    cd $srcdir
    tar -xf data.tar.xz
}

package() {
	cd $srcdir/usr/share/doc/skype-translation-hu/
	install -Dm644 changelog.gz $pkgdir/usr/share/doc/skype-translation-hu
	install -Dm644 copyright $pkgdir/usr/share/doc/skype-translation-hu
	
	cd $srcdir/usr/share/skype/lang/
	install -Dm644 skype_hu.qm $pkgdir/usr/share/skype/lang/skype_hu.qm
	install -Dm644 skype_hu.ts $pkgdir/usr/share/skype/lang/skype_hu.ts
}
