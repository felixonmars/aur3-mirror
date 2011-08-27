
# Contributor: imagelife <lovelinux229@gmail.com>
pkgname=ruijieclient-svn
pkgver=118
pkgrel=1
pkgdesc="a ruijie network supplicant for GNU/Linux"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ruijieclient/"
license=('LGPL3')
depends=('libpcap' 'libxml2')
makedepends=('subversion')
provides=('ruijieclient')
conflicts=('ruijieclient')
source=()
md5sums=()

_svntrunk=http://ruijieclient.googlecode.com/svn/trunk/
_svnmod="ruijieclient"


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

  ./autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
  
}

# vim:set ts=2 sw=2 et:
