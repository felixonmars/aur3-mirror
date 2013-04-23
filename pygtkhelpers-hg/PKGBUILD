# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=pygtkhelpers-hg
pkgver=333.ea34a9b54e96
pkgrel=1
pkgdesc="Helper library providing easy interaction with PyGTK"
arch=('i686' 'x86_64')
url="http://packages.python.org/pygtkhelpers"
license=('custom')
depends=('pygtk')
provides=('python2-pygtkhelpers-hg')
makedepends=('mercurial')
source=('hg+https://bitbucket.org/aafshar/pygtkhelpers-main')

pkgver() {
  cd "$srcdir"/pygtkhelpers-main
  echo `hg identify -n`.`hg identify -i`
}

package() {
  cd "$srcdir"/pygtkhelpers-main
  python2 setup.py install --root="$pkgdir" --prefix=/usr
}

md5sums=('SKIP')
