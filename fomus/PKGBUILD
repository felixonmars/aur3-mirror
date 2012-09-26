# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=fomus
pkgver=0.1.18_alpha
pkgrel=2
pkgdesc="Automatic music notation application for musicians and composers."
arch=(i686 x86_64)
url="http://fomus.sourceforge.net/"
license=('GPL3')
depends=('boost-libs' 'libltdl')
makedepends=('graphviz' 'imagemagick' 'libxml2' 'swig' 'libtool' 'pd')
optdepends=('lilypond: lilypond support'
            'emacs: emacs support'
            'pd: pd support'
            'cm: common music and grace support')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-${pkgver//_/-}.tar.gz"
        "$pkgname-boost-1.50.0.patch")
md5sums=('b26a2f55d393385a5db9681bc27d3cfc'
         'dbc0c71bc1f314c3a780cf78fb058c9c')

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"

  # boost 1.50.0 patch
  patch -p1 -i ../${source[1]}

  ./configure --prefix=/usr \
              --enable-static=no \
              --with-puredata
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"

  make DESTDIR="$pkgdir/" install

  # install pd extension in the right path
  install -d "$pkgdir/usr/lib/pd/extra"
  mv "$pkgdir/usr/share/$pkgname/$pkgname.pd_linux" "$pkgdir/usr/lib/pd/extra"
}

# vim:set ts=2 sw=2 et:
