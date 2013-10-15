# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=makeblog
pkgver=0.0.3
pkgrel=1
pkgdesc="A simple offline Blog."
arch=(any)
url="http://bitbucket.org/encbladexp/makeblog"
license=('GPL3')
options=(!emptydirs)
depends=('python-pytz' 'python-jinja' 'python-pygments')
makedepends=('mercurial')
source=('makeblog::hg+http://bitbucket.org/encbladexp/makeblog#tag='$pkgver)
md5sums=('SKIP')

package() {
	cd $srcdir/makeblog
	python setup.py install --root="$pkgdir/" --optimize=1
}
