# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=pastenshort
url="https://github.com/Chipsterjulien/pastenshort"
pkgver=0.1
pkgrel=6
pkgdesc="It paste a file and short the url in python"
arch=('any')
license=('WTFPL')
depends=(python python-requests)
source=($pkgname-$pkgver.tar.gz)
md5sums=('515e9d53be35f654d26223f5d71f62b9')

package()
{
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
