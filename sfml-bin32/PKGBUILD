# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=sfml-bin32
pkgver=1.6
pkgrel=1
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API (legacy 1.6, binary i686 version)'
arch=('i686')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('libsndfile' 'libxrandr' 'libgl' 'openal' 'freetype2')
conflicts=('sfml')
source=(http://downloads.sourceforge.net/sfml/SFML-${pkgver}-dev-linux-32.tar.gz)
md5sums=('68077f95469000f710f0aa42b67e062f')

package() {
  cd "${srcdir}/SFML-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/" "${pkgdir}/usr/include/SFML/" "${pkgdir}/usr/share/doc/SFML"
  cp lib/*.so.1.6 "${pkgdir}/usr/lib/"
  cp -r include/SFML/* "${pkgdir}/usr/include/SFML/"
  cp readme-en.txt readme-fr.txt "${pkgdir}/usr/share/doc/SFML"
}
