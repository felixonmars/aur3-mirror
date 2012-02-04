# Maintainer: Uwe L. Korn <uwelk@xhochy.com>
# Contributor: Uwe L. Korn <uwelk@xhochy.com>

pkgname=openldap-smbk5pwd
pkgver=2.4.26
pkgrel=7
pkgdesc="smbk5pwd Module LDAP Server (change LDAP, Samba and Kerberos password simultanouesly)"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.openldap.org/"
depends=("libldap>=${pkgver}" 'openldap' 'heimdal-aur')
source=("ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-${pkgver}.tgz")
md5sums=('f36f3086031dd56ae94f722ffae8df5e')
options=("emptydirs" "!libtool")

build() {
  cd "${srcdir}"/openldap-${pkgver}
  sed -i 's|-m 644 $(LIBRARY)|-m 755 $(LIBRARY)|' libraries/{liblber,libldap,libldap_r}/Makefile.in
  sed -i 's|#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP "run" LDAP_DIRSEP "ldapi"|#define LDAPI_SOCK LDAP_DIRSEP "run" LDAP_DIRSEP "openldap" LDAP_DIRSEP "ldapi"|' include/ldap_defaults.h
  sed -i 's|%LOCALSTATEDIR%/run|/run/openldap|' servers/slapd/slapd.conf
  sed -i 's|-$(MKDIR) $(DESTDIR)$(localstatedir)/run|-$(MKDIR) $(DESTDIR)/run/openldap|' servers/slapd/Makefile.in

  LDFLAGS="$LDFLAGS -L\"openldap-${pkgver}\"/libldap/usr/lib" 
  ./configure --prefix=/usr --mandir=/usr/share/man --libexecdir=/usr/lib \
    --sysconfdir=/etc --localstatedir=/var/lib/openldap \
    --enable-ipv6 --enable-syslog --enable-local \
    --enable-bdb --enable-hdb \
    --enable-crypt --enable-dynamic \
    --with-threads  --disable-wrappers \
    --enable-spasswd --with-cyrus-sasl \
    --enable-overlays=mod --enable-modules=yes
  
  cd include
  make
  
  cd ${srcdir}/openldap-${pkgver}/contrib/slapd-modules/smbk5pwd
  cp /usr/include/et/com_err.h ${srcdir}/openldap-${pkgver}/include 
  make
}

package() {
  cd ${srcdir}/openldap-${pkgver}/contrib/slapd-modules/smbk5pwd
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/lib/openldap
  mv ${pkgdir}/usr/local/libexec/openldap/* ${pkgdir}/usr/lib/openldap/
  rmdir ${pkgdir}/usr/local/libexec/openldap
  rmdir ${pkgdir}/usr/local/libexec
  rmdir ${pkgdir}/usr/local
  
  install -Dm644 ${srcdir}/openldap-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
