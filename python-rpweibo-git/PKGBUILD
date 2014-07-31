# Maintainer: Tom Li <biergaizi@member.fsf.org>
# Contributor: Tom Li <biergaizi@member.fsf.org>

pkgname=python-rpweibo-git
pkgver=0
pkgrel=1
pkgdesc="A Weibo API wrapper based on cURL + Python."
arch=('any')
url="https://github.com/WeCase/rpweibo"
license=('LGPL3')
depends=('python' 'python-pycurl')
makedepends=('git')
provides=('python-rpweibo')
conflicts=('python-rpweibo')
source=('rpweibo::git://github.com/WeCase/rpweibo.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/rpweibo"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/rpweibo"
  python setup.py install --root="$pkgdir/" --optimize=1
}
