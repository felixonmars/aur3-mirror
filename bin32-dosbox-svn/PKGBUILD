#Maintainer: Cameron Spry <spryct@rose-hulman.edu>
pkgname=bin32-dosbox-svn
pkgver=3821
pkgrel=2
pkgdesc="A 32-bit version of the DOSBox DOS Emulator, SVN"
arch=('x86_64')
url="http://www.dosbox.com"
license=('GPL')
depends=('lib32-sdl_sound' 'lib32-alsa-lib' 'lib32-sdl_net' 'lib32-libpng' 'lib32-libgl')
provides=(dosbox)

_svntrunk=svn://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk
_svnmod="trunk"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  cd $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  export CC='gcc -m32'
  export CXX='g++ -m32'  

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc/dosbox LDFLAGS="-L/usr/lib32" --build=i686-pc-linux-gnu  
  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR="$pkgdir/" install
}
