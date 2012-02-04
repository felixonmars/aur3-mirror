# Contributor: Arvid Ephraim Picciani <aep@exys.org>

pkgname=tinyerp-client
pkgver=4.2.3.4
pkgrel=1
pkgdesc="GTK client for OpenERP - The world's most advanced Open Source ERP & CRM"
url="http://openerp.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python>=2.3' 'pygtk')
makedepends=('python>=2.3')
source=(http://openerp.com/download/stable/source/$pkgname-$pkgver.tar.gz)
md5sums=('1b5831851499db4a4322de36fa4d46a7')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir
}
