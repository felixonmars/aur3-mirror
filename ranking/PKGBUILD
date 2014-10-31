# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=ranking
url="https://github.com/Chipsterjulien/ranking"
pkgver=0.2
pkgrel=14
pkgdesc="It move pictures (by default) into year/month directory"
arch=('any')
license=('WTFPL')
depends=(python python-pillow python-termcolor)
source=($pkgname-$pkgver.tar.gz)
md5sums=('70a97034e37809f014c18700f20c6c99')

package()
{
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
