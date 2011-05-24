# Maintainer: jeepee <jeepee@ulyssis.be>

pkgname=linthesia
_pkgmaj=0.4
pkgver=0.4_2
pkgrel=2
pkgdesc="Piano tutor and game which uses piano-roll-style falling notes with any MIDI file"
arch=('i686' 'x86_64')
url="http://linthesia.sourceforge.net/"
license=('GPL')
depends=("portmidi" "alsa-lib" "gtkmm" "gconfmm" "gtkglextmm")
install=linthesia.install
source=(http://downloads.sourceforge.net/project/linthesia/v$_pkgmaj/$pkgname-${pkgver//_/-}.src.tgz makefile.patch linthesia.install)
md5sums=('548a9a944a4a2d4445406e3b133e56be'
         '2b8c841b036013647dbffd9f17a5422f'
         '61263f5b936ba669fc4090e672f5be1a')

build() {
  cd "$srcdir/$pkgname"
  patch -Np0 -i ../makefile.patch || return 1
  GRAPHDIR=/usr/share/linthesia/graphics make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install

  # install music-directory
  mkdir "$pkgdir/usr/share/linthesia/music"
  cp -r music/* "$pkgdir/usr/share/linthesia/music"
}

# vim:set ts=2 sw=2 et:
