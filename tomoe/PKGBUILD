# Maintainer: Felix Stirlitz <m.p.isaev@yandex.com>
# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=tomoe
pkgver=0.6.0
pkgrel=9
pkgdesc="A handwriting recognition engine."
arch=('i686' 'x86_64')
url="http://tomoe.sourceforge.jp/"
license=('LGPL')
depends=('libmysqlclient' 'perl' 'pygtk')
makedepends=('gcc' 'intltool' 'make' 'patch' 'pkg-config')
options=('!libtool')
backup=('etc/tomoe/config')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz \
	${pkgname}-${pkgver}-bz502662.patch \
	${pkgname}-${pkgver}-fix-sigsegv.patch \
	${pkgname}-${pkgver}-glib.patch \
	${pkgname}-${pkgver}-ldflags.diff)
md5sums=('0e51e88d097085e101bf722fc04808ed'
         'dcc4170655783becb2d427a0ad79e435'
         '3770eac3f51566673330d9b22b28e212'
         '2ca8051376b215ba305f2d436661a217'
         '6cb37bf86b11edc34bd3fcbf25396f5f')

build() { 
  cd ${srcdir}/${pkgname}-${pkgver}

  # apply patches...
  patch -Np1 -i ../${pkgname}-${pkgver}-bz502662.patch || return 1
  patch -Np1 -i ../${pkgname}-${pkgver}-ldflags.diff || return 1
  patch -Np1 -i ../${pkgname}-${pkgver}-fix-sigsegv.patch || return 1
  patch -Np1 -i ../${pkgname}-${pkgver}-glib.patch || return 1

  ./configure PYTHON=python2 --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}
