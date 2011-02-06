# $Id: PKGBUILD,v 1.8 2008/11/27 19:59:04 pressh Exp $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Maintainet: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=gsql-svn
pkgver=189
pkgrel=1
pkgdesc="Database development tool."
arch=('i686' 'x86_64')
url="http://gsql.org"
license=('GPL')
depends=('gtk2>=2.12' 'gtksourceview2>=2.0' 'libnotify>=0.4' 'libssh>=0.4' 'vte')
makedepends=('svn')
conflicts=('gsql')
replaces=('gsql')
provides=('gsql')

_svntrunk="http://gsql.googlecode.com/svn/trunk/"
_svnmod="gsql"

build() {
   cd $srcdir

  msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --without-gnome
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  #rm -r $srcdir/$_svnmod-build
}
