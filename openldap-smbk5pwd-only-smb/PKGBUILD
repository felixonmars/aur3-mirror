# Maintainer: Fraterius <frat3rius@yandex.com>
# Contributor: Fraterius <frat3rius@yandex.com>

pkgname=('openldap-smbk5pwd-only-smb')
pkgver=2.4.39
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.openldap.org/"
license=('custom')
depends=("libldap>=${pkgver}" "openldap>=${pkgver}")
source=(ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-${pkgver}.tgz)
sha1sums=('2b8e8401214867c361f7212e7058f95118b5bd6c')

prepare() {
  cd openldap-${pkgver}
  sed -i 's|-m 644 $(LIBRARY)|-m 755 $(LIBRARY)|' libraries/{liblber,libldap,libldap_r}/Makefile.in
  sed -i 's|#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP "run" LDAP_DIRSEP "ldapi"|#define LDAPI_SOCK LDAP_DIRSEP "run" LDAP_DIRSEP "openldap" LDAP_DIRSEP "ldapi"|' include/ldap_defaults.h
  sed -i 's|%LOCALSTATEDIR%/run|/run/openldap|' servers/slapd/slapd.{conf,ldif}
  sed -i 's|-$(MKDIR) $(DESTDIR)$(localstatedir)/run|-$(MKDIR) $(DESTDIR)/run/openldap|' servers/slapd/Makefile.in
}

build() {
  cd openldap-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man --libexecdir=/usr/lib \
    --sysconfdir=/etc --localstatedir=/var/lib/openldap --sbindir=/usr/bin \
    --enable-ipv6 --enable-syslog --enable-local \
    --enable-bdb --enable-hdb \
    --enable-crypt --enable-dynamic \
    --with-threads --disable-wrappers \
    --without-fetch \
    --enable-spasswd --with-cyrus-sasl \
    --enable-overlays=mod --enable-modules=yes
  make

  cd contrib/slapd-modules/smbk5pwd
  make prefix=/usr libexecdir=/usr/lib sysconfdir=/etc/openldap DEFS="-DDO_SAMBA -DDO_SHADOW" HEIMDAL_INC="" HEIMDAL_LIB=""
}

package() {
  cd openldap-${pkgver}
  pushd contrib/slapd-modules/smbk5pwd
  mkdir -p "${pkgdir}"/usr/lib/openldap
  install -m755 .libs/smbk5pwd.so.0.0.0 "${pkgdir}"/usr/lib/openldap
  ln -s smbk5pwd.so.0.0.0 "${pkgdir}"/usr/lib/openldap/smbk5pwd.so
  ln -s smbk5pwd.so.0.0.0 "${pkgdir}"/usr/lib/openldap/smbk5pwd.so.0
  popd
}
