# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgbase="python-django-djblets"
pkgname=('python-django-djblets' 'python2-django-djblets')
_pkgname="djblets"
pkgver=0.8.11
pkgrel=1
pkgdesc="A collection of useful extensions for Django"
license=('MIT')
arch=('any')
url="https://github.com/djblets/djblets"
source=("https://github.com/djblets/djblets/archive/release-${pkgver}.tar.gz"
        "0001-Replace-pillowfight-with-Pillow.patch"
        "0002-Fixed-build-error.patch")
md5sums=('57c6bbe5cecaaf9121bee420c43cec1b'
         'abd532484bfb35a330d75db7c8b6fb56'
         '61d9d8eacc24ab5dfe539e0942ecc56f')
sha256sums=('24b341e513ce39f0a1c9b3af1f1c7bcf57f4951b4f9a8a0bb7e0760e2d5ddbad'
            '8382c2eb3cbafa661fff997332882ee5ff36576564a36cc0523cc6f2ba2773de'
            '90c95ac9ab9f6aa38be92a991d7e4f57f842bfb33a711aef932333798f2777bf')

prepare() {
  cd "${srcdir}/${_pkgname}-release-${pkgver}"
  patch -p1 -i "${srcdir}/0001-Replace-pillowfight-with-Pillow.patch"
  patch -p1 -i "${srcdir}/0002-Fixed-build-error.patch"
}

package_python-django-djblets() {
  depends=('python-django>=1.6.7' 'python-django<1.7' 'python-feedparser' 'python-pytz' 
           'python-pillow' 'python-django-pipeline' 'nodejs-uglify-js')
  makedepends=('python-setuptools' 'lessc')

  cd "${srcdir}/${_pkgname}-release-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-django-djblets() {
  depends=('python2-django>=1.6.7' 'python2-django<1.7' 'python2-feedparser' 'python2-pytz' 
           'python2-pillow' 'python2-django-pipeline' 'nodejs-uglify-js')
  makedepends=('python2-setuptools' 'lessc')

  cd "${srcdir}/${_pkgname}-release-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
