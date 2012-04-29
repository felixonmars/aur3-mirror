# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Arthur Danskin <arthurdanskin@gmail.com>

pkgname=triplexinvaders
pkgver=1.08
pkgrel=4
pkgdesc="An Alien Invaders style game with 3d graphics"
arch=('any')
url="http://www.happypenguin.org/show?Triplex%20Invaders"
license=('MIT')
depends=('python-opengl' 'python-pygame')
optdepends=('psyco: improves performance')
source=("http://acm.jhu.edu/~arthur/invaders/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sh")
md5sums=('30a5c299c0411ed04428bccc90e46af1'
         'fb1e10132b5da2e59bedf00960ed6930')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install launcher
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install game files
  sed -i "s_/usr/bin/python_&2_" *.py
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r models sound *.py hiscores options.conf "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation and license
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 {README,TODO}.txt "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
