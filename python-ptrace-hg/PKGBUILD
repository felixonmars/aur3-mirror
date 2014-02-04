# Maintainer: Aleksander Nitecki <ixendr@itogi.re>

pkgname=python-ptrace-hg
_hgname=python-ptrace
pkgver=0.6.6
pkgrel=1
pkgdesc="Python binding of ptrace library. Hg version."
url="https://bitbucket.org/haypo/python-ptrace/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python')
makedepends=('mercurial' 'python')
provides=('python-ptrace')
conflicts=('python-ptrace')
source=('hg+https://bitbucket.org/haypo/python-ptrace')
md5sums=('SKIP')

pkgver() {
	cd _hgname
	echo $(hg identify -n).$(hg identify -i) # I have seen three hg PKGBUILDS and each had different pkgver(). This one is copied from 9vx-hg PKGBUILD.
}

build() {
	cd $_hgname

	python setup.py         build
	python setup_cptrace.py build
}

package() {
	cd $_hgname

	python setup.py         install --root="${pkgdir}"
	python setup_cptrace.py install --root="${pkgdir}"
}
