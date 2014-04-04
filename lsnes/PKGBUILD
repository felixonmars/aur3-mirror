pkgname=lsnes
pkgver=rr1.909.af4cab1
_bsnesver=085
_gambatterev=364
pkgrel=1
pkgdesc="The rerecording emulator"
arch=('i686' 'x86_64')
license=('GPL')
url="http://tasvideos.org/Lsnes.html"
depends=('portaudio' 'lua' 'boost-libs' 'wxgtk' 'ffmpeg' 'webkitgtk2')
options=(!ccache)

source=("git+git://repo.or.cz/lsnes.git#branch=rr1-maint"
        "svn+https://gambatte.svn.sourceforge.net/svnroot/gambatte#revision=${_gambatterev}"
        "http://bsnes.googlecode.com/files/bsnes_v${_bsnesver}-source.tar.bz2"
        "lsnes_linux_fix.patch")
md5sums=('SKIP'
         'SKIP'
         '2419710087ba28c894e5aa1c3c41b6e7'
         '5e9b4afaaf77222e2425742b395e4b00')

_gitname="lsnes"
_svnname="gambatte"

pkgver() {
  cd "$srcdir/$_gitname"
  microver="$(git log -1 --pretty=format:%h )"
  minorver="$(git rev-list --count HEAD)"
  echo "rr1.$minorver.$microver"
}

prepare() {
  # Prepare two working copies of the repository since we're going to build
  # both the gambatte core and the bsnes core and clean up old ones
  rm -rf $srcdir/$_gitname-bsnes $srcdir/$_gitname-gambatte
  git clone $srcdir/$_gitname $srcdir/$_gitname-bsnes
  # makepkg creates one working copy automatically, so that's our second one
  mv $srcdir/$_gitname $srcdir/$_gitname-gambatte
  # Patch bsnes
  ln -s $srcdir/bsnes_v${_bsnesver}-source/bsnes $srcdir/$_gitname-bsnes
  cd $srcdir/$_gitname-bsnes/bsnes
  cat $srcdir/$_gitname-bsnes/bsnes-patches/v$_bsnesver/*.patch | patch -p1
  cd $srcdir/$_gitname-bsnes/src/platform
  patch Makefile $srcdir/../lsnes_linux_fix.patch 
  # Patch gambatte
  ln -s $srcdir/$_svnname $srcdir/$_gitname-gambatte
  cd $srcdir/$_gitname-gambatte/$_svnname
  cat $srcdir/$_gitname-gambatte/libgambatte-patches/svn${_gambatterev}/*.patch | patch -p1
  cd $srcdir/$_gitname-gambatte/src/platform
  patch Makefile $srcdir/../lsnes_linux_fix.patch
}

build() {
  msg "Starting make..."
  # Build lsnes with the bsnes core
  cd $srcdir/$_gitname-bsnes
  make CC=g++ JOYSTICK=EVDEV BSNES_IS_COMPAT=yes BSNES_VERSION=${_bsnesver}
  # Build lsnes with the gambatte core
  cd $srcdir/$_gitname-gambatte
  make CC=g++ JOYSTICK=EVDEV CORE_TYPE=GAMBATTE
}

package() {
  install -Dm755 $srcdir/$_gitname-bsnes/lsnes $pkgdir/usr/bin/lsnes-bsnes
  install -Dm755 $srcdir/$_gitname-gambatte/lsnes $pkgdir/usr/bin/lsnes-gambatte
}
