# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=dissy
pkgver=10
pkgrel=2
pkgdesc="A graphical frontend to the objdump disassembler for compiler-generated code"
arch=('any')
url="http://dissy.googlecode.com/"
license=('GPL')
depends=('pygtk' 'pywebkitgtk')
install="$pkgname.install"
source=("$url/files/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('04e50e2aa21e34df15617ff04acf4d1e'
         'b8fe41bc149db119035c35985e087847')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir"

  # desktop file and pixmap
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 gfx/icon.svg \
    "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}

# vim:set ts=2 sw=2 et:
