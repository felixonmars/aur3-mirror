# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
pkgname=oprofileui-svn
pkgver=197
pkgrel=1
pkgdesc="User interface for OProfile"
arch=('i686')
url="http://projects.o-hand.com/oprofileui"
license=('GPL')
depends=('gtk2' 'libglade' 'libxml2' 'gnome-vfs' 'avahi')
makedepends=('gcc' 'intltool' 'autoconf' 'automake' 'libtool' 'subversion')
provides=('oprofileui')
conflicts=('oprofileui')

_svntrunk=http://svn.o-hand.com/repos/oprofileui/trunk
_svnmod=oprofileui

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
  ./autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
}
