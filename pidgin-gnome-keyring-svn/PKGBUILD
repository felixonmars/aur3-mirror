# Maintainer: Juan Diego Tascon

pkgname=pidgin-gnome-keyring-svn
pkgver=4
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Pidgin stores passwords as plaintext with the save password function. This plugin saves all passwords to the gnome keyring."
url="http://code.google.com/p/pidgin-gnome-keyring/"
license=('GPL')
depends=('pidgin' 'gnome-keyring' 'perlxml' 'gettext' 'notification-daemon')
makedepends=('subversion')

_svntrunk=http://pidgin-gnome-keyring.googlecode.com/svn/trunk/
_svnmod=pidgin-gnome-keyring-read-only

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

  #
  # BUILD
  #
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  mkdir -p "$pkgdir/usr/lib/purple-2/"
  install -m755 gnome-keyring.so "$pkgdir/usr/lib/purple-2/"
}
