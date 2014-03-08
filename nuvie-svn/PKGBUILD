# Maintainer: Cody "Mister.Bubbles" Baxter <codybaxter @ gmail . com>

pkgname=nuvie-svn
pkgver=1625
pkgrel=1
pkgdesc="Open source game engine for playing Origin's Ultima VI, Martian Dreams and Savage Empire on modern systems"
arch=('i686' 'x86_64')
url="http://nuvie.sourceforge.net/"
source=('nuvie-svn.desktop' 'nuvie-svn.install')
license=('GPLv2')
depends=('sdl')
makedepends=('subversion' 'gcc-libs-multilib')
md5sums=('f891148a6e6a7fadb0ce1993388e4929' 'c7bec7527820c909db582b3cef2a822d')
_svntrunk="http://svn.code.sf.net/p/nuvie/code/"
_svnmod="nuvie"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/nuvie/nuvie/trunk"

# Build
  ./autogen.sh
  ./configure
  make
}

package() {
# Install game
	cd "$srcdir/nuvie/nuvie/trunk"

 
	make DESTDIR="$pkgdir/" install

	cp -R $srcdir/nuvie/nuvie/trunk/data/*  $pkgdir/usr/local/share/nuvie	
	


# Install Icon
    install -D -m 644 $srcdir/nuvie/nuvie/trunk/builds/mingw/nuvie.ico \
        $pkgdir/usr/share/pixmaps/nuvie.ico || return 1

# Install Launcher
    install -D -m 644 $startdir/nuvie-svn.desktop \
        $pkgdir/usr/share/applications/nuvie.desktop || return 1

}
