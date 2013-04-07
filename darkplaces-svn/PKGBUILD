# Maintainer: qs9rx < that nick at enjoys dÃ¶t it>
pkgname=darkplaces-svn
pkgver=11932
pkgrel=1
pkgdesc="An advanced Quake 1 game engine. SVN version"
arch=('i686' 'x86_64')
url="http://icculus.org/twilight/darkplaces/"
license=('GPL2')
depends=('libvorbis' 'sdl' 'libxxf86vm' 'libxpm' 'alsa-lib')
optdepends=('libjpeg6')
makedepends=('subversion')
conflicts=('darkplaces')
install=$pkgname.install
md5sums=('SKIP')

source=('svn://svn.icculus.org/twilight/trunk/darkplaces')

pkgver() {
  cd "$SRCDEST/darkplaces"
  svnversion
}

build() {
  cd "$srcdir/darkplaces"
  msg "Starting make..."
  make release
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,share/licenses}
  cd "$srcdir/darkplaces"
  install -Dm755 darkplaces-*{sdl,glx,dedicated} ${pkgdir}/usr/bin/
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
  
  for i in 16 24 32 48 64 72 ; do
    install -Dm 644 darkplaces${i}x$i.png $pkgdir/usr/share/icons/hicolor/${i}x$i/apps/darkplaces.png
  done
}
