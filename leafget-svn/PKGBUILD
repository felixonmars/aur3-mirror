# Maintainer:  TDY <tdy@gmx.com>
# Contributor: lh <jarryson@gmail.com>

pkgname=leafget-svn
pkgver=49
pkgrel=1
pkgdesc="A GTK+ download manager"
arch=('i686' 'x86_64')
url="http://leafget.googlecode.com/" 
license=('GPL')
depends=('gtk2' 'libsigc++2.0')
makedepends=('intltool>=0.35.0' 'pkgconfig>=0.9.0' 'subversion')
options=('!docs')
provides=('leafget')
conflicts=('leafget')

_svntrunk=http://leafget.googlecode.com/svn/trunk
_svnmod=leafget

build() { 
  cd "$srcdir"

  if [[ -d $_svnmod/.svn ]]; then
    cd $_svnmod && svn --config-dir ../ up -r $pkgver && cd ..
  else
    svn --config-dir ./ co $_svntrunk  -r $pkgver $_svnmod
  fi

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  sed -i 's#gnome-talk.png#/usr/share/pixmaps/leafget.xpm#' $_svnmod.desktop.in
  chmod +x configure
  sh autogen.sh --prefix=/usr --docdir=/usr/share/doc
  make ||return 1
  make DESTDIR="$pkgdir" install
  install -Dm644 data/shamrock.xpm "$pkgdir/usr/share/pixmaps/$_svnmod.xpm"
}
