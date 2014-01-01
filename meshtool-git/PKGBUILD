# Maintainer: Kozec <kozec at kozec dot com>

pkgname='meshtool-git'
pkgver=20131231
pkgrel=1
pkgdesc='Tool for manipulating mesh data using pycollada'
arch=('i686' 'x86_64')
url='https://github.com/pycollada/meshtool'
license='BSD'

depends=('pycollada-git')
makedepends=('python2-distribute')
conflicts='meshtool'
provides='meshtool'

optdepends=(
  'panda3d: for most of viewing and image saving functionality'
  'python-networkx: for --sander_simplify option'
)

source=("git://github.com/pycollada/meshtool.git")

pkgver() {
	date +%Y%m%d
}

build() {
	cd ${srcdir}/meshtool
	python2 setup.py build
}


package() {
	cd ${srcdir}/meshtool
	# target="$pkgdir/usr/lib/python2.7/site-packages/meshtool"
	python2 setup.py install --root="${pkgdir}"
	# cp *.yaml "$target"
	# install -m 655 "$srcdir/mce.py" "$pkgdir/usr/bin/mce.py"
}

md5sums=('SKIP')
