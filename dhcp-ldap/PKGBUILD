# $Id: PKGBUILD 104595 2011-01-04 13:21:07Z daniel $
# Maintainer: Daniel Isenmann <daniel @archlinux.org>

pkgbase=dhcp
pkgname='dhcp-ldap'

# separate patch levels with a period to maintain proper versioning.
#pkgver=4.2.0.2
#_pkgver=4.2.0-P2
pkgver=4.2.1
_pkgver=4.2.1

pkgrel=1
arch=('i686' 'x86_64')
license=('custom:isc-dhcp')
url="https://www.isc.org/software/dhcp"
source=(http://ftp.isc.org/isc/${pkgbase}/${pkgbase}-${_pkgver}.tar.gz
        dhcpd dhcp.conf.d
        dhcp-4.1.1-missing-ipv6-not-fatal.patch
        dhclient-script-pathFixes.patch
        dhcpd.conf)

md5sums=('bddce8a23551f009fd0ac840afc89780'
         'df22cffa7d7415ece7bb025b7bf774dd'
         '49da3192e5c885e3c7d02f447c2dea5e'
         'fd64aeb4f399dcc41ea43089a3811094'
         'ddcc5cd576ec631ade6c4da21952b50b'
         '7f7514387cfa3808200417321c7632e0')

build() {
  cd ${srcdir}/${pkgbase}-${_pkgver}

  # Define _GNU_SOURCE to fix IPV6.
  sed '/^CFLAGS="$CFLAGS/ s/INGS"/INGS -D_GNU_SOURCE"/' -i configure

  # Make not having ipv6 non-fatal.
  patch -Np0 -i ${srcdir}/dhcp-4.1.1-missing-ipv6-not-fatal.patch

  ./configure --prefix=/usr --sysconfdir=/etc \
      --with-srv-lease-file=/var/state/dhcp/dhcpd.leases \
      --with-srv6-lease-file=/var/state/dhcp/dhcpd6.leases \
      --with-ldap

  make

  patch -i ${srcdir}/dhclient-script-pathFixes.patch client/scripts/linux
}

package_dhcp-ldap(){
  pkgdesc="A DHCP server, client, and relay agent, with ldap support"
  depends=('openssl>=0.9.8a')
  backup=('etc/dhcpd.conf' 'etc/conf.d/dhcp')
  install=dhcp.install

  cd ${srcdir}/${pkgbase}-${_pkgver}
  make DESTDIR=${pkgdir} install

  install -D -m755 ${srcdir}/dhcpd ${pkgdir}/etc/rc.d/dhcpd
  install -D -m644 ${srcdir}/dhcp.conf.d ${pkgdir}/etc/conf.d/${pkgbase}
  install -D -m640 ${srcdir}/dhcpd.conf ${pkgdir}/etc/dhcpd.conf
  mkdir -p ${pkgdir}/var/state/dhcp

  # Remove dhclient
  make -C client DESTDIR=${pkgdir} uninstall

  # install license
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/dhcp/LICENSE
}
