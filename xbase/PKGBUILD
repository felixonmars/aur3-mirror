# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=xbase
pkgver=2.0.0
pkgrel=1
pkgdesc="XBase compatible C++ class library"
arch=('i686' 'x86_64')
url="http://linux.techass.com/projects/xdb/"
license=('LGPL')
makedepends=('automake')
source=("http://prdownloads.sourceforge.net/xdb/${pkgname}-${pkgver}.tar.gz"
        'xbase-2.0.0-gcc43.patch'
        'fix-build.patch')
sha512sums=('8fe705a4d3f9367b7fbd56bfcc2cb62bba799ceab92413410f3e17ccde22f90ba6cf9e20781dc8a654131c4a3c43a6ef0734900fce2332feb9173e9292a9e21c'
            'b8a82ba9e058d59e76945140a0e7982843ed61f2d47e26b28513427ca7746cc80cdf1c6b401b5c72fe8b579dc8b32e952c880c0306d404f9188e7ab47da8365d'
            'ad8840323b4d1d7d62cdd630e68a780a2838618d1517eef25913f13fff558bd36135d32678b2e267f7953e22a2c9bff972358173c74534376dff868d3d46c9d9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Build fixes from Chakra
  patch -Np1 -i "${srcdir}/xbase-2.0.0-gcc43.patch"
  patch -Np1 -i "${srcdir}/fix-build.patch"

  # Build fix for x86_64
  cp -f /usr/share/libtool/config/config.guess .
  cp -f /usr/share/libtool/config/config.sub .

  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
