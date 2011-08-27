# Contributor: Jesus Lazaro Plaza <jesuslazaro84@gmail.com>

pkgname=pywireless
pkgver=3.3
pkgrel=3
pkgdesc="A basic wireless connection monitor with DCOP support"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=28637"
license="GPL"
depends=('python' 'pyqt3' 'pykde' 'kdebase')
source=(http://www.kde-apps.org/CONTENT/content-files/28637-PyWireless-$pkgver.tar.gz)
md5sums=('0be1a49f46bcbce7cb95f29713e49c67')

build() {
  cd $startdir/src/PyWireless-$pkgver
  make || return 1
  make PREFIX=$startdir/pkg install
}
