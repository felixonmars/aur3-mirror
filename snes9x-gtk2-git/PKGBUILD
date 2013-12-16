pkgname=snes9x-gtk2-git
_gitname=snes9x
pkgver=1.53.194.g532a76d
pkgrel=1
pkgdesc="A GTK+ port of the Snes9x emulator (git version, gtk2)"
arch=('i686' 'x86_64')
url="https://github.com/snes9xgit/snes9x"
license=('LGPL')
depends=('zlib' 'libpng' 'sdl' 'alsa-lib' 'libglade' 'libxv' 'gcc-libs' 
         'libxext' 'libsm' 'libgl' 'gtk2')
makedepends=('intltool' 'nasm' 'mesa' 'git' 'autogen')
provides=('snes9x' 'snes9x-gtk')
conflicts=('snes9x' 'snes9x-gtk')
install=snes9x-git.install
source=('git://github.com/snes9xgit/snes9x.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}
  git describe --always | sed 's/-/./g'
}

build() {
  cd ${srcdir}/${_gitname}/gtk
  ./autogen.sh
  ./configure --prefix=/usr --with-netplay --with-gtk2
  make
}

package() {
  cd ${srcdir}/${_gitname}/gtk
  make DESTDIR=${pkgdir} install
}
