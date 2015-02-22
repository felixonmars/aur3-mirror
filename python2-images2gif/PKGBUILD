pkgname=python2-images2gif
pkgrel=1
pkgver=1.0.1
pkgdesc='Python2 library to read and write animated gifs'
_libname="${pkgname##*-}"
license=('custom:BSD-like')
arch=('any')
url='https://bitbucket.org/bench/images2gif.py/src'
depends=('python2')
source=('https://pypi.python.org/packages/source/i/images2gif/images2gif-1.0.1.tar.gz')

package() {
	cd "${srcdir}/${_libname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

sha1sums=('3e5df8c4d04477e496489975b2bfc272fdadf8ea')
sha256sums=('9148a09dc0a59d8f90e460b85de35d1a9ac5f30bc252a76cbf3e9ed61a9d36e4')
