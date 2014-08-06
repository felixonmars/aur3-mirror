# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Iven Hsu <ivenvd at gmail dot com>
# Contributor: Vinycius Maia <suportevg@uol.com.br>

pkgname=emerald-git
_gitname=emerald
pkgver=0.9.5.r0.ga272e26
pkgrel=9
pkgdesc="Emerald window decorator (0.9 development version)"
arch=('i686' 'x86_64')
url="http://cgit.compiz.org/fusion/decorators/emerald"
license=('GPL')
depends=('compiz' 'libwnck' 'xdg-utils' \
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'git')
optdepends=(
  'emerald-themes: extra themes for Emerald'
)
options=(!libtool)
conflicts=('emerald' 'emerald0.9')
provides=('emerald=0.9.5')
install=emerald.install
source=('git://anongit.compiz.org/fusion/decorators/emerald#branch=compiz++')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_gitname
  LIBS+="-lm -ldl" ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

