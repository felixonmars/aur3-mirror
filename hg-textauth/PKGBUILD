# Contributor: Evaggelos Balaskas <ebalaskas@ebalaskas.gr>

pkgname=hg-textauth
pkgver=0
pkgrel=0
arch=('i686' 'x86_64')
pkgdesc="Plaintext file authentication extension for Mercurial"
url="http://bitbucket.org/hstuart/hg-textauth"
license=('GPL')
depends=(mercurial)
makedepends=(mercurial)
install=
source=()
md5sums=()

_hgroot="http://bitbucket.org/hstuart"
_hgrepo=$pkgname

build() {
	phyton_version=$(python2 -V 2>&1 | cut -d' ' -f2)
	cd $startdir/src/$pkgname
	install -m0644 -D textauth.py $startdir/pkg/usr/lib/python${phyton_version%.*}/site-packages/hgext/textauth.py
}

