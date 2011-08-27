

# Contributor: imagelife <lovelinux229@gmail.com>
pkgname=talkmm-svn
pkgver=107
pkgrel=1
pkgdesc="gtalk in linux base on libjingle."
arch=('i686' 'x86_64')
url="http://code.google.com/p/talkmm/"
license=('GPL')
depends=('gtkmm' 'libsexymm' 'libglademm' 'ilbc' 'speex' 'linphone')
makedepends=('subversion')
provides=('talkmm')
conflicts=('talkmm')
source=()
md5sums=() 

_svntrunk=http://talkmm.googlecode.com/svn/trunk/
_svnmod=talkmm

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

  #
  # BUILD
  #

  #libjingle
  cd "$srcdir/$_svnmod-build/libjingle"
  ./configure
  make

  #talkmm
  cd "$srcdir/$_svnmod-build/talkmm"
  ln -fs "$srcdir/$_svnmod-build/libjingle/talk" "$srcdir/$_svnmod-build/talkmm/src" || return 1
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
