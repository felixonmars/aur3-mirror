# Contributor: Marco Curreli <marcocurreli@tiscali.it>
# Maintainer : Rosario Contarino <contarino.rosario {AT} googlemail>

pkgname=stardict-babylon-it-en
pkgver=2.4.2
pkgrel=7
pkgdesc="Italian English dictionary for Stardict"
license=('freeware')
url="http://stardict.sourceforge.net"
#source=(http://yeelou.com/huzheng/stardict-dic/babylon/bidirectional/stardict-babylon-Babylon_Italian_English_dictio-$pkgver.tar.bz2)
source=(http://dl.dropbox.com/u/1139657/linux/Italian_English.tar.gz)
md5sums=('e50a48ccc6b8f8c9d137cb655ebe6b68')
arch=('any')

package() {
	cd $startdir/src/Italian_English
	mkdir -p ${pkgdir}/usr/share/stardict/dic/
	install -m 644 Italian_English.dict  Italian_English.idx  Italian_English.ifo Italian_English.syn ${pkgdir}/usr/share/stardict/dic/
}

