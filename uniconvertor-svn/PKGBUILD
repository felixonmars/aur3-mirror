# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=uniconvertor-svn
pkgver=361
pkgrel=1
pkgdesc="Universal vector graphics translator"
arch=('i686' 'x86_64')
url="http://sk1project.org/"
#url="http://code.google.com/p/uniconvertor/"
license=('GPL3')
depends=('potrace' 'python2-imaging' 'python2-cairo' 'shared-mime-info')
install=uniconvertor.install
source=('uniconvertor::svn+http://uniconvertor.googlecode.com/svn/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/uniconvertor"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/uniconvertor"
  python2 setup.py build
}

package() {
  cd "$srcdir/uniconvertor"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
