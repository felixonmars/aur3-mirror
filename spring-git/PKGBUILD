# Contributor: Antti Oja <antti.bofh@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>

_pkgname=spring
pkgname=spring-git
pkgver=0.94.1.1.217.g1ac8234
pkgrel=1
pkgdesc="A free 3D real-time-strategy (RTS) game engine. Development branch."
arch=('i686' 'x86_64')
url="http://springrts.com/"
license=('GPL2')
depends=('openal' 'glew' 'boost-libs' 'freetype2' 'devil' 'libvorbis' 'sdl'
         'libxcursor' 'curl' 'shared-mime-info' 'desktop-file-utils')
makedepends=('boost' 'cmake' 'zip' 'xz' 'p7zip' 'python2' 'java-environment' 'mesa')
optdepends=('python2: python-based bots'
            'java-runtime: java-based bots')
install=${pkgname}.install
provides=('spring')
conflicts=('spring' 'spring-svn')
source=('git://github.com/spring/spring.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  echo "0.$(git describe --always | sed -e 's|-|.|g')"
}

build() {
  cd "${srcdir}/$_pkgname"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDATADIR=share/spring \
    -DCMAKE_SKIP_RPATH=YES

  make
}

package() {
  cd "${srcdir}/$_pkgname"

  make DESTDIR=$pkgdir install

  install -d "$pkgdir/etc/spring"
  echo '$HOME/.spring' > "$pkgdir/etc/spring/datadir"
}
