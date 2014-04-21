# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=imagesat
url="https://github.com/Chipsterjulien/imagesat"
pkgver=0.3.1
pkgrel=3
pkgdesc="Daemon that can download satellite images"
arch=('any')
license=('GPL')
depends=(python python-pillow python-requests python-yaml)
source=($pkgname-$pkgver.tar.gz)
md5sums=('a0b22b3e1082c5091df56f6f9db6f4f2')
install=imagesat.install

package()
{
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
