# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=ip_update
url="https://github.com/Chipsterjulien/ip_update"
pkgver=0.1
pkgrel=6
pkgdesc="If necessary, update your ip for hopper.pw"
arch=('any')
license=('WTFPL')
backup=('etc/ip_update/ip_update.conf')
depends=(python python-requests python-setuptools)
source=($pkgname-$pkgver.tar.gz)
install=ip_update.install
md5sums=('20d2eebfe29f79af6ccfa0e25e3b1372')

package()
{
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
