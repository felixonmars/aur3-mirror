# Maintainer: Michal Gawronski <dinth1906@gmail.com>
# Contributor: Simon Lackerbauer <calypso "at"   strpg.org>
# Upd: The_k586
# Upd: fredbezies <fredbezies@gmail.com>

pkgname=liferea-ext4-indicate-svn
pkgver=5402
pkgrel=2
pkgdesc="A news aggregator for GTK (svn version with ext4 and libindicate patches)"
arch=('i686' 'x86_64')
url="http://liferea.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'gconf' 'libxml2' 'sqlite3' 'libxslt' 'libwebkit>=1.1.11' 'libunique' 'libindicate' 'indicator-messages')
makedepends=('autoconf' 'intltool' 'subversion')
conflicts=('liferea' 'liferea-ext4')
provides=('liferea' 'liferea-ext4')
source=('libindicate.patch'
	'getenv_sync.patch')
md5sums=('bdbe7dea2bce630da0f9844e9f35e449'
         'a2724ece5abef7a3c42e44dfdeab06b5')
_svntrunk=https://liferea.svn.sourceforge.net/svnroot/liferea/trunk
_svnmod=liferea

build() {
  cd $startdir/src/
  if [ -d $_svnmod/$_svnmod/.svn ]; then
      cd $_svnmod/$_svnmod
      svn update
      cd ..
  else
      svn co $_svntrunk --config-dir ./ $_svnmod
  fi
  cd $_svnmod/
  ls -l
  msg "SVN checkout done or server timeout"
  msg "starting autoconf"
  cd $_svnmod/
  autoreconf -i
  intltoolize
  msg "starting ./configure"
  patch -Np1 -i ../../getenv_sync.patch || return 1
  patch -Np1 -i ../../libindicate.patch || return 1
  sh autogen.sh
  ./configure --prefix=/usr
  msg "starting make ..."
  make || return 1
  make DESTDIR=$startdir/pkg mangdir=/usr/man/man6 install
}

