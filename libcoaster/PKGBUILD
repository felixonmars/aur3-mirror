# Contributor: Mark Rosenstand <mark@borkware.net>
pkgname=libcoaster
pkgver=0.1pre1
pkgrel=1
pkgdesc="Library designed for central preferences control on burners."
url="http://www.coaster-burner.org/coaster-gui/"
license=""
depends=('libburn' 'libgnomeui' 'x-server')
source=(http://www.coaster-burner.org/files/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('2492abbeda224020324c2df58237d96d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/gnome
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  # libtool slay
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
