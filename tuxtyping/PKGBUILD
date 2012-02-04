# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: StoMoX

pkgname=tuxtyping
pkgver=1.8.0
pkgrel=1
pkgdesc="an educational typing tutor for kids starring Tux."
arch=('i686' 'x86_64')
url="http://tux4kids.alioth.debian.org/tuxtype/"
license=('GPL' 'custom')
depends=('sdl_image' 'sdl_mixer' 'sdl_pango')
options=('!docs')
source=(https://alioth.debian.org/frs/download.php/3175/tuxtype_w_fonts-$pkgver.tar.gz 
tuxtyping.desktop)
md5sums=('7294fc19db32a3134bd4112e9cb604c4'
         '12bb27f8340d730a2b7ff2cdb9c0dbeb')

build() {
  cd "$srcdir"/tuxtype_w_fonts-$pkgver

  # build
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  # install licenses
  install -Dm644 doc/OFL \
    "$pkgdir"/usr/share/licenses/$pkgname/OFL

  # install licenses
  install -Dm644 "$srcdir"/tuxtyping.desktop \
    "$pkgdir"/usr/share/applications/tuxtyping.desktop
}
