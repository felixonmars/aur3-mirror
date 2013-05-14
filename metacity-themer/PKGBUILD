# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=metacity-themer
pkgver=0.2.1
pkgrel=5
pkgdesc="Edit Metacity window decoration themes and see the changes in real time."
arch=('any')
url="https://launchpad.net/mct"
license=('GPL3')
depends=('pygtk' 'python2-metacity' 'python2-gconf' 'hicolor-icon-theme')
install="$pkgname.install"
source=("http://launchpad.net/mct/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('d25fb2fab90455f585b9e256c7dc2ee9')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  # python2 fix
  sed -i "1s/env python$/&2/" `grep -rl "env python$" ${pkgdir}`
}
