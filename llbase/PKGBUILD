# Maintainer: peace4all <markspost at rocketmail dot com>

pkgname=llbase
pkgver=139.a2109ea0344b
pkgrel=1
pkgdesc="Base linden python modules."
arch=('i686' 'x86_64')
url="https://bitbucket.org/lindenlab/llbase/"
license=('GPL')
depends=('python2')
makedepends=('mercurial')
source=("llbase::hg+https://bitbucket.org/lindenlab/llbase")
md5sums=('SKIP')

pkgver() {
	cd llbase
	echo "$(hg identify -n).$(hg identify -i)"
}

package() {
	cd llbase
	python2 setup.py install --root=$pkgdir/
}

