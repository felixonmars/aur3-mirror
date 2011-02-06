
# See http://wiki.archlinux.org/index.php/Arch_CVS_&_SVN_PKGBUILD_guidelines
# for more information on packaging from SVN sources.

# Contributor: Denis Martinez <deuns.martinez AT gmail DOT com>
pkgname=nxcl
pkgver=0.9
pkgrel=2
pkgdesc="NX X compression client library"
arch=('i686' 'x86_64')
url="http://freenx.berlios.de/"
license=('GPL')
groups=()
depends=('dbus-core' 'libx11')
makedepends=('subversion' 'autoconf' 'automake' 'libtool')
provides=()
conflicts=()
replaces=()
backup=()
options=(!docs)
install=
source=('gcc43.patch')
noextract=()

_svntag=svn://svn.berlios.de/freenx/tags/freenx-client_freenx-client-0.9/nxcl
_svnmod=nxcl

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntag --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  patch -Np0 -i "$srcdir/gcc43.patch" || return 1

  #
  # BUILD
  #
  aclocal || return 1
  autoconf || return 1
  libtoolize || return 1
  autoheader || return 1
  automake --add-missing || return 1
  ./configure --prefix=/usr --without-doxygen
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

  rm -fv "$pkgdir/usr/bin/"{libtest,notQttest}
}
md5sums=('b240ddbd54fd2b9adcbca95117b9bbce')
