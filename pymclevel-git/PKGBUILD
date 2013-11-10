# Maintainer: Kozec <kozec at kozec dot com>

pkgname='pymclevel-git'
pkgver=20131109
pkgrel=1
pkgdesc='Python library for reading Minecraft levels'
arch=('i686' 'x86_64')
url='https://github.com/mcedit/pymclevel'
license='BSD'

depends=('python2' 'python2-numpy' 'python2-yaml' 'python2-distribute')
makedepends=('cython2')
conflicts='pymclevel'
provides='pymclevel'

source=("git://github.com/mcedit/pymclevel.git" mce.py)

pkgver() {
	date +%Y%m%d
}

build() {
	cd ${srcdir}/pymclevel
	python2 setup.py build
}


package() {
	cd ${srcdir}/pymclevel
	target="$pkgdir/usr/lib/python2.7/site-packages/pymclevel"
	python2 setup.py install --root="${pkgdir}"
	cp *.yaml "$target"
	install -m 655 "$srcdir/mce.py" "$pkgdir/usr/bin/mce.py"
}

md5sums=('SKIP'
         '91b6c237c57bc397eb1241511f528796')
