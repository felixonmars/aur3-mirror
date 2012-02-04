# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: H.Gökhan Sarı <hsa2@difuzyon.net>

_pkg=hjsplit
pkgname=$_pkg-bin
pkgver=3.1
pkgrel=2
pkgdesc="A popular freeware program to split and recombine files."
arch=('i686' 'x86_64')
url="http://www.hjsplit.org/"
license=('custom:freeware')
options=('!strip')
install="$pkgname.install"
source=("http://www.freebytesoftware.com/download/hjsplitlx.tar.gz"
        "$_pkg.desktop"
        "$_pkg.png::http://www.mricons.com/store/png/110925_27841_128_cut_scissors_icon.png")
md5sums=('c326bd6bdeef92240af354ae60958841'
         '8dc77dfb332a5e093be3de944a443742'
         '14f3876c5831e4e2af68d26aa37b7444')

build() {
  return 0
}

package() {
  cd "$srcdir"

  # bin
  install -Dm755 $_pkg "$pkgdir/usr/bin/$_pkg"

  # license
  install -Dm644 readme.txt \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # desktop file
  install -Dm644 $_pkg.desktop \
                 "$pkgdir/usr/share/applications/$_pkg.desktop"

  # icon
  install -Dm644 $_pkg.png \
                 "$pkgdir/usr/share/pixmaps/$_pkg.png"
}

# vim:set ts=2 sw=2 et:
