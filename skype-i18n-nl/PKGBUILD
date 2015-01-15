# Maintainer: Johannes Sjolund <j sjolund at gmail com>
pkgname=skype-i18n-nl
pkgver=1.0
_pkgname=skype-translation-nl
_pkgver="1.0~ppa13_all"
pkgrel=1
pkgdesc="Dutch translation for Skype"
url="https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation"
arch=('any')
license=("GPL3")
depends=('skype')
source=("https://launchpad.net/~gunnarhj/+archive/ubuntu/skype-translation/+files/${_pkgname}_${_pkgver}.deb")
sha256sums=('db6cbc777dca83ac0d444910fdd140f0b2e1d3503066fd489db551b992e6b592')

build() {
    cd $srcdir
    tar -xf data.tar.xz
}

package() {
	cd $srcdir/usr/share/doc/skype-translation-nl/
	install -Dm644 changelog.gz $pkgdir/usr/share/doc/skype-translation-nl
	install -Dm644 copyright $pkgdir/usr/share/doc/skype-translation-nl
	
	cd $srcdir/usr/share/skype/lang/
	install -Dm644 skype_nl.qm $pkgdir/usr/share/skype/lang/skype_nl.qm
	install -Dm644 skype_nl.ts $pkgdir/usr/share/skype/lang/skype_nl.ts
}
