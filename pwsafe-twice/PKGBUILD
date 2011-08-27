# what with: http://code.google.com/p/chromium/issues/detail?id=37755
# This is useful to work against some clients (such as Chrome) which read from the clipboard twice.
pkgname=pwsafe-twice
_pkgname=pwsafe
pkgver=0.2.0
pkgrel=6
pkgdesc="A commandline program for managing encrypted password databases"
arch=('i686' 'x86_64')
url="http://nsd.dyndns.org/pwsafe/"
license=('GPL')
depends=('openssl' 'libxmu' 'readline')
provides=('pwsafe')
conflicts=('pwsafe')
replaces=('pwsafe')
source=($url/releases/${_pkgname}-${pkgver}.tar.gz pwsafe-twice.patch)
md5sums=('4bb36538a2772ecbf1a542bc7d4746c0' '55c4fc50d43b5fadb864114b8e5d82ec')

build() {
  patch ${srcdir}/${_pkgname}-${pkgver}/pwsafe.cpp pwsafe-twice.patch
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR=${pkgdir} install

  # Make pwsafe suid root so it can seed rng as a user
  chmod +s ${pkgdir}/usr/bin/pwsafe
}
