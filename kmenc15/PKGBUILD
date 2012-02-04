# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Charly <cgharlyghislain@gmail.com>
pkgname=kmenc15
pkgver=0.04
pkgrel=2
pkgdesc="An advanced KDE/Qt MEncoder frontend."
arch=(i686)
url="http://kmenc15.sourceforge.net/"
license=('GPL')
depends=('qt' 'kdelibs' 'mplayer')
makedepends=()
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
	kmenc15.desktop)
md5sums=('64e46a32cd055516b9d82f60836eefcb' '44a63276a3f8129d314cf623c935e936')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed s/khtmlpart/khtml_part/g wcon.ui > wcon.ui.new
  mv wcon.ui.new wcon.ui
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -d $startdir/pkg/opt/kde/share/applications/kde/
  install -m 644 $startdir/src/$pkgname.desktop $startdir/pkg/opt/kde/share/applications/kde/
}
