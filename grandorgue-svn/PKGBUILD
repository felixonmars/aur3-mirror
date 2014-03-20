# Maintainer: Piotr Porada <pordzio@gmail.com>
pkgname=grandorgue-svn
pkgver=1203
pkgrel=1
pkgdesc="A free pipe organ sampler compatible with Hauptwerk v1 samples"
arch=('i686' 'x86_64')
url="http://ourorgan.sf.net"
license=('GPL')
groups=('multimedia')
depends=('wxgtk2.8' 'jack')
makedepends=('cmake' 'subversion' 'wxgtk2.8' 'jack' 'docbook-xsl')
provides=('grandorgue')
conflicts=('grandorgue')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk="http://svn.code.sf.net/p/ourorgan/svn/trunk"
_svnmod="trunk"

prepare(){
  
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
}

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."


  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  mkdir "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  cmake -DUNICODE=1 -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" "$srcdir/$_svnmod" -DDOCBOOK_DIR=/usr/share/xml/docbook/xsl-stylesheets-1.77.1 -DwxWidgets_CONFIG_OPTIONS="--version=2.8"
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
