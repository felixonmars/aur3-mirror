#Maintainer: Joel Heaton <jheaton at archlinux dot us>
pkgname=voyager-journey-home-git
pkgver=20111010
pkgrel=1
pkgdesc="Side-scrolling space shooter based on Star Trek: Voyager - dev version"
arch=('i686' 'x86_64')
url="http://github.com/darkrose/vjh"
license=('GPL3')
depends=('sdl' 'sdl_mixer' 'sdl_image' 'sdl_ttf')
provides=('voyager-journey-home')
conflicts=('voyager-journey-home')
source=(voyager
        voyager.install)
install=voyager.install
md5sums=('ae30f3d919951400a507898e0466f69f'
         'dca51e28db5fa18874592deb781536a3')
        
_gitroot="git://github.com/darkrose/vjh.git"
_gitname="vjh"

build() {
  cd $srcdir
  msg "Connecting to GIT server..."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir build
  make  
}

package() {
  cd $srcdir/$_gitname-build
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  sed -i 's|PREFIX=/usr/games|PREFIX=$(DESTDIR)/opt|' Makefile.inc
  sed -i '/@touch/,/@chmod/d' Makefile
  make DESTDIR=$pkgdir install
  cd ../..
  cp voyager $pkgdir/usr/bin
}
