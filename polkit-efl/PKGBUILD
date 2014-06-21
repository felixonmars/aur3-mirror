# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=polkit-efl
pkgver=0.1.0
pkgrel=1
pkgdesc="Polkit Authentication Agent using EFL"
arch=('any')
url="http://www.enlightenment.org"
license=('GPL3' 'LGPL: Icons')
depends=('python-efl' 'polkit')
optdepends=('python-psutil: For process details')
source=("http://download.enlightenment.org/pre-releases/$pkgname-$pkgver.tar.bz2")
sha1sums=('6df6b00d0bb3597acb4f0707b261ceeb0a8d044f')

prepare() {
  sed -i 's|libexec|lib/polkit-efl|' "$srcdir/$pkgname-$pkgver/setup.py"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir"
}
