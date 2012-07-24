# Contributor: Yavor Stoychev <stoychev.yavor at gmail>

pkgname=sharescanner
_pkgname=share-scanner
pkgver=0.1.0
pkgrel=1
pkgdesc="The GNOME share scanner"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/share-scanner/"
license=('GPL3')
depends=('python2' 'pysmbc' 'python2-gobject')
source=(http://downloads.sourceforge.net/project/$_pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('949fb6f97c6cbf52fdd6b5e5cc0e6e4c')
conflicts=(sharescanner-git)
provides=()
options=(!emptydirs)
install=sharescanner.install

package() {
  cd $srcdir
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
