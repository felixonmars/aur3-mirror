# Maintainer: Francesco Marella <francesco.marella@anche.no>

pkgname=python2-sadisplay
pkgver=0.3.6dev
pkgrel=1
pkgdesc="SQLAlchemy schema display script"
arch=(any)
url="https://bitbucket.org/estin/sadisplay/wiki/Home"
license=("BSD")
depends=(
    "python2"
    "python2-sqlalchemy>=0.5")
makedepends=("python2-distribute")
source=(
    "https://pypi.python.org/packages/source/s/sadisplay/sadisplay-$pkgver.tar.gz")
noextract=()
md5sums=('855c8ae1bdc66473dd6debdbc044d431')

package() {
    cd $srcdir/sadisplay-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
