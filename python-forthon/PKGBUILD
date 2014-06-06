# Maintainer:  <clu@nimbus>

pkgname=python-forthon
_pkgname=Forthon
pkgver=0.8.15
pkgrel=3
pkgdesc="Python wrapper generator for Fortran"
arch=('i686' 'x86_64')
url="http://hifweb.lbl.gov/Forthon/"
license=('custom:LLNL')
groups=()
depends=('python' 'python-numpy' 'gcc-fortran')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(https://github.com/dpgrote/$_pkgname/archive/$pkgver.tar.gz)
md5sums=('8c1b975804259963cf6cfea6b64770d1')
noextract=()

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root=$pkgdir --prefix=/usr --optimize=1

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 License.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  cp $pkgdir/usr/bin/Forthon3 $pkgdir/usr/bin/Forthon
}
