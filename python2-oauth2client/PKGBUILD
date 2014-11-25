# Maintainer: Atlanis <emallson@archlinux.us>
pkgname=python2-oauth2client
pkgver=1.4.2
pkgrel=1
pkgdesc="The oauth2client is a client library for OAuth 2.0."
arch=('any')
url="https://github.com/google/oauth2client"
license=('Apache')
groups=()
depends=('python2' 'python2-httplib2')
makedepends=('python2-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=("https://pypi.python.org/packages/source/o/oauth2client/oauth2client-1.4.2.tar.gz")
noextract=()
md5sums=('b6d062fcb774d5c9b156a03d36c5b975')

package() {
    cd "$srcdir/oauth2client-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
#    chmod o+r "$pkgdir/usr/lib/python2.7/site-packages/oauth2client-1.2-py2.7.egg-info/top_level.txt"
}