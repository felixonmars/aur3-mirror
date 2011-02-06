
# See http://wiki.archlinux.org/index.php/Arch_CVS_&_SVN_PKGBUILD_guidelines
# for more information on packaging from SVN sources.

# Contributor: Denis Martinez <deuns.martinez AT gmail DOT com>
pkgname=qtnx
pkgver=0.9
pkgrel=1
pkgdesc="NX client for Qt"
arch=('i686' 'x86_64')
url="http://freenx.berlios.de/"
license=('GPL')
groups=()
depends=('qt' 'nxcl')
makedepends=('subversion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(qtnx.desktop)
noextract=()

_svntag=svn://svn.berlios.de/freenx/tags/freenx-client_freenx-client-0.9/qtnx
_svnmod=qtnx

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

  #
  # BUILD
  #
  qmake qtnx.pro || return 1
  make || return 1
  install -D -m 755 qtnx "$pkgdir/usr/bin/qtnx" || return 1
  install -D -m 755 "$srcdir/qtnx.desktop" "$pkgdir/usr/share/applications/qtnx.desktop"
}
md5sums=('beb9e4acc6f552af76494b32ccc4e959')
