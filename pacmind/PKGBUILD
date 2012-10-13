# Contributor: Elia Notarangelo < elia dot notarangelo at gmail dot com>
# Maintainer: ale_xiovk < alexiobash at gmail dot com >

pkgname=pacmind
pkgver=2.4
pkgrel=1
pkgdesc="a gtkdialog frontend gui for the package manager, inspired to yaourt-gui"
arch=('any')
url="http://www.xfce-italia.it/index.php?topic=636.0"
license=('GPL')
depends=('gtkdialog' 'zenity' 'yaourt' 'xterm' 'pkgbrowser' 'sudo')
optdepends=('yaourt-gui')
source=(http://master.dl.sourceforge.net/project/archmind/pacmind/"$pkgname-$pkgver.tar.gz")

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=${pkgdir} install
}


md5sums=('20e3d81b30f2a01a661cc0e4532f5fec')
