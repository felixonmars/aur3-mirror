# $Id$
# Maintainer: José Luis Lafuente <jl@lafuente.me>
# Contributor: Arthur Vuillard <arthur@hashbang.fr>

pkgname='logster-git'
pkgver=r140.086825c
_gitname='logster'
pkgrel=1
pkgdesc="Parse log files, generate metrics for Graphite and Ganglia"
url="https://github.com/berdario/pew"
arch=('any')
license=('MIT')
depends=('logcheck')
makedepends=('python2' 'git')
conflicts=('logster')
provides=('logster')
source=('git+git://github.com/etsy/logster.git#branch=master')
md5sums=('SKIP')

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}


pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
