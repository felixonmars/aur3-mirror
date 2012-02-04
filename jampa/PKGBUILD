# Contributor: Jérémie Devauchelle <j.devauchelle at gmail dot com>

pkgname=jampa
pkgver=0.3.0
pkgrel=1
pkgdesc="A java music player"
arch=('i686')
url="http://sourceforge.net/projects/jampa/"
depends=(java-runtime mplayer)
makedepends=(zip)
license=("GPL3")
source=(http://dfn.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-linux-gtk-x86-$pkgver.tar.gz
	  jampa.desktop)

build() {
  cd $startdir/src/$pkgname-$pkgver || return 1  

  # install jampa
  mkdir -p $startdir/pkg/usr/share || return 1
  mv $startdir/src/$pkgname-$pkgver $startdir/pkg/usr/share || return 1

  # install .desktop file
  mkdir -p $startdir/pkg/usr/share/applications	|| return 1
  install -m644 $startdir/src/jampa.desktop $startdir/pkg/usr/share/applications/jampa.desktop || return 1

  # make a symlink in /usr/bin
  mkdir -p $startdir/pkg/usr/bin || return 1
  ln -sf /usr/share/$pkgname-$pkgver/$pkgname ${pkgdir}/usr/bin/${pkgname} || return 1

}
md5sums=('8070efb509a41b0a70b61a473755a86c'
	  'c3db4a2d7eca08c3ea1762d1c3ed2555')
 
