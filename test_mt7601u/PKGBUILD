# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=test_mt7601u
url="http://www.google.fr"
pkgver=0.1
pkgrel=2
pkgdesc="Test if mt7601u (wifi) is loaded. If not, it install it"
arch=('any')
license=('WTFPL')
# backup=()
depends=(python python-setuptools)
source=($pkgname-$pkgver.tar.gz)
# install=install
md5sums=('fa8ba24a91cd4f7ea0508c9eddd6da9f')

package()
{
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
