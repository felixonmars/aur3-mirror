# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=dejavu
_mypkgname=Dejavu
pkgver=1.5.0RC1
pkgrel=2
pkgdesc="Dejavu is thread-safe Object-Relational Mapper for Python applications"
arch=(i686)
url="http://www.aminus.net/dejavu"
license=('GPL')
depends=('python')
source=(http://www.aminus.net/dejavu/chrome/common/releases/$_mypkgname-$pkgver.zip)
md5sums=('fa062f3254cc6a55d7cc23b6669db334')

build() {
  cd $startdir/src/$_mypkgname-$pkgver
  python djvsetup.py install --root=$startdir/pkg
}
