# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=pyawale
pkgver=0.4.0
pkgrel=2
pkgdesc="A version of Awalé, a member of the mancala family of board games"
arch=('any')
url="http://www.pygame.org/projects/21/464/"
license=('GPL')
depends=('python2' 'python2-pygame')
source=("http://download.gna.org/pyawale/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sh")
md5sums=('ed964c8a1d3cfb52e101b7162f98e768'
         'bc0052df4ad75fad3a12ddcc18c19575')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i "s_/usr/bin/python_/usr/bin/python2_" {src,tools}/*.py
  python2 setup.py install --root="${pkgdir}" --prefix="/usr" || return 1

  rm "${pkgdir}/usr/bin/${pkgname}.py"
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mv "${pkgdir}/usr/share/doc/${pkgname}/tools" "${pkgdir}/usr/share/${pkgname}"
}
