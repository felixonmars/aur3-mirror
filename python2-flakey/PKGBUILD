# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=python2-flakey
_reponame=flakey
pkgver=0.4.3
pkgrel=1
pkgdesc="A Python 3 compatible fork of flakey. It is based on Georg Brandl's pyflake-ast."
arch=('any')
url="http://bitbucket.org/icordasc/flakey"
license=('MIT')
depends=('python2')
provides=('python2-flakey')
options=(!emptydirs)
source=("https://bitbucket.org/icordasc/$_reponame/get/$pkgver.tar.bz2")
md5sums=('5ac5137ac8835135b0c8bbe1598eed6d')

build() {
    cd "icordasc-flakey-fbeffba764f5"
    python2 setup.py install --root=$pkgdir/ --prefix=/usr --optimize=1
}

package() {
    cd "icordasc-flakey-fbeffba764f5"
    mv "$pkgdir/usr/bin/pyflakes" "$pkgdir/usr/bin/pyflakes-python2"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
