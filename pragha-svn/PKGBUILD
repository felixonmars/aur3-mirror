# Maintainer:  blkqi    <blk at blk dot me>
# Contributor: Lyceuhns <lyceuhns at gmail dot com>

pkgname=pragha-svn
pkgver=346
pkgrel=1
pkgdesc="A lightweight GTK+ music manager"
url="http://pragha.wikispaces.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('curl' 'dbus-glib' 'gtk2>=2.16' 'libao' 'libcdio' 'libmad' 'libmodplug' 'libnotify' 'libsndfile' 'sqlite3' 'taglib' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('autoconf' 'pkgconfig' 'subversion' 'xfce4-dev-tools')
conflicts=('pragha')
provides=('pragha')
install=pragha.install
source=()
md5sums=()

_svntrunk=http://dissonance.googlecode.com/svn/trunk/
_svnmod=pragha

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  #sed -i '58s|^//||' ./src/pragha.h

  chmod +x autogen.sh
  ./autogen.sh

  ./configure --prefix=/usr
  make || return 1
  make ${MAKEFLAGS} DESTDIR=${pkgdir} install
  
  install -m 644 data/pragha.desktop ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/pixmaps
  install -m 644 data/pragha.png ${pkgdir}/usr/share/pixmaps/
  install -m 644 data/pragha.1 ${pkgdir}/usr/share/man/man1/

  rm -rf ${srcdir}/$_svnmod-build
}

# vim:set ts=2 sw=2 et:
