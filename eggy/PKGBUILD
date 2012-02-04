# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=eggy
pkgver=0.3.3
pkgrel=2
pkgdesc="A Qt4 IDE with group project support."
arch=('i686' 'x86_64')
url="http://code.google.com/p/eggy/"
license=('GPL')
depends=('pyqt' 'python' 'python-chardet' 'python-qscintilla' 'qt')
source=(http://eggy.googlecode.com/files/eggy-$pkgver.zip)

build() {

cd $srcdir/eggy-$pkgver
python setup.py build -f install --root $pkgdir --prefix=/usr || return 1

}
md5sums=('39f8a48ccda82d0afec6ec6e3fcc700a')
