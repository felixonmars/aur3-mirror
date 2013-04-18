# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: hm_b <holger@music-nerds.net>

_name=fluxus
pkgname=$_name-git
pkgver=20120204
pkgrel=1
pkgdesc="A rapid prototyping, livecoding and playing/learning environment for 3D graphics and games."
arch=('i686' 'x86_64')
url="http://www.pawfal.org/fluxus/"
license=('GPL')
depends=('fftw' 'glew' 'gstreamer0.10-base' 'libunicap'
         'liblo' 'ode' 'openal' 'racket' 'jack' 'ffmpeg')
makedepends=('git' 'scons' 'pth')
provides=("$_name")
conflicts=("$_name")
source=("$_name::git+http://git.savannah.gnu.org/r/fluxus.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_name"
  scons install Prefix=/usr \
                RacketPrefix=/usr \
                CCFLAGS="-D__STDC_CONSTANT_MACROS" \
                DESTDIR="$pkgdir/"
} 
