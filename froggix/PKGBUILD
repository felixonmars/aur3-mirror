# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=froggix
pkgver=0.1
pkgrel=2
pkgdesc="Clone of the classic arcade game Frogger"
arch=('any')
url="http://sourceforge.net/projects/froggix/"
license=('GPL3' 'CCPL' 'custom')
depends=('python-pygame')
source=("http://downloads.sourceforge.net/${pkgname}/Froggix.tar.gz")
md5sums=('cbf6c6c710d7ccde0b389e143a564eee')

package() {
  cd "${srcdir}/${pkgname}"

  # Fix a compatibility with Python2 and the path for data files
  sed -i "1i#!/usr/bin/python2" "${pkgname}.py"
  sed -i "s_data/highscores.dat_/var/lib/froggix/highscores.dat_" "${pkgname}.py"
  sed -i "s_data/_/usr/share/froggix/_g" "${pkgname}.py"

  # Install game files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -m644 data/*.{png,wav,ogg} "${pkgdir}/usr/share/${pkgname}"
  install -Dm666 data/highscores.dat "${pkgdir}/var/lib/${pkgname}/highscores.dat"
  install -Dm755 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"

  # Install doc files
  install -Dm644 Credits_and_Licenses "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
