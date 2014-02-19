# Maintainer: Tom Kuther <tom@kuther.net>
pkgname=nx_util
pkgver=0.53
pkgrel=1
_naxsi_ver=0.53-2
pkgdesc="Naxsi whitelist and report generator"
arch=('i686' 'x86_64')
url="https://code.google.com/p/naxsi/"
license=('GPL')
depends=('python2')
install=
source=(naxsi-${_naxsi_ver}.tar.gz::https://github.com/nbs-system/naxsi/archive/${_naxsi_ver}.tar.gz)
sha1sums=('e29101b3193f434e4ec503671c41d0bacc64ff39')

build() {
  cd "$srcdir/naxsi-${_naxsi_ver}/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/naxsi-${_naxsi_ver}/$pkgname"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build
  mv $pkgdir/usr/local/etc $pkgdir/
  rm -rf $pkgdir/usr/local
  mkdir $pkgdir/usr/share/nx_util
  mv $pkgdir/usr/nx_datas $pkgdir/usr/share/nx_util/.
  sed -i -e 's@/usr/local/nx_datas@/usr/share/nx_util/nx_datas@' $pkgdir/etc/nx_util.conf
  sed -i -e 's@/usr/local/etc@/etc@g' $pkgdir/usr/bin/nx_util.py
}

# vim:set ts=2 sw=2 et:
