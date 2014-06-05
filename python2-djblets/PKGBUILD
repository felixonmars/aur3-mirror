# Maintainer: Moritz Maxeiner <oritz@ucworks.org>

# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=python2-djblets
pkgver=0.8.2
pkgrel=1
pkgdesc="A collection of useful extensions for Django."
license=('MIT')
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/djblets/djblets"
depends=('python2' 'python2-django' 'django-pipeline>=1.3.23')
makedepends=('python2-distribute' 'lessc' 'nodejs-uglify-js')
provides=("python-djblets=${pkgver}" "djblets=${pkgver}")
conflicts=('python-djblets' 'djblets')
replaces=('python-djblets' 'djblets')
source=("https://github.com/djblets/djblets/tarball/release-${pkgver}"
        "env.patch")
sha256sums=('688aee250003da9c52311e4ed2ef2da9ce4acce958260e428b8124f7789e44e9'
            'dafc805506ec48ab36198486083c161f3dad32cbf0ba3d457f7e304b767fbf8d')

prepare()
{
  cd "${srcdir}"/djblets-djblets-*

  patch -p1 -i ${srcdir}/env.patch
}

package()
{
  cd "${srcdir}"/djblets-djblets-*

  python2 setup.py install --root=${pkgdir}
}
