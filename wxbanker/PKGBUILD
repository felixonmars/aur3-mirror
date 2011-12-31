# Maintainer: Dillj <dillj [at] unity-linux [dot] org>

pkgname=wxbanker
pkgver=0.8.3
pkgrel=1
pkgdesc="Simple personal finance software"
arch=('i686' 'x86_64')
url="https://launchpad.net/wxbanker"
license=('GNU GPL v3')
depends=('python2' 'wxpython' 'python2-dateutil' 'python2-numpy' 'python-simplejson' 'python-beautifulsoup')
provides=('wxbanker')
source=("http://launchpad.net/$pkgname/0.8/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('9c6fe4d1e0689bebbe67c768e54b8d15')

build() {
  msg "Nothing to compile for $pkgname"
}

package()
{
   	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1

}
