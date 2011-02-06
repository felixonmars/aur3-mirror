# Contributor: Dan McGee <dpmcgee@gmail.com>

pkgname=monotone-viz
pkgver=1.0.2
pkgrel=1
pkgdesc="monotone-viz is a small GTK+ app to visualize monotone ancestory graphs"
url="http://oandrieu.nerim.net/monotone-viz/"
license="GPL"
arch=(i686 x86_64)
makedepends=('ocaml')
depends=('monotone' 'graphviz' 'gtk2' 'libgnomecanvas' 'lablgtk2' 'openssl')
source=(http://oandrieu.nerim.net/$pkgname/$pkgname-$pkgver-nolablgtk.tar.gz \
        monotone-viz.desktop monotone-viz.png )
md5sums=('fd08341b456c80d03d7d21c989a1e813' '0858982f070527a40e5c730b0bd6fafb'\
         '30162a3fca63f922bbc4150ead1dbb0a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  # some patches to make it work with monotone >= 0.46 and graphviz
  patch -p0 < $startdir/monotone-viz-0_46.patch || return 1
  patch -p1 < $startdir/monotone-viz-agraph.patch || return 1

  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install

  #install freedesktop files
  mkdir -p $startdir/pkg/usr/share/{applications,pixmaps}
  install -m644 $startdir/src/monotone-viz.desktop $startdir/pkg/usr/share/applications/monotone-viz.desktop
  install -m644 $startdir/src/monotone-viz.png $startdir/pkg/usr/share/pixmaps/monotone-viz.png
}
