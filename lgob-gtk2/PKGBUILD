# Maintainer: Fabien COUTANT
# Contributor: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=lgob-gtk2
pkgver=11.04
pkgrel=1
pkgdesc="Bindings of GObject-based libraries (GTK, WebKitGtk, etc) and some others (Cairo, etc) for Lua. -- latest version for GTK2"
arch=(i686 x86_64)
url="http://oproj.tuxfamily.org" 
depends=('lua>=5.1' 'gtk2')
makedepends=( gtkglext gtkspell vte libwebkit gtksourceview2 goocanvas1 gstreamer0.10-base )
conflicts=( lgob )
optdepends=(
    'gtkglext: OpenGL for GTK support'
    'gtkspell: spelling for GTK support'
    'vte: terminal for GTK support'
    'libwebkit: WebKit web browser support'
    'gtksourceview2: colorizing editor support'
    'goocanvas1: drawing canvas support'
    'gstreamer0.10-base: GStreamer sound support'
)
#    'poppler-glib: PDF for GTK support'
license=('LGPL')
source=("http://downloads.tuxfamily.org/oproj/lgob/lgob-$pkgver.tar.bz2")
md5sums=('1e943299ab2462e4d9d9c4443d65fafb')

build() { 
  cd "$srcdir/lgob-$pkgver"
  sed -i "s,-Os,$CFLAGS,; s,-Wall,-w -pipe," config.lua

  if [ ${CARCH} = 'i686' ]; then
    lua build_all.lua $pkgdir/usr
  else
    lua build_all.lua $pkgdir/usr AMD64
  fi

  # examples
  install -d "$pkgdir/usr/share/doc/lgob/examples"
  install -Dm644 examples/* "$pkgdir/usr/share/doc/lgob/examples"

  sed -i "s,$pkgdir,," $pkgdir/usr/bin/*
}
