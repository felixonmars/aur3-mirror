# Maintainer : Wei Hu <weihu@cs.virginia.edu>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>, Sergej Pupykin <pupykin.s+arch@gmail.com>, Vesa Kaihlavirta <vegai@iki.fi>

pkgname=gtk2hs-darcs
pkgver=20100205
pkgrel=1
pkgdesc="A GTK+2 binding for Haskell"
license=('LGPL')
url="http://gtk2hs.sourceforge.net"
arch=('i686' 'x86_64')
conflicts=('gtk2hs')
makedepends=('ghc' 'alex' 'happy' 'darcs')
depends=('libglade' 'gtksourceview2' 'gconf' 'librsvg>=2.16' 'gtkglext' 'haskell-mtl')
provides=('gtk2hs')
options=('strip' 'docs' 'zipman')
install=gtk2hs.install
source=()
md5sums=()
_darcstrunk="http://code.haskell.org"
_darcsmod="gtk2hs"

build() {
  cd $srcdir

  if [[ -d $_darcsmod/_darcs ]]
  then
    msg "Retrieving missing patches"
    cd $_darcsmod
    darcs pull -a $_darcstrunk/$_darcsmod
  else
    msg "Retrieving complete sources"
    darcs get --lazy $_darcstrunk/$_darcsmod
    cd $_darcsmod
  fi
  
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/gnome/lib/pkgconfig

  autoreconf
  ./configure --prefix=/usr --enable-libglade --enable-gconf \
		--enable-svg --enable-opengl \
		--without-pkgreg --disable-split-objs

  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  mkdir -p $pkgdir/usr/share/doc/gtk2hs
  cp -r demo $pkgdir/usr/share/doc/gtk2hs/
}

