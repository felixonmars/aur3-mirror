# Maintainer: Marvin Poul ponder at creshal dot de
pkgname=bstrlib
pkgver=05122010
pkgrel=3
pkgdesc='An abstraction of a string data type which is superior to the C library char buffer string type.'
arch=('any')
url='http://bstring.sourceforge.net'
license=('GPL2' 'BSD')
provides=('bstrlib')
source=("http://downloads.sourceforge.net/project/bstring/bstring/rc31/bstrlib-05122010.zip?r=&ts=1376532402&use_mirror=dfn", Makefile)
md5sums=('a81967a5eee7fad80880f8c7cfdbb8f1'
         '52905863a1e254260aa98113f9fea0a4')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
  install -D -m644 license.txt "$pkgdir"/usr/share/licenses/bstrlib/LICENSE
}
# vim:set ts=2 sw=2 et:
