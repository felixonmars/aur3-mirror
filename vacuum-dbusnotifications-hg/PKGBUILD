# Maintainer: Mikhail Borisov <borisov.mikhail@gmail.com>

pkgname=vacuum-dbusnotifications-hg
pkgver=10
pkgrel=1
pkgdesc="DBus notification plugin for Vacuum IM"
arch=('i686' 'x86_64')
url="http://code.google.com/p/vacuum-plugins/"
license=('GPL')
depends=(vacuum)
makedepends=('mercurial' 'git')
provides=(vacuum-dbusnotifications)

_hgroot="https://dbusnotifications.vacuum-plugins.googlecode.com/hg/"
_hgrepo="vacuum-plugins-dbusnotifications"

_vacuum_git="git://gitorious.org/vacuum-im/vacuum-im.git"
_vacuum_repo="vacuum"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
    cd "$srcdir"
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"

  msg "Fetching Vacuum sources from git"

  if [ -d $_vacuum_repo ] ; then
    cd $_vacuum_repo
    git pull
    msg "The local files are updated."
    cd "$srcdir"
  else
    git clone $_vacuum_git $_vacuum_repo
  fi

  msg "Starting make..."

  rm -rf "$_hgrepo-build"
  cp -r "$_hgrepo" "$_hgrepo-build"
  cd "$_hgrepo-build"

  qmake "INSTALL_PREFIX=$pkgdir/usr" "VACUUM_SOURCE_PATH=$srcdir/$_vacuum_repo"
  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make install
} 
