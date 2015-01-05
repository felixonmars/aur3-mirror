# Maintainer: Ivan Pulido < ijpulidos at riseup.net >

pkgname=python2-plotly
pkgver=1.4.14
pkgrel=2
pkgdesc='Python API for Plotly, a collaborative data analysis and graphing tool on the cloud. Python2.x.x version.'
arch=('any')
url='https://plot.ly/'
license=('MIT')
depends=('python2' 'python2-requests' 'python2-six' 'python2-pytz')
source=("https://pypi.python.org/packages/source/p/plotly/plotly-${pkgver}.tar.gz")
md5sums=('123502aa9ed45409dab94178c2767e64')

build() {
  cd plotly-${pkgver}

  python2 setup.py build
}

package() {
  cd plotly-${pkgver}

  python2 setup.py install \
    --root ${pkgdir}
}
