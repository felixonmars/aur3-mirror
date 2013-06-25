# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=neurolab
pkgver=1.2.3
pkgrel=1
pkgdesc="Neurocognitive Linguistics Lab"
arch=(i686 x86_64)
url="https://bitbucket.org/kulibali/neurocogling/wiki/Home"
license=('custom:BSD')
depends=('qt4' 'glu')
install="$pkgname.install"
source=("https://bitbucket.org/kulibali/neurocogling/get/$pkgver.tar.bz2"
        "$pkgname.png::http://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Brain_Surface_Gyri.SVG/64px-Brain_Surface_Gyri.SVG.png"
        "$pkgname.desktop")
md5sums=('94e6a81f28a01ca5d0c11330ea0abb54'
         'fcb1b9a49a071480ca3c3c725ebda4ce'
         '8057430307dc932460a525ef1d606824')

prepare() {
  cd "$srcdir/kulibali-"*/src

  # missing glu.h (gluPerspective)
  sed -i "44a#include <GL/glu.h>" griditems/gridviewer.cpp

  # link the griditem plugin against libGLU
  sed -i '70s/$/ -lGLU -lGL/' griditems/griditems.pro

  # set plugin path to /usr/lib/neurolab/plugins
  sed -i '/pluginPath/s/QCore[^"]*"/"\/usr\/lib\/neurolab/' neurogui/mainwindow.cpp
}

build() {
  cd "$srcdir/kulibali-"*/src
  qmake-qt4 neurolab_all.pro
  make
}

package() {
  cd "$srcdir/kulibali-"*/src

  # bin
  install -Dm755 release/$pkgname "$pkgdir/usr/bin/$pkgname"

  # plugins
  install -d "$pkgdir/usr/lib/$pkgname/plugins"
  cp -a release/plugins/* "$pkgdir/usr/lib/$pkgname/plugins"

  # libs
  cp -a release/*.so.* "$pkgdir/usr/lib"

  # docs
  install -Dm644 ../doc/manual.pdf "$pkgdir/usr/share/$pkgname/docs/manual.pdf"

  # examples
  install -d "$pkgdir/usr/share/$pkgname/examples"
  install -Dm644 ../samples/* "$pkgdir/usr/share/$pkgname/examples"

  # desktop file
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # license
  install -Dm644 ../LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
