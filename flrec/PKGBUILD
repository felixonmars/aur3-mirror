# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=flrec
pkgver=0.13
pkgrel=3
pkgdesc="Simple audio hard disk recorder and player(sox backend). It can directly record in wav, mp3, ogg-vorbis etc..."
arch=('i686' 'x86_64')
url="http://archive.today/Ngkky"
license=('GPL2')
depends=('fltk' 'sox')
source=(http://distro.ibiblio.org/vectorlinux/VL64-7.0/source/sourceVL/flrec/0.13/src/flrec-0.13.tar.bz2
        $pkgname.desktop)
md5sums=('87664c79101ba0657c39b52593522e6a'
         '5706ccc38189bf90d65995b34d7d2851')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  # Fix FLTK dynamic library
  sed -i 's|static||' Makefile
}         

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  # Binary
  install -Dm755 flrec $pkgdir/usr/bin/flrec

  # Desktop icon
  install -Dm644 ../flrec.desktop $pkgdir/usr/share/applications/flrec.desktop
  install -Dm644 icon/flrec.png $pkgdir/usr/share/pixmaps/flrec.png

  # License
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Man page
  install -Dm644 flrec.1.gz $pkgdir/usr/share/man/man1/flrec.1.gz
}
