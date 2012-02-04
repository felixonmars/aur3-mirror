# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=shoebot
pkgver=0.2
pkgrel=2
pkgdesc="Shoebot is a pure Python graphics robot"
arch=('any')
url="http://tinkerhouse.net/shoebot/"
license=('GPL3')
depends=('pygtk' 'python-imaging' 'pygtksourceview2')
install="$pkgname.install"
source=("http://tinkerhouse.net/shoebot/packages/$pkgname-src-latest.tar.gz")
md5sums=('9a341d7474e3efa5ff4b0ac2c0265480')

build() {

  cd "$srcdir/$pkgname-$pkgver.orig"

  # Python2 build
  export PYTHON="python2"
  sed -i "s_env python_&2_" `grep -rlE "env python$" .`

  python2 setup.py install --prefix=/usr --root="$pkgdir/"
}
