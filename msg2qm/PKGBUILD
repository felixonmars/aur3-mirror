# Contributor: mickele <mimocciola@yahoo.com>
pkgname=msg2qm
pkgver=3.3.8
pkgrel=2
pkgdesc="msg2qm is a tool available with Qt v.3 library to converts translated .po files to a Qt-specific binary format"
arch=(i686 x86_64)
license=('GPL')
url="http://www.trolltech.com/products/qt/index.html"
pkgfqn=qt-x11-free-${pkgver}
depends=('qt3')
makedepends=()
optdepends=()
source=(ftp://ftp.trolltech.com/qt/source/${pkgfqn}.tar.bz2)
options=()

build() {
  cd "${srcdir}/${pkgfqn}/tools/${pkgname}"
  # fix uneeded option in PRO file
  sed -e "s|REQUIRES=.*||g" \
      -i msg2qm.pro

  /opt/qt/bin/qmake || return 1
  make || return 1
  install -D -m755 $srcdir/$pkgfqn/tools/${pkgname}/${pkgname} $pkgdir/opt/qt/bin/${pkgname}
}
md5sums=('cf3c43a7dfde5bfb76f8001102fe6e85')
