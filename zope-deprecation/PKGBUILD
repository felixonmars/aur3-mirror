# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=zope-deprecation
pkgver=3.4.0
pkgrel=1
pkgdesc="Zope 3 Deprecation Infrastructure"
arch=('i686' 'x86_64')
url="http://cheeseshop.python.org/pypi/${pkgname//-/.}/"
license=('ZPL')
depends=('python')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/z/${pkgname//-/.}/${pkgname//-/.}-$pkgver.tar.gz)
md5sums=('453a5707987c8b8eb1f58ed948119fce')
sha512sums=('c4d74317bfb043f6be82bf3f8de9c341b29de9f75277b346417e0d1258864c63232afb118873533d7012c8a09bd57548ede80b0a458b39ca2d61d247ee1031d3')

build() {
  cd $startdir/src/${pkgname//-/.}-$pkgver
  python setup.py install --root=$startdir/pkg --prefix=/usr || return 1
}
