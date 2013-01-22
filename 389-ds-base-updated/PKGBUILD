# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Enable SELinux support?
build_selinux=false

# Fedora release
_fedora_rel=1.fc18

pkgname=389-ds-base-updated
pkgver=1.3.0.2
pkgrel=1
pkgdesc="389 Directory Server (base)"
arch=('i686' 'x86_64')
url="http://port389.org/"
license=('GPL')
depends=('cyrus-sasl' 'cyrus-sasl-gssapi' 'icu' 'lm_sensors' 'net-snmp' 'nspr' 'nss' 'openldap' 'openssl' 'pcre' 'perl-mozldap' 'perl-netaddr-ip' 'svrcore' 'systemd' 'tcp_wrappers')
# depends+=('perl-socket6')
if [ "x${build_selinux}" == "xtrue" ]; then
  depends+=('selinux-usr-policycoreutils')
fi
provides=("389-ds-base=${pkgver}")
conflicts=('389-ds-base')
options=('!libtool')
source=("http://kojipkgs.fedoraproject.org//packages/389-ds-base/${pkgver}/${_fedora_rel}/src/389-ds-base-${pkgver}-${_fedora_rel}.src.rpm")
sha512sums=('2a1e0edbda95cbf111f47982976a75941572834932a6cd0564e818f563fc0266264b21f70877dc71b51a7340c15cd23538a539b3871f5a1fcb84d3bc73a7c86b')

build() {
  cd "${srcdir}"
  tar jxvf 389-ds-base-${pkgver}.tar.bz2
  cd "389-ds-base-${pkgver}"

  local SELINUX=""
  if [ "x${build_selinux}" == "xtrue" ]; then
    SELINUX="--with-selinux"
  fi

  ./configure \
    --prefix=/usr \
    --disable-static \
    --with-tmpfiles-d=/usr/lib/tmpfiles.d/ \
    --with-systemdsystemunitdir=/usr/lib/systemd/system/ \
    --with-systemdsystemconfdir=/etc/systemd/system/ \
    --with-systemdgroupname=dirsrv.target \
    --with-openldap \
    ${SELINUX} \
    --enable-autobind

  if [ "${CARCH}" == "x86_64" ]; then
    export USE_64=1
  fi

  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/389-ds-base-${pkgver}"
  make -j1 DESTDIR="${pkgdir}/" install

  install -dm755 "${pkgdir}/var/log/dirsrv/"
  install -dm755 "${pkgdir}/var/lib/dirsrv/"
  install -dm755 "${pkgdir}/var/lock/dirsrv/"

  install -dm755 "${pkgdir}/etc/systemd/system/dirsrv.wants/"
}

# vim:set ts=2 sw=2 et:
