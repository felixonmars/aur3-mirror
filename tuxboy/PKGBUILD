# Contributor: Christoph Zeiler <rabyteNOSPAM_at_gmx.dot.org>

pkgname=tuxboy
pkgver=1.0rc3
pkgrel=4
pkgdesc="An open source GameBoy emulator based on gnuboy"
arch=('i686' 'x86_64')
url="http://tuxemu.foo.se/"
license=('GPL3')
depends=('sdl_image' 'sdl_ttf' 'wiiuse')
makedepends=('make')
install=$pkgname.install
source=(http://tuxemu.byethost31.com/file/${pkgname}_100rc3_lin.zip \
	savedir.diff \
	Makefile.diff \
	$pkgname.desktop)
md5sums=('54afcc228727e6a3c2f3c915170e034a'
         '5a529f77fe7455cea35294b7baa22279'
         'd4955002e3a1fe29681bbfef30430416'
         '88a216fc7da24d9f03205e92bd3a70ca')


build() {
  cd ${pkgname}_lin_100rc3/source

  patch -Np0 -i "$srcdir"/savedir.diff || return 1
  patch -Np0 -i "$srcdir"/Makefile.diff || return 1

  sed	-e "s|roms/|/usr/share/tuxboy/roms/|g" \
	-e "s|system/|/usr/share/tuxboy/system/|g" \
	-i {sdl,sys}.c

  make  || return 1
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/tuxboy.desktop "$pkgdir"/usr/share/applications/tuxboy.desktop
}