# Maintainer: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=dxfwrite
pkgver=1.2.0
pkgrel=1
pkgdesc="A Python library to create DXF R12 drawings"
arch=(any)
url="https://bitbucket.org/mozman/dxfwrite/overview"
license=('GPL3')
depends=('python2')
optdepends=()
makedepends=('mercurial')
provides=('dxfwrite')
conflicts=('dxfwrite-hg')
replaces=()
backup=()
options=(!emptydirs)
source=(https://bitbucket.org/mozman/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('7f97a3c0cbde6834acd0931128378579')

build()
{
  # Install using setup.py
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
