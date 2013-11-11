# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=jslint
pkgname="python-$_name"
pkgver=0.6.0
pkgrel=2
pkgdesc='JSLint wrapper for Python'
arch=('any')
url="http://pypi.python.org/pypi/$_name"
license=('BSD')
depends=('python' 'js185')
source=("https://pypi.python.org/packages/source/j/$_name/$_name-$pkgver.tar.gz")
md5sums=('842e54eee340eb2da84d699bb659be4d')

package() {
	cd "$srcdir/$_name-$pkgver"
	
	2to3 -w --no-diffs .
	sed -i 's/json(errors)/json(errors.decode())/' jslint/spidermonkey.py
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}