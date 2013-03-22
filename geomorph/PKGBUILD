#contributor: kagan <juanynie AT ono DOT com>

pkgname=geomorph
pkgver=0.60.1
pkgrel=1
pkgdesc="Geomorph is a height field generator and editor for the Linux operating system."
url="http://geomorph.sourceforge.net"
license="GPL"
depends=('gtkglext' 'libpng')
optdepends=('povray')
arch=('i686' 'x86_64')
source=(http://sourceforge.net/projects/geomorph/files/geomorph/0.60/$pkgname-$pkgver.tar.gz)
md5sums=('91d46ac4b2d1a630bca712d675cb3b25')

build() {
  cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=$startdir/pkg install

# Install desktop shortcut
  install -D -m 0644 $startdir/pkg/usr/share/geomorph/geomorph.desktop $startdir/pkg/usr/share/applications/geomorph.desktop

# Install icon
  install -D -m 0644 $startdir/pkg/usr/share/geomorph/GeoMorph.xpm $startdir/pkg/usr/share/pixmaps/GeoMorph.xpm
}
