# Contributor: Georgios N. Tsalikis <aliverius@tsalikis.net>

pkgname=directfb-multi-git
pkgver=20110207
pkgrel=1
pkgdesc="1.5 branch of the multi-application capable build of the DirectFB hardware graphics-acceleration 
system."
arch=('i686' 'x86_64')
url="http://www.directfb.org"
license=('LGPL2')
#groups=('directfb')
depends=( 'linux-fusion-git' 'xorg-server' 'freetype2' 'libjpeg'  'libtiff' 'sysfsutils' 'libpng')
provides=('directfb=1.5')
replaces=('directfb')
#options=(!libtool)
source=()
install=directfb.install
md5sums=()

_gitroot="git://git.directfb.org/git/directfb/core/DirectFB.git"
_gitname="DirectFB"


build() {
  msg "Connecting to git.directfb.org GIT server...."

  if [[ -d $startdir/src/$_gitname ]] ; then
    cd $_gitname
    git pull origin || return 1
    msg "The local files are updated."
  else
    git clone $_gitroot || return 1
  fi

  msg "GIT checkout done"

  # Remove old -build
  rm -rf $startdir/src/$_gitname-build

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  msg "Starting make..."

  # CFLAGS are redefined here in order to avoid overriding the default optimizations (lots of -O3). 
  if [ "${CARCH}" = "i686" ]; then
  CFLAGS="-march=i686 -mtune=generic -pipe" ./autogen.sh  \
	--prefix=/usr --sysconfdir=/etc  --enable-multi \
  	--enable-static --enable-fbdev --enable-x11 --disable-sdl --disable-osx	 \
	--enable-unique --enable-zlib --enable-video4linux2 
  fi

  if [ "${CARCH}" = "x86_64" ]; then
  CFLAGS="-march=x86-64 -mtune=generic -pipe" ./autogen.sh  \
	--prefix=/usr --sysconfdir=/etc  --enable-multi \
  	--enable-static --enable-fbdev --enable-x11 --disable-sdl --disable-osx	 \
	--enable-unique --enable-zlib --enable-video4linux2 
  fi

  make  || return 1
  make -j1 DESTDIR=$startdir/pkg install || return 1
  
  install -D -m644 $startdir/85-directfb.rules $startdir/pkg/etc/udev/rules.d/85-directfb.rules
} 
