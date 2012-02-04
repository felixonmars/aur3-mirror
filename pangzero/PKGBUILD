# Contributor: rabyte <rabyte__gmail>

pkgname=pangzero
pkgver=1.3
pkgrel=5
pkgdesc="An enhanced clone of Super Pang, a fast-paced action game that involves popping balloons with a harpoon"
arch=('any')
url="http://apocalypse.rulez.org/pangzero/Pang_Zero"
license=('GPL2')
depends=('sdl_perl-old')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz \
	remove-nag+fps-counter.diff \
	$pkgname.desktop)
md5sums=('57a3ba5bf4f0e4a9590fbd6606c9f91c'
         '38d4ee2aed821fe6f04f2c50728afa36'
         '25cba09eedf85844fddcdeed52287c87')

build() {
  cd $srcdir/$pkgname-$pkgver

  # remove nag (auto-opening of website after quitting game) + FPS counter
  patch -Np0 -i ../remove-nag+fps-counter.diff || return 1

  # Make sure configure finds SDL_Perl (old version)
  PERL5LIB="/opt/sdl_perl" ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  install -m644 -D data/icon.png $pkgdir/usr/share/pixmaps/pangzero.png
  install -m644 -D ../pangzero.desktop $pkgdir/usr/share/applications/pangzero.desktop
  sed -i '2iuse lib "/opt/sdl_perl";' "$pkgdir/usr/bin/pangzero"
}
