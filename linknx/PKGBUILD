
# Maintainer: sms <sms@i-mentor.pl>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>
# Contributor: William Diaz <wdiaz@archlinux.us>

pkgname=linknx
pkgver=0.0.1.32
pkgrel=2
pkgdesc="an automation platform providing high level functionalities to EIB/KNX installation"
arch=('i686' 'x86_64')
url="http://linknx.sourceforge.net/"
license=('LGPL')
depends=('eibd' 'libesmtp-linknx=1.0.4' 'pthsem>=2.0.4' 'curl>=7.14.0' 'cppunit>=1.9.6' 'log4cpp' 'lua>=5.1')
source=(http://downloads.sourceforge.net/project/linknx/linknx/linknx-${pkgver}/linknx-${pkgver}.tar.gz lmysqlclient_r.patch)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p2 -i ../lmysqlclient_r.patch

  ./configure \
    --prefix=/usr \
    --enable-option-checking \
    --enable-dependency-tracking \
    --with-pth \
    --with-pth-test \
    --with-cppunit-prefix \
    --with-cppunit-exec-prefix \
    --with-libcurl \
    --with-mysql=/usr \
    --enable-smtp \
    --with-log4cpp \
    --with-lua

  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

md5sums=('7ecc1208f59bceb05068c752b2250b63' 'df66100937aab609159023b2a344fee5')

