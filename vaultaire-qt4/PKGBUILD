pkgname=vaultaire-qt4
pkgver=2dc369ad1db
pkgrel=1
pkgdesc="Document scanning and tagging front-end built on Qt/C++"
arch=('any')
url=('http://vaultaire.vimofthevine.com')
license=('Apache')
depends=('qt4')
makedepends=('git' 'make')
optdepends=('sane: scanner support'
            'gocr: optical character recognition'
            'tesseract: optical character recognition')
source=('vaultaire-qt4::git://github.com/vimofthevine/Vaultaire.git')
md5sums=('SKIP')

build() {
	cd $pkgname
	git reset --hard 2dc369ad1db
	make PREFIX=/usr QMAKE=qmake-qt4 LRELEASE=lrelease-qt4
}

package() {
	cd $pkgname
	make PREFIX=/usr DESTDIR="$pkgdir" install
}