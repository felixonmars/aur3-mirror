# Contributor: skunktrader <gdarke at skunktrading dot com>

pkgname=kmymoney-git
conflicts=('kmymoney')
replaces=('kmymoney-svn')
pkgver=20130419
pkgrel=1
pkgdesc="A personal finance manager for KDE4."
depends=('kdebase-workspace' 'shared-mime-info' 'boost-libs' 'libalkimia')
makedepends=('git' 'cmake' 'automoc4' 'docbook-xml' 'docbook-xsl' 'gettext' 'boost')
optdepends=('libofx: support for OFX import')
url=('http://kmymoney2.sourceforge.net/index-home.html')
license="GPL"
arch=('i686' 'x86_64')
 
_gitroot="git://anongit.kde.org/kmymoney"
_gitname="kmymoney"

#
# Using the fallback method of current date - same as pre pacman 4.1
#
pkgver() {
  date +%Y%m%d
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/build"
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
 
  cmake ../${_gitname} -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=DebugFull
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
