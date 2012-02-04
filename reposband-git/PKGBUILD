# Contributor: SaThaRiel <sathariel74[at]gmail[dot]com>
pkgname=reposband-git
pkgver=20111215
pkgrel=1
pkgdesc="Reposband is an Angband variant that attempts to recreate Posband in the latest version of V. Enjoy playing as a monster!"
arch=('i686' 'x86_64')
url="https://github.com/simongre/RePosBand"
depends=('ncurses' 'lesstif' 'sdl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'sdl_sound' 'libx11' 'libsm' 'gtk2')
makedepends=('git' 'autogen')
license=('GPL2' 'custom')

_gitname=RePosBand
_gitroot=https://github.com/simongre/RePosBand.git

build() {
  if [ -d $srcdir/$_gitname/.git ]
  then
      cd $srcdir/$_gitname && git pull
  else
      cd $srcdir && git clone $_gitroot && cd $_gitname
  fi

  cd "$startdir/src/$_gitname"
  CFLAGS=""
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin/ \
    --sysconfdir=/usr/share/reposband \
    --with-configpath=/usr/share/reposband \
    --with-libpath=/usr/share/reposband \
    --enable-gtk \
    --enable-sdl \
	--enable-sdl-mixer || return 1
  make clean
  make
  make DESTDIR="$pkgdir" install
  install -Dm644 copying.txt $pkgdir/usr/share/licenses/reposband/COPYING
}
