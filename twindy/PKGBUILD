# Maintainer: M Rawash <mrwash@gmail.com>
# Contributor: Ross Eldridge <ptepid@ptepid.org>
pkgname=twindy
pkgver=1.01
pkgrel=3
pkgdesc="JUCE based window manager with a fixed, simple layout."
url="http://www.niallmoody.com/apps/twindy"
license="GPL"
arch=('i686' 'x86_64')
depends=('freetype2' 'ttf-bitstream-vera')
makedepends=('gcc' 'libxmu')
source=(http://downloads.niallmoody.com/$pkgname-$pkgver.tar.gz)
md5sums=('035a534c2baee43c5ff2ff2a348cb4df')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  echo '#include <stddef.h>' >> src/juce_amalgamated.h

  LIBS='-lX11 -lXext -ldl' ./configure --prefix=/usr --with-x --with-OpenGL
  make || return 1
  make DESTDIR="${pkgdir}" twindydocdir="/usr/share/doc/twindy" install
}
