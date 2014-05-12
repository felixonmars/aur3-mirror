# Maintainer: vegasd

pkgname=pytagfix
pkgver=0.2.0
pkgrel=1
pkgdesc='Tag prettifer for musical albums.'
arch=('any')
url='https://github.com/vegasd/pytagfix'
license=('GPL3')
depends=('python' 'python-pytaglib')
source=("https://github.com/vegasd/pytagfix/archive/${pkgver}.tar.gz")
md5sums=('cdd541800b03172f0aa4210956e758fb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dvm755 ./pytagfix $pkgdir/usr/bin/pytagfix
}

# vim:set ts=2 sw=2 et:
