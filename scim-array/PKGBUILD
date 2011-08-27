# $Id: PKGBUILD 28130 2009-02-28 00:15:08Z eric $
# Maintainer: damir <damir@archlinux.org>
# Contributor: whisky <archlinux.cle(at)gmail.com>

pkgname=scim-array
pkgver=1.0.1
pkgrel=1
pkgdesc="Chinese input methord Array 30 for SCIM (行列 30)."
arch=(i686 x86_64)
url="http://scimarray.openfoundry.org/"
license=("GPL")
depends=('scim>=1.4.8')
source=(http://www.openfoundry.org/of/download_path/scimarray/1.0.1/scim-array-1.0.1.tar.gz)
md5sums=('3f17ccae3f20f42a33e464aeb06eb1cb')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}


md5sums=('689a49455f3c868182aa00310b0e5c29')
