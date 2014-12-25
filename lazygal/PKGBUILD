# Contributor: Byron Clark <byron@theclarkfamily.name>
pkgname=lazygal
pkgver=0.8.8
pkgrel=1
pkgdesc="Static web gallery generator."
url="http://sousmonlit.zincube.net/~niol/playa/oss/projects/lazygal/"
license="GPL"
arch=('any')
depends=('python2' 'python2-imaging' 'python2-genshi' 'libgexiv2' 'gstreamer0.10-python')
makdepends=('libxslt')
source=("http://sousmonlit.zincube.net/~niol/reposnapshots/${pkgname}-${pkgver}.tar.gz")
md5sums=('035a1e3e257ef9f20013df8aabd90438')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root "${pkgdir}"
}
# vim: set ft=sh ts=2 sw=2 et:
