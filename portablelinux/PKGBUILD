# Maintainer: Dan Serban
# Contributor: Marc Marrash (marc.marrash@gmail.com)

pkgname=portablelinux
pkgver=0.9.3
pkgrel=2
pkgdesc="A tool that lets you create Casper-based bootable USB and removable drives using popular live CDs"
arch=(any)
url=http://rudd-o.com/new-projects/portablelinux
license=(GPL)
depends=(dosfstools parted pygtk python2)
makedepends=(python2-distribute)
source=('http://rudd-o.com/new-projects/portablelinux/releases/0.9.3/portablelinux-0.9.3.tar.gz')
md5sums=('ba30bec27a6e06e42f3b7d5bc45041a6')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
  mkdir "$pkgdir/usr"
  python2 setup.py install --prefix="$pkgdir/usr"
}
