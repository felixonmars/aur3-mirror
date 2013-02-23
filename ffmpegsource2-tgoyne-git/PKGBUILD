pkgname=ffmpegsource2-tgoyne-git
pkgver=20130223
pkgrel=1
pkgdesc="An FFmpeg based source library and Avisynth plugin for easy frame accurate access"
arch=('i686' 'x86_64')
url="https://github.com/tgoyne/"
arch=('x86_64' 'i686')
license=('MIT')
depends=('ffmpeg')
makedepends=('subversion' 'automake' 'yasm')
conflicts=(ffmpegsource ffmpegsource2-svn)
provides=('ffmpegsource=1.17')
md5sums=()

_gitroot="https://github.com/tgoyne/ffms2.git"
_gitname="ffms2"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    cd ..
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d $_gitname-build ];then
  	rm -rf $_gitname-build
  fi
  
  cp -r $_gitname $_gitname-build
  cd $_gitname-build
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

package() {
	cd $srcdir/$_gitname-build
	./configure --prefix=/usr --enable-shared --disable-static
	make
	make DESTDIR="$pkgdir" install
}
