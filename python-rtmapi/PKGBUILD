# Maintainer: Chris “Kwpolska” Warrick <aur@chriswarrick.com>
pkgname=python-rtmapi
_pyname=RtmAPI
pkgver=0.6.0
pkgrel=2
pkgdesc='API package for rememberthemilk.com'
arch=('any')
url='http://pypi.python.org/pypi/RtmAPI/'
license=('MIT')
depends=('python' 'python-httplib2')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.zip"
        "LICENSE")
md5sums=('f4a77ddd713532eea504b64e349c5a2d' '7d6fd7c8e022bae9010af272c31eb45f')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
