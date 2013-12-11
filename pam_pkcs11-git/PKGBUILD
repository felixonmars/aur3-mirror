# Maintainer: Nils Schneider <nils@nilsschneider.net>
_gitname=pam_pkcs11
pkgname=pam_pkcs11-git
pkgver=dd7fa2f
pkgrel=1
pkgdesc="PAM module allows a X.509 certificate based user login"
arch=('i686' 'x86_64')
url="https://github.com/OpenSC/pam_pkcs11"
options=('!libtool')
license=('LGPL')
backup=(etc/pam_pkcs11/pam_pkcs11.conf)
depends=('opensc')
source=('git://github.com/OpenSC/pam_pkcs11.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  ./bootstrap
  ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
              --libdir=/usr/lib \
        --with-pcsclite=no \
        --disable-man \
        --with-ldap=no
  make
}

package() {
  cd $_gitname
  mkdir -p -m 755 ${pkgdir}/etc/pam_pkcs11/cacerts
  mkdir -p -m 755 ${pkgdir}/etc/pam_pkcs11/crls
  make DESTDIR=${pkgdir} install
  install -D -m 644 ./etc/pam_pkcs11.conf.example ${pkgdir}/etc/pam_pkcs11/pam_pkcs11.conf
}
