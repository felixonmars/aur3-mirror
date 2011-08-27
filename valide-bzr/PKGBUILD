# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Ravomavain <ravomavain@gmail.com>

_pkg=valide
pkgname=$_pkg-bzr
pkgver=601
pkgrel=2
pkgdesc="Val(a)IDE is an Integrated Development Environment for the Vala programming language."
arch=('i686' 'x86_64')
url="http://www.valaide.org/"
license=('GPL3')
depends=('gtksourceview2' 'vala>=0.11' 'libunique' 'gdl2' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('bzr' 'valadoc-git')
options=('!emptydirs')
install="$pkgname.install"
source=('start-page-bg-color.patch')
md5sums=('5a2a1559c0ebacbc9ad5284dff46f15f')

_bzrmod=$_pkg
_bzrtrunk=lp:${_bzrmod}

build() {

  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [ -d ${_bzrmod} ] ; then
    bzr up ${_bzrmod} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  #
  # BUILD HERE
  #

  # set a bigger icon for desktop file
  sed -i "s|32|64|" data/$_pkg.desktop.in

  # delete update-mime-database in wscript
  sed -i "/update-mime/d" wscript

  # fix annonying start-page unreadability for dark themes
  # waiting to be merged upstream
  patch -p1 -i ../start-page-bg-color.patch

  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$srcdir/$_bzrmod-build"

  python2 waf install --destdir="$pkgdir"
}
