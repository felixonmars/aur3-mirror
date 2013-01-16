# Maintainer: TDY <tdy@archlinux.info>
# Contributor: fancris3 <fancris3 at gmail.com>

pkgname=lh-abc
pkgver=3.3.0.1
pkgrel=2
pkgdesc="A flexible BitTorrent client featuring RSS support, integrated search, and command scheduling"
arch=('any')
url="http://code.google.com/p/lh-abc/"
license=('MIT')
depends=('desktop-file-utils' 'python2-crypto' 'wxpython')
install=lh-abc.install
source=(http://$pkgname.googlecode.com/files/LH-ABC-src-$pkgver.zip
        $pkgname-$pkgver.diff)
md5sums=('508845ea6aa8eac0d1265053bfc6bc15'
         '5ec9dee6ebb921e605e7dff345924c89')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.diff
  find -type f -exec sed -i '1s/python/&2/' '{}' \;
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  ln -sf /usr/bin/$pkgname.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
