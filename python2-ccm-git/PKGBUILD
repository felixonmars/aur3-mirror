# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python2-ccm-git
pkgver=1.1.r14.gad50f9a
pkgrel=1
pkgdesc="A script to easily create and destroy an Apache Cassandra cluster on localhost"
arch=('any')
url="https://github.com/pcmanus/ccm"
license=('Apache')
makedepends=('git' 'python2-setuptools')
depends=('python2' 'python2-yaml' 'apache-ant')
conflicts=('python2-ccm')
provides=('python2-ccm')
source=(git+https://github.com/pcmanus/ccm.git)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/ccm
  # cutting off 'ccm-' prefix that presents in the git tag
  git describe --long | sed -r 's/^ccm-//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/ccm
  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
