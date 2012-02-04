# Contributor: Dmitry Batenkov <dima.batenkov@gmail.com>

pkgname=sdictviewer
pkgver=0.6.2.1
pkgrel=1
pkgdesc="SDict Viewer: a viewer for dictionaries in open format developed by AXMA Soft"
arch=(any)
url="http://sdictviewer.sourceforge.net/"
license=(GPL)
depends=('python' 'pygtk')
makedepends=('setuptools')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-src.zip)
md5sums=('f5069aee629c8c76ff5c528c56fd7eb2')

build() {
  cd $srcdir/$pkgname-$pkgver/src
  python setup.py install --root=$pkgdir/ --optimize=1

  # Remember to install licenses if the license is not a common license!
  # install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
