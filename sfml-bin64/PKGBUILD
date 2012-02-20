# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=sfml-bin64
pkgver=1.6
pkgrel=1
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API (legacy 1.6, binary x86_64 version)'
arch=('x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('libsndfile' 'libxrandr' 'libgl' 'openal' 'freetype2')
conflicts=('sfml')
source=(http://downloads.sourceforge.net/sfml/SFML-${pkgver}-dev-linux-64.tar.gz)
md5sums=('3e15d42e1de061209f774e58a2d1ed0e')

package() {
  cd "${srcdir}/SFML-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/" "${pkgdir}/usr/include/SFML/" "${pkgdir}/usr/share/doc/SFML"
  cp lib/*.so.1.6 "${pkgdir}/usr/lib/"
  cp -r include/SFML/* "${pkgdir}/usr/include/SFML/"
  cp readme-en.txt readme-fr.txt "${pkgdir}/usr/share/doc/SFML"
}
