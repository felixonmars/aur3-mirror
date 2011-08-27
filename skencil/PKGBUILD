# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Michael Krauss <mickraus@googlemail.com>

pkgname=skencil
pkgver=1.0alpha_rev784
pkgrel=1
pkgdesc="An interactive vector drawing program for X (similar to XFigor tgif), written almost completely in Python"
arch=(i686 x86_64)
url="http://sk1project.org/viewpage.php?page_id=21"
license=('GPL')
depends=('python-imaging' 'pygtk' 'python-reportlab' 'tk')
install=("$pkgname.install")
source=("http://sk1project.org/dc2.php?target=$pkgname-$pkgver.tar.gz"
        "http://sk1project.org/images/news/pict007.png")
md5sums=('b4c259243c0a5a400b59a5e315f3ae55'
         'e930b652260747068ac2b4776ea05da1')

build() {
  cd "$srcdir/$pkgname-${pkgver/_*}"

  # Python2 fixes
  export PYTHON="python2"
  sed -e "s|\(env python\).*|\12|;s|\(bin/python\).*|\12|" \
    -i `grep -Erl "(env python|bin/python)" .`

  # Fix "python -c" invocation
  sed -i "s|python |python2 |" src/Sketch/Base/gtkutils.py

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver/_*}"

  python2 setup.py install --prefix=/usr --root="$pkgdir"

  # Replace pixmap with a better image
  install -Dm644 ../pict007.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
