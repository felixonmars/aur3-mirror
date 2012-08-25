# Contributor: Kosenko Roman <madkite@gmail.com>
pkgname=mercurial-forest
pkgver=0.9.2
pkgrel=1
pkgdesc='Forest Extension for Mercurial (allows operations on trees with nested Mercurial repositories)'
license='GPL'
arch=('i686' 'x86_64')
depends=('mercurial>=0.9.3')
url='http://www.selenic.com/mercurial/wiki/index.cgi/ForestExtension'
install="${pkgname}.install"
source=()
md5sums=()

_download_repository_url='https://bitbucket.org/gxti/hgforest'

build() {
	cd ${startdir}/src
	hg clone ${_download_repository_url} hgforest
	phyton_version=$(python -V 2>&1 | cut -d' ' -f2)
	install -m0644 -D hgforest/forest.py $startdir/pkg/usr/lib/python${phyton_version%.*}/site-packages/hgext/forest.py
}
