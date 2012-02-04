# Maintainer: archme

pkgbase='fusiondirectory-plugins'
pkgname='fusiondirectory-plugins'
true && pkgname=('fusiondirectory-plugins-addressbook'
	 	 'fusiondirectory-plugins-dhcp'
	 	 'fusiondirectory-plugins-dhcp-schema'
	 	 'fusiondirectory-plugins-dns'
	 	 'fusiondirectory-plugins-dns-schema'
	 	 'fusiondirectory-plugins-samba'
	 	 'fusiondirectory-plugins-ssh'
	 	 'fusiondirectory-plugins-ssh-schema'
		 'fusiondirectory-plugins-systems')

pkgver=1.0.1
pkgrel=1
pkgdesc="Plugins for Fusiondirectory Infrastructure Manager"
arch=('any')
license=('LGPL')
url="http://www.fusiondirectory.org"
depends=()
optdepends=()
makedepends=()
options=(!libtool)
source=(http://download.fusiondirectory.org/sources/1.0/${pkgbase}-${pkgver}.tar.gz)
md5sums=('10fa4d2c87dd19f632ec4fbdb66d268e')


build() {
  echo "Start packaging..."
}

package_fusiondirectory-plugins-systems() {
  pkgdesc="Systems Plugin for Fusiondirectory Infrastructure Manager"
  depends=('fusiondirectory')

  _pluginname='systems'
  install=${pkgbase}-systems.install

  echo "Packaging ${pkgbase}-${_pluginname}"

  cd ${srcdir}/${pkgbase}-${pkgver}

  install -d -m755 "${pkgdir}/opt/fusiondirectory/plugins"
  install -d -m755 "${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}"
  install -d -m755 "${pkgdir}/opt/fusiondirectory/html/plugins/${_pluginname}"
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/admin ${pkgdir}/opt/fusiondirectory/plugins
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/locale/* ${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/html/images ${pkgdir}/opt/fusiondirectory/html/plugins/${_pluginname}
}

package_fusiondirectory-plugins-addressbook() {
  pkgdesc="Addressbook Plugin for Fusiondirectory Infrastructure Manager"
  depends=('fusiondirectory' 'fusiondirectory-plugins-systems')

  _pluginname='addressbook'
  install=${pkgbase}-addressbook.install

  echo "Packaging ${pkgbase}-${_pluginname}"

  cd ${srcdir}/${pkgbase}-${pkgver}

  install -d -m755 "${pkgdir}/opt/fusiondirectory/plugins"
  install -d -m755 "${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}"
  install -d -m755 "${pkgdir}/opt/fusiondirectory/html/plugins/${_pluginname}"
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/addons ${pkgdir}/opt/fusiondirectory/plugins
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/locale/* ${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/html/getvcard.php ${pkgdir}/opt/fusiondirectory/html/plugins/${_pluginname}
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/html/images ${pkgdir}/opt/fusiondirectory/html/plugins/${_pluginname}
}

package_fusiondirectory-plugins-dhcp() {
  pkgdesc="DHCP Plugin for Fusiondirectory Infrastructure Manager"
  depends=('fusiondirectory' 'fusiondirectory-plugins-systems')
  optdepends=('dhcp-ldap' 'fusiondirectory-plugins-dhcp-schema')

  _pluginname='dhcp'
  install=${pkgbase}-dhcp.install

  echo "Packaging ${pkgbase}-${_pluginname}"

  cd ${srcdir}/${pkgbase}-${pkgver}

  install -d -m755 "${pkgdir}/opt/fusiondirectory/plugins"
  install -d -m755 "${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}"
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/admin ${pkgdir}/opt/fusiondirectory/plugins
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/locale/* ${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}
}

package_fusiondirectory-plugins-dhcp-schema() {
  pkgdesc="Schemas for DHCP Plugin for Fusiondirectory Infrastructure Manager"
  depends=('fusiondirectory-schema')
  optdepends=('dhcp-ldap')

  _pluginname='dhcp'
  install=${pkgbase}-dhcp-schema.install

  echo "Packaging ${pkgbase}-${_pluginname}-schema"

  cd ${srcdir}/${pkgbase}-${pkgver}

  install -d -m755 "${pkgdir}/etc/openldap/schema/fusiondirectory"
  install -D -m644 ${_pluginname}/contrib/dhcp.schema "${pkgdir}/etc/openldap/schema/fusiondirectory"
}

package_fusiondirectory-plugins-dns() {
  pkgdesc="DNS Plugin Fusiondirectory Infrastructure Manager"
  depends=('fusiondirectory' 'fusiondirectory-plugins-systems')
  optdepends=('bind' 'ldap2zone-git' 'fusiondirectory-plugins-dns-schema')

  _pluginname='dns'
  install=${pkgbase}-dns.install

  echo "Packaging ${pkgbase}-${_pluginname}"

  cd ${srcdir}/${pkgbase}-${pkgver}

  install -d -m755 "${pkgdir}/opt/fusiondirectory/plugins"
  install -d -m755 "${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}"
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/admin ${pkgdir}/opt/fusiondirectory/plugins
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/locale/* ${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}
}

package_fusiondirectory-plugins-dns-schema() {
  pkgdesc="Schemas for DNS Plugin for Fusiondirectory Infrastructure Manager"
  depends=('fusiondirectory-schema')
  optdepends=('bind' 'ldap2zone-git')

  _pluginname='dns'
  install=${pkgbase}-dns-schema.install

  echo "Packaging ${pkgbase}-${_pluginname}-schema"

  cd ${srcdir}/${pkgbase}-${pkgver}

  install -d -m755 "${pkgdir}/etc/openldap/schema/fusiondirectory"
  install -D -m644 ${_pluginname}/contrib/dnszone.schema "${pkgdir}/etc/openldap/schema/fusiondirectory"
}

package_fusiondirectory-plugins-ssh() {
  pkgdesc="SSH Plugin for Fusiondirectory Infrastructure Manager"
  depends=('fusiondirectory' 'fusiondirectory-plugins-systems')
  optdepends=()

  _pluginname='ssh'
  install=${pkgbase}-ssh.install

  echo "Packaging ${pkgbase}-${_pluginname}"

  cd ${srcdir}/${pkgbase}-${pkgver}

  install -d -m755 "${pkgdir}/opt/fusiondirectory/plugins"
  install -d -m755 "${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}"
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/personal ${pkgdir}/opt/fusiondirectory/plugins
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/locale/* ${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}
}

package_fusiondirectory-plugins-ssh-schema() {
  pkgdesc="Schemas for SSH Plugin for Fusiondirectory Infrastructure Manager"
  depends=('fusiondirectory-schema')
  optdepends=()

  _pluginname='ssh'
  install=${pkgbase}-ssh-schema.install

  echo "Packaging ${pkgbase}-${_pluginname}-schema"

  cd ${srcdir}/${pkgbase}-${pkgver}

  install -d -m755 "${pkgdir}/etc/openldap/schema/fusiondirectory"
  install -D -m644 ${_pluginname}/contrib/openssh-lpk.schema "${pkgdir}/etc/openldap/schema/fusiondirectory"
}

package_fusiondirectory-plugins-samba() {
  pkgdesc="Samba Plugin for Fusiondirectory Infrastructure Manager"
  depends=('fusiondirectory' 'fusiondirectory-plugins-systems')
  optdepends=('samba' 'smbldap-tools')

  _pluginname='samba'
  install=${pkgbase}-samba.install

  echo "Packaging ${pkgbase}-${_pluginname}"

  cd ${srcdir}/${pkgbase}-${pkgver}

  install -d -m755 "${pkgdir}/opt/fusiondirectory/plugins"
  install -d -m755 "${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}"
  install -d -m755 "${pkgdir}/opt/fusiondirectory/html/plugins/${_pluginname}"
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/admin ${pkgdir}/opt/fusiondirectory/plugins
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/personal ${pkgdir}/opt/fusiondirectory/plugins
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/locale/* ${pkgdir}/opt/fusiondirectory/locale/plugins/${_pluginname}
  cp -ar ${srcdir}/${pkgbase}-${pkgver}/${_pluginname}/html/images ${pkgdir}/opt/fusiondirectory/html/plugins/${_pluginname}
}
