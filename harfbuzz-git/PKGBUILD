#Contributor:	Spyros	Stathopoulos	<gmail.com: foucault.online>
#Maintainer:	Jesse	Jaara		<gmail.com: jesse.jaara>

pkgname=harfbuzz-git
pkgver=0.9.40.64.g16dac7e
pkgrel=1
pkgdesc="HarfBuzz is an OpenType text shaping engine."
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/HarfBuzz"
license=('MIT')
depends=('freetype2' 'fontconfig' 'graphite' 'cairo' 'icu')
makedepends=('git' 'ragel' 'python2' 'gobject-introspection')
provides=('harfbuzz' 'harfbuzz-icu')
conflicts=('harfbuzz' 'harfbuzz-icu')
options=(!libtool)
source=('harfbuzz::git://anongit.freedesktop.org/harfbuzz')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/harfbuzz"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/harfbuzz"

  ./autogen.sh --prefix=/usr --with-glib \
               --with-freetype --with-cairo \
               --with-icu --with-graphite \
               --with-gobject
  make
}

package() {
  cd "${srcdir}/harfbuzz"

  mkdir -p "${pkgdir}/usr/share/licenses/harfbuzz-git"
  cp COPYING "${pkgdir}/usr/share/licenses/harfbuzz-git/"

  make DESTDIR="${pkgdir}" install
}

