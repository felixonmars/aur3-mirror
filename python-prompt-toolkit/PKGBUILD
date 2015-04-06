# Maintainer: flying sheep <flying-sheep@web.de>

pkgname=python-prompt-toolkit
_pkgname=prompt_toolkit
pkgver=0.31
pkgrel=1
pkgdesc='Library for building powerful interactive command lines in Python'
url='https://github.com/jonathanslenders/python-prompt-toolkit'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=(
	'python-docopt'
	'python-jedi>=0.8.1'
	'python-pygments'
	'python-six>=1.8.0'
	'python-wcwidth')
optdepends=('ipython: ptipython (Prompt Toolkit IPython wrapper)')
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('56c553ba7a07c3f86af14faac26b85fd')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
