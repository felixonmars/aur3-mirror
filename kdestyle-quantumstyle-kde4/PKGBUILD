# Contributor: maddien <martinstitz@gmx.de>
# Maintainer: vicky91 <vickypaiers@gmail.com>
pkgname=kdestyle-quantumstyle-kde4
pkgver=RC8
pkgrel=2
pkgdesc="An SVG themeable style for Qt4 and KDE4."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/QuantumStyle?content=101088"
license=("GPL")
depends=('qt')
makedepends=()
conflicts=()
source=(http://saidlankri.free.fr/QuantumStyle-$pkgver.tar.bz2)
md5sums=('7925aa06f02d578ab952f4117a25c81f')

build() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/qt/plugins/styles

  cd $srcdir/QuantumStyle
  
  qmake || return 1
  make || return 1
  
  cp $srcdir/QuantumStyle/style/libquantumstyle.so $pkgdir/usr/lib/qt/plugins/styles/libquantumstyle.so || return 1
  cp $srcdir/QuantumStyle/themebuilder/qsthemebuilder $pkgdir/usr/bin/qsthemebuilder || return 1
}