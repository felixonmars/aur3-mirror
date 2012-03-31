# $Id$
# Maintainer: Élie Bouttier <elie.bouttier@etu.enseeiht.fr>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alexandre Chataignon <alexandre@xouillet.info>

_pkgname=qingy
pkgname=qingy-pam
pkgver=1.0.0
pkgrel=3
pkgdesc="A DirectFB getty replacement with pam credential support"
arch=('i686' 'x86_64')
url="http://qingy.sourceforge.net/"
license=('GPL')
depends=('directfb' 'openssl' 'libxss' 'pam')
#makedepends=('emacs')
conflicts=('qingy')
provides=('qingy')
backup=('etc/qingy/settings' 'etc/qingy/welcomes')
options=('!libtool')
install=qingy.install
source=(http://downloads.sourceforge.net/sourceforge/qingy/${_pkgname}-${pkgver}.tar.bz2 \
        qingy.logrotate \
		qingy_pam_groups.patch)
md5sums=('1e0912655e240adfd0ce5ced30bbc685'
         'a9bdfd0ac9f29380eafa97a4a056789d'
         'a103c2099de7748c331bda0345e2c341')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  patch -p0 < "${srcdir}/qingy_pam_groups.patch"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  XFREE=/usr/bin/Xorg XINIT=/usr/bin/xinit \
    ./configure --prefix=/usr --sbindir=/sbin --sysconfdir=/etc \
    --disable-optimizations --enable-pam \
    --disable-static-build --enable-gpm-lock \
#	--enable-emacs
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/qingy.logrotate" "${pkgdir}/etc/logrotate.d/qingy"
}

