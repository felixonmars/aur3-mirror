# -*- shell-script -*-
# Arch Linux package build script
#
# Contributor: Guillaume Bouchard <guillaum.bouchard@gmail.com>
#
name=hg-evolve
pkgname=$name-hg
pkgver=20130731
pkgrel=1
pkgdesc="Evolve extension for mercurial"
arch=(any)
url="http://mercurial.selenic.com/wiki/EvolveExtension"
license=('GPL2')
install=hg-evolve-hg.install
depends=('mercurial')
makedepends=('mercurial')
source=(
        'hg+https://bitbucket.org/marmoute/mutable-history'
        'hg-evolve-hg.install')
md5sums=('SKIP'
         'd505b2f54aff6869dbfaffcb2ae5a5d6')


package() {
    cd mutable-history
	rm hgext/__init__.py
    python2 setup.py install --prefix=/usr --root=$pkgdir
}
