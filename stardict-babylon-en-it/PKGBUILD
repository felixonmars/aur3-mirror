# Contributor: Marco Curreli <marcocurreli@tiscali.it>
# Maintainer : Rosario Contarino <contarino.rosario {AT} googlemail>

pkgname=stardict-babylon-en-it
pkgver=2.4.2
pkgrel=10
pkgdesc="English Italian dictionary for Stardict"
license=('freeware')
url="http://stardict.sourceforge.net"
md5sums=('96d4a0e5af85bf9da3e2e7690ceff4e6')
source=(http://dl.dropbox.com/u/1139657/linux/English_Italian.tar.gz)

arch=('any')
package() {
	cd $startdir/src/English_Italian
	mkdir -p ${pkgdir}/usr/share/stardict/dic/
	install -m 644 English_Italian.dict  English_Italian.idx  English_Italian.ifo  English_Italian.syn ${pkgdir}/usr/share/stardict/dic/
}

