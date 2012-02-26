# Maintainer: M Rawash <mrawash@gmail.com>
# Contributer: Lukas Papiewski <papi@papiewski.pl>
pkgname=mrxvt-utf8-svn
pkgver=404
pkgrel=2
pkgdesc="A multi-tabbed X terminal emulator based on rxvt code, with utf-8 support"
arch=(any)
url="http://materm.sourceforge.net"
license=('GPL')

depends=('libpng' 'libjpeg' 'libxft' 'libxpm')
makedepends=('subversion')
replaces=('mrxvt' 'mrxvt-svn' 'mrxvtutf8-svn')
conflicts=('mrxvt' 'mrxvt-svn')
provides=('mrxvt' 'mrxvt-svn=$pkgver')

_svntrunk=https://materm.svn.sourceforge.net/svnroot/materm/mrxvt05utf8
_svnmod=mrxvt

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  ./bootstrap.sh
  LIBS=-lfreetype ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --mandir=/usr/man \
              --enable-everything \
              --disable-debug \
              --with-save-lines=2048

  make || return 1
  make DESTDIR=${pkgdir} install
}
