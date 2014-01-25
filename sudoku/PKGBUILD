# Maintainer: L Procter Your Name <jacksawild@hotmail.co.uk>
pkgname="sudoku"
pkgver=1.0
pkgrel=1.0
pkgdesc="Qt4 Sudoku"
arch=(any)
url="https://github.com/wimleers/sudoku"
license=('custom:UNLICENSE')
depends=(qt4 gendesk)
source=('https://github.com/wimleers/sudoku/archive/v1.0.zip')
md5sums=('6e6e39748c179221b42b00305f1081cc') #generate with 'makepkg -g'

prepare() {
	gendesk -f --pkgname "${pkgname}qt4" --name "SudokuQt" --pkgdesc "$pkgdesc" --exec SudokuQt-1.0 --categories='Application;Game;LogicGame'
}

build() {
	cd "$srcdir/${pkgname}-$pkgver/src"
	qmake-qt4 Sudoku_release.pro
	make clean
	make
}

package() {
	install -Dm755 "$srcdir/${pkgname}-$pkgver/src/Sudoku" "$pkgdir/usr/bin/SudokuQt-1.0"
	install -D -m644 "$srcdir/${pkgname}-$pkgver/UNLICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
	install -Dm644 "${pkgname}qt4.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "${pkgname}qt4.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	
}
