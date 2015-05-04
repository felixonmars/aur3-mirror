# Maintainer: Nyarcel <nyarcel AT SPAMFREE gmail DOT com>
#
# PKGBUILD revision: 2015-05-03

_name=islpy
_pypi_desc_url='https://pypi.python.org/pypi'
_pypi_src_url='https://pypi.python.org/packages/source'

pkgname=python-$_name
pkgver=2015.1.1
pkgrel=1
pkgdesc='Python wrapper around ISL, an integer set library'
arch=('i686' 'x86_64')
url="$_pypi_desc_url/$_name"
license=('MIT')
source=("$_pypi_src_url/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "LICENSE")
md5sums=('f0cd59fad1a06f0e94ec0a2b073b063f'
         '2dac76d0c25f6d9af81ff4a16a6bf601')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" \
	               "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
