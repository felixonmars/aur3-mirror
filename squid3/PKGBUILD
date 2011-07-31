# Maintainer: Christos Nouskas <nous at archlinux dot us>
# Original squid2 PKGBUILD by Kevin Piche <kevin@archlinux.org>
# and Tom Newsom <Jeepster@gmx.co.uk>

pkgname=squid3
_distname=squid
pkgver=3.1.14
pkgrel=1
pkgdesc="A full-featured Web proxy cache server. Version 3."
arch=(i686 x86_64)
url="http://www.squid-cache.org"
depends=('openssl' 'pam' 'cron' 'perl')
makedepends=('libcap>=2.16')
conflicts=('squid')

license=('GPL')
backup=(etc/squid/squid.conf etc/squid/mime.conf etc/conf.d/squid)
install=${_distname}.install
source=(http://www.squid-cache.org/Versions/v3/3.1/${_distname}-${pkgver}.tar.bz2
        archvars.patch squid squid.conf.d squid.pam
        squid.cron)

build() {
  cd ${srcdir}/${_distname}-${pkgver}
  patch -Np1 -i ${srcdir}/archvars.patch

  ./configure --prefix=/usr --datadir=/usr/share/squid \
      --sysconfdir=/etc/squid --libexecdir=/usr/lib/squid \
      --localstatedir=/var --enable-auth="basic,digest,ntlm" \
      --enable-removal-policies="lru,heap" \
      --enable-digest-auth-helpers="password" \
      --enable-storeio="aufs,ufs,diskd" \
      --enable-basic-auth-helpers="DB,LDAP,MSNT,NCSA,PAM,POP3,SASL,SMB,YP,getpwnam,multi-domain-NTLM,squid_radius_auth" \
      --enable-external-acl-helpers="ip_user,ldap_group,session,unix_group,wbinfo_group" \
      --enable-ntlm-auth-helpers="smb_lm,fakeauth,no_check" \
      --enable-delay-pools --enable-arp-acl --enable-ssl --enable-snmp \
      --enable-linux-netfilter --enable-ident-lookups \
      --enable-useragent-log --enable-cache-digests --enable-referer-log \
      --enable-async-io --enable-truncate --enable-arp-acl \
      --enable-htcp --enable-carp --enable-epoll --with-maxfd=4096 \
      --with-large-files --enable-linux-tproxy --enable-follow-x-forwarded-for \
      --with-logdir=/var/log/squid --with-pidfile=/var/run/squid.pid \
      --disable-strict-error-checking --with-default-user=proxy
# some versions have build problems with both async and truncate enabled:
#      --enable-async-io --enable-arp-acl \
  make
}

package() {
  export PATH=$PATH:/usr/bin/core_perl
  cd ${srcdir}/${_distname}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/var
#  mv ${pkgdir}/usr/bin/Run* ${pkgdir}/usr/lib/squid
  mkdir -p ${pkgdir}/var/cache/squid
  mkdir -p ${pkgdir}/var/log/squid
  install -D -m755 ${srcdir}/squid ${pkgdir}/etc/rc.d/squid
  install -D -m755 ${srcdir}/squid.cron ${pkgdir}/etc/cron.weekly/squid
  install -D -m644 ${srcdir}/squid.conf.d ${pkgdir}/etc/conf.d/squid
  install -D -m644 ${srcdir}/squid.pam ${pkgdir}/etc/pam.d/squid
  install -D -m644 ${pkgdir}/etc/squid/squid.conf \
                   ${pkgdir}/etc/squid/squid.conf.default
}

#
sha256sums=('8faf16d73ae44029e698160386c45ab853f2fc842601bd550a1c5461815d8a3e'
            '247533512c33974be42e977cdd8e175a7ac89dbffe58c00ad2b87474c1b2eff3'
            '33d506396390eec69e50f831be476298e78fb5a153c06b2d5dd8f820ad1052c9'
            '92ca3ff6ed26f71f20947defef67ff397038d5402b74aeed739ea504af2b188d'
            '11fb388f8679fd6461e0de006810ea608a3686fffda16904b0ed71f412be499c'
            '4086e728d117fe8b23fa3ca26ceb98cfee1ae35b95fee087bbe10eddea7ddee9')
