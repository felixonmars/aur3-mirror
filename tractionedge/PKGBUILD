# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>

pkgname=tractionedge
pkgver=0.1
pkgrel=2
pkgdesc="Steampunk turn based strategy game with roguelike elements."
arch=('i686' 'x86_64')
url="http://code.google.com/p/tractionedge/"
license=('GPL3')
makedepends=('cmake')
depends=('gcc-libs' 'libgl' 'sfml' 'zlib' 'libjpeg-turbo' 'freetype2' 'glibc')
source=(http://$pkgname.googlecode.com/files/$pkgname-v$pkgver.tgz
      'tractionedge.sh'
      'tractionedge0.1_sfmlgit.patch_r2')
md5sums=('bb2d5cca3cd24bd23c8b3d5b064aab08'
         'f6a0145bc21ad05c04181c2354e873b5'
         '2491b594e64eed591603a49b0c2ffcb4')

build() {
  _dest_dir="$pkgdir/usr/share/$pkgname"
  mkdir -p $_dest_dir/{fonts,images,maps}
  chown -R :games $_dest_dir
  chmod -R g+rw $_dest_dir

  cd "$srcdir/$pkgname-v$pkgver/"

  patch -i $srcdir/tractionedge0.1_sfmlgit.patch_r2 -p1
  cmake .
  make

  install -D -m 644 fonts/* $_dest_dir/fonts
  install -D -m 644 images/* $_dest_dir/images
  install -D -m 644 maps/* $_dest_dir/maps
  install -D -m 755 $pkgname $_dest_dir
  install -T -D -m 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
