# Contributor: DonVla <donvla@users.sourceforge.net>, zhangkaizhao <zkc@zopen.cn>

pkgname=xapian-python25-bindings
_realname=xapian-bindings
pkgver=1.0.8
pkgrel=2
pkgdesc="Python bindings for Xapian"
arch=(i686 x86_64)
url="http://xapian.org/"
license=('GPL')
groups=(xapian)
depends=('python25' 'xapian-core')
makedepends=('gcc')
source=(http://oligarchy.co.uk/xapian/${pkgver}/${_realname}-$pkgver.tar.gz)
md5sums=('665a016e9970a4df6a96a092760878b3')

build() {
  cd "$srcdir/${_realname}-$pkgver"
  export PYTHON=/usr/bin/python2.5
  export PYTHON_LIB=/usr/lib/python2.5/
  ./configure XAPIAN_CONFIG=/usr/bin/xapian-config \
         --prefix=/usr --with-python
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
# vim:set ts=2 sw=2 et:
