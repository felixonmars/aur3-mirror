# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Marcel Wysocki <maci@satgnu.net>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 
# TODO: review this package, possibly rename.

pkgname=python2-sphinxcontrib-httpdomain2
pkgver=1.2.0
pkgrel=1
pkgdesc="HTTP domain extension for sphinx"
arch=(any)
url="https://bitbucket.org/birkenfeld/sphinx-contrib/"
license=('BSD')
depends=('python2-sphinx')
makedepends=()
options=(!emptydirs)
source=("http://pypi.python.jp/sphinxcontrib-httpdomain2/sphinxcontrib-httpdomain2-1.2.0.tar.gz")
sha1sums=('cc5ea9cbb3989d8dd370c1bb5a6bce7ef67ed421')

package() {
  cd "$srcdir/sphinxcontrib-httpdomain2-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
