# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Melancholy_Dream <Melancholy_Dream@write.su>

pkgname=wxmpl
pkgver=2.0.0
pkgrel=1
pkgdesc="A painless matplotlib embedding in wxPython"
arch=('any')
url="http://agni.phys.iit.edu/~kmcivor/wxmpl/"
license=('custom')
depends=('python2-matplotlib' 'wxpython')
source=("http://agni.phys.iit.edu/~kmcivor/wxmpl/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('fdc96d21e96c93aa327f10f65e14e50e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
