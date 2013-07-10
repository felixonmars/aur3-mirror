# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=scalpel-sound
pkgver=0.8.2
pkgrel=1
pkgdesc="A fast and lightweight destructive audio editor written in Python."
arch=(i686 x86_64)
url="https://pypi.python.org/pypi/scalpel"
license=('GPL')
depends=('python2-numpy' 'python2-pyalsaaudio' 'pygtk')
makedepends=('cython2')
install="$pkgname.install"
source=("https://pypi.python.org/packages/source/s/scalpel/scalpel-$pkgver.tar.gz" "$pkgname.desktop"
        "http://www.openclipart.org/image/128px/svg_to_png/pitr_scissors_half-open_icon.png")
md5sums=('724a4a0561ed97a05f1491bb4bf3cf93'
         '745243c79051808fde763f5c5f4fc732'
         '678d3c0e9ba0ada3fa46a5817b9cbb83')

prepare() {
  cd "$srcdir/scalpel-$pkgver"

  # python2 shebang
  sed -i "s|env python$|&2|g" `grep -rl "env python" .`
}

build() {
  cd "$srcdir/scalpel-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/scalpel-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  # rename scalpel to prevent conflict with scalpel
  mv "$pkgdir/usr/bin/scalpel" "$pkgdir/usr/bin/$pkgname"

  # desktop file
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ../pitr_scissors_half-open_icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
