# Maintainer: Mijo Medvedec <mijo dot medvedec at gmail dot com>

pkgname=peces
_pkgname=glpeces
pkgver=5.1
pkgrel=1
pkgdesc="A game based on the Chinese game called Tangram"
arch=('i686' 'x86_64')
url="http://pecesjocdetangr.sourceforge.net/"
license=('GPL2')
depends=('qt4')
source=("http://sourceforge.net/projects/pecesjocdetangr/files/version%205.1%20%28March%2C%202015%29/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('095fc2e3fdc0f72c655bf6302deae6f06c4da9a2cf068999c9c89575470ccdb2')
sha512sums=('402577d2b969dbe85bd6c70f395595fd316cdea03df684d2bd0f1d04a6ea0b14d39d8bf0aa9be5ae31eedfcf200b45c08830ac24a2c314b31290b4fa90465467')

build() {
	cd "$_pkgname-$pkgver"

	qmake-qt4 $_pkgname.pro
	make
}

package() {
	cd "$_pkgname-$pkgver"
  	make INSTALL_ROOT="$pkgdir/" install
}
