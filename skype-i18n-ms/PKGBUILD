# Maintainer: Johannes Sjolund <j sjolund at gmail com>
pkgname=skype-i18n-ms
pkgver=1.0
_pkgname=skype-translation-ms
_pkgver="1.0~ppa13_all"
pkgrel=1
pkgdesc="Malaysian translation for Skype"
url="https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation"
arch=('any')
license=("GPL3")
depends=('skype')
source=("https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation/+files/${_pkgname}_${_pkgver}.deb")
sha256sums=('a1d46ac4a5b34547c05105aa764add954e66ab1d0ccdfe7f0c80c6abbcdd8bc4')

build() {
    cd $srcdir
    tar -xf data.tar.xz
}

package() {
	cd $srcdir/usr/share/doc/skype-translation-ms/
	install -Dm644 changelog.gz $pkgdir/usr/share/doc/skype-translation-ms
	install -Dm644 copyright $pkgdir/usr/share/doc/skype-translation-ms
	
	cd $srcdir/usr/share/skype/lang/
	install -Dm644 skype_02.qm $pkgdir/usr/share/skype/lang/skype_02.qm
	install -Dm644 skype_02.ts $pkgdir/usr/share/skype/lang/skype_02.ts
}
