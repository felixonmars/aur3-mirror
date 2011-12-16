# Maintainer: mickael9 <mickael9 at gmail dot com>
pkgname=algodoo-beta
pkgver=1.7.6
_realver=${pkgver//./_}
pkgrel=1
pkgdesc="a physics simulator program for education and fun (based on phun)"
arch=(i686)
url="http://www.algodoo.com/"
license=('custom:commercial')
depends=(boost-libs sdl_image libjpeg6 libzip mesa libpng12 curl pango glew)
source=(algodoo.desktop)

md5sums=( 'c6de80d5c8ff78724877d68ae2a3aedd' )

build() {
  mkdir -p "$pkgdir/opt/Algodoo/lib"
  cp -r "$srcdir/Algodoo" "$pkgdir/opt/"

  for lib in cv cxcore highgui; do
    cp "$srcdir"/lib${lib}.so.* "$pkgdir/opt/Algodoo/lib"
  done

  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/Algodoo/algodoo "$pkgdir/usr/bin/algodoo"

  install -D "$srcdir/algodoo.desktop" "$pkgdir/usr/share/applications/algodoo.desktop"
}

# vim:set ts=2 sw=2 et:

