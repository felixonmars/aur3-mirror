# Maintainer: Nyarcel <nyarcel AT SPAMFREE gmail DOT com>
#
# PKGBUILD revision: 2015-05-03

_name=pyvlfeat
_pypi_desc_url='https://pypi.python.org/pypi'
_pypi_src_url='https://pypi.python.org/packages/source'

pkgname=python2-$_name
pkgver=0.1.1a3
pkgrel=1
pkgdesc='Python interface to the VLFeat computer vision library'
arch=('i686' 'x86_64')
url="$_pypi_desc_url/$_name"
license=('GPL')
depends=('python2' 'python2-numpy')
makedepends=('boost' 'boost-libs')
source=("$_pypi_src_url/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        'setup.py.patch')
md5sums=('69edf76be8b84b2b92bd75187973b041'
         'ecdcc7b51acfbe14956ee08f2a16eccd')

prepare() {
	patch "$srcdir/$_name-$pkgver/setup.py" < setup.py.patch
}

build() {
	cd "$srcdir/$_name-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python2 setup.py install --root="$pkgdir/"
}
