# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=minaton
pkgver=0.0.1
pkgrel=1
pkgdesc="A music software synthesizer project"
arch=(i686 x86_64)
url="http://sourceforge.net/p/minaton/home/Home/"
license=('GPL')
depends=('jack' 'fltk')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname.tar.gz")
md5sums=('2aacff590694be6deab1ac11ca5e533b')

build() {
  cd "$srcdir"

  # patches and waves path fix
  sed -i "s_\"\([^\"]*s/\)_\"/usr/share/$pkgname/\1_" *.cpp

  make
}

package() {
  cd "$srcdir"

  # bin
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

  # data
  install -d ${pkgdir}/usr/share/$pkgname/{patches,waves}
  install -Dm644 patches/* "$pkgdir/usr/share/$pkgname/patches"
  install -Dm644 waves/* "$pkgdir/usr/share/$pkgname/waves"
}

# vim:set ts=2 sw=2 et:
