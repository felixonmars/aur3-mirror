# Maintainer: Johannes Sjolund <j sjolund at gmail com>
pkgname=skype-i18n-sv
pkgver=1.0
_pkgname=skype-translation-sv
_pkgver="1.0~ppa13_all"
pkgrel=1
pkgdesc="Swedish translation for Skype"
url="https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation"
arch=('any')
license=("GPL3")
depends=('skype')
source=("https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation/+files/${_pkgname}_${_pkgver}.deb")
sha256sums=('2c5902d14a779c68efce45f053fa884fd31766b869c913165fd380b7ddee2383')

build() {
    cd $srcdir
    tar -xf data.tar.xz
}

package() {
	cd $srcdir/usr/share/doc/skype-translation-sv/
	install -Dm644 changelog.gz $pkgdir/usr/share/doc/skype-translation-sv
	install -Dm644 copyright $pkgdir/usr/share/doc/skype-translation-sv
	
	cd $srcdir/usr/share/skype/lang/
	install -Dm644 skype_sv.qm $pkgdir/usr/share/skype/lang/skype_sv.qm
	install -Dm644 skype_sv.ts $pkgdir/usr/share/skype/lang/skype_sv.ts
}
