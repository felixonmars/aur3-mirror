# Maintainer: Johannes Sjolund <j sjolund at gmail com>
pkgname=skype-i18n-sr
pkgver=1.0
_pkgname=skype-translation-sr
_pkgver="1.0~ppa13_all"
pkgrel=1
pkgdesc="Serbian translation for Skype"
url="https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation"
arch=('any')
license=("GPL3")
depends=('skype')
source=("https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation/+files/${_pkgname}_${_pkgver}.deb")
sha256sums=('eb5c2d2c12113e05dedb8ddb1d63822bf41e7298d4f7335593f7b69644bd8c5a')

build() {
    cd $srcdir
    tar -xf data.tar.xz
}

package() {
	cd $srcdir/usr/share/doc/skype-translation-sr/
	install -Dm644 changelog.gz $pkgdir/usr/share/doc/skype-translation-sr
	install -Dm644 copyright $pkgdir/usr/share/doc/skype-translation-sr
	
	cd $srcdir/usr/share/skype/lang/
	install -Dm644 skype_01.qm $pkgdir/usr/share/skype/lang/skype_01.qm
	install -Dm644 skype_01.ts $pkgdir/usr/share/skype/lang/skype_01.ts
}
