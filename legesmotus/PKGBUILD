# Maintainer: Gadget3000 <gadget3000 at msn dot om>
# Contributor: Chris Baker <baker.chris.3@gmail.com>
pkgname=legesmotus
pkgver=0.4.0
pkgrel=1
pkgdesc="A team-based, networked, 2D shooter set in zero-gravity"
arch=('i686' 'x86_64')
url="http://legesmotus.endrift.com/index.php/Main_Page"
license=('GPL2')
depends=('sdl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'libgl' 'hicolor-icon-theme' 'gcc-libs')
install=(legesmotus.install)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz
        legesmotus.desktop)
md5sums=('9ce454f8482942fd5dd0d9209add53b9'
         '0c152db8f732052f41c4a27d06fccd0a')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man || return 1
  make || return 1
  make DESTDIR=$pkgdir/ install || return 1
  rm $pkgdir/usr/share/applications/mimeinfo.cache
  install -D -m644 data/sprites/blue_head256.png $pkgdir/usr/share/pixmaps/legesmotus.png
  install -D -m644 $srcdir/legesmotus.desktop $pkgdir/usr/share/applications/legesmotus.desktop
}
