# lysdr-git
# software-defined radio, using Gtk+ GUI and jack audio IO
# Maintainer: Gordonjcp <gordon@gjcp.net>
pkgname=lysdr-git
pkgver=0.0.6
pkgrel=3
pkgdesc="Software-defined Radio receiver"
arch=(i686)
url="https://github.com/gordonjcp/lysdr"
license=('GPL')
depends=(fftw gtk2 jack)
makedepends=('python' 'git')

_gitroot="git://github.com/gordonjcp/lysdr.git"
_gitname="lysdr"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Building with waf"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./waf configure --prefix=/usr
  ./waf build
}

package() {
  cd "$srcdir/$_gitname-build"
  DESTDIR="$pkgdir/" ./waf install
}
