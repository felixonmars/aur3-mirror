# Contributor: Ismael Carnales <icarnales@gmail.com>

pkgname=hg-paste
pkgver=16
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Paste extension for Mercurial which can send diffs to various pastebin websites for easy sharing"
url="http://bitbucket.org/sjl/hg-paste"
license=('GPL')
depends=(mercurial)
makedepends=(mercurial)
install=
source=()
md5sums=()

_hgroot="http://bitbucket.org/sjl"
_hgrepo=$pkgname

build() {
	phyton_version=$(python -V 2>&1 | cut -d' ' -f2)
	cd $startdir/src/$pkgname
	install -m0644 -D paste.py $startdir/pkg/usr/lib/python${phyton_version%.*}/site-packages/hgext/paste.py
}

