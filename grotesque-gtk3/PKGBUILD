# Maintainer: Brandon Invergo < http://www.brandoninvergo.com >
pkgname=grotesque-gtk3
pkgver=0.9.3
pkgrel=3
pkgdesc="A utility that helps you manage your collection of interactive fiction, or text adventures."
arch=(any)
url="http://grotesque.sourceforge.net/"
license=('GPL')
depends=('pygobject')
groups=()
source=(http://downloads.sourceforge.net/grotesque/grotesque-${pkgver}-gtk3.tar.gz)

md5sums=('9e2327b3d016ef3be7aaafb8d1faba92 ')

package() {
  cd "$srcdir/grotesque-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
