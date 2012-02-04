# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>

pkgname=wifidog-gateway
_PKGNAME=wifidog
pkgver=1.1.5
pkgrel=2
pkgdesc="A complete and embeddable captive portal solution for operating an open hotspot or network of hotspots while preventing abuse of their Internet connection."
arch=('i686' 'x86_64')
url="http://dev.wifidog.org"
license=('GPLv2')
groups=('wifidog')
depends=('iptables')
optdepends=('iproute2: for bandwidth throttling')
install="$pkgname.install"
backup=("etc/${_PKGNAME}/${_PKGNAME}.conf")
source=("http://downloads.sourceforge.net/${_PKGNAME}/${_PKGNAME}-${pkgver}.tar.gz" 'rc.wifidog')
md5sums=('abe5f7123179a0f08c493ce59fb3cb31'
        '2e355a6d063601a3bf21a733bdac3bcb')

build() {
  cd "$srcdir/$_PKGNAME-$pkgver"
  
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man || return 1

  make || return 1
}
  
package() {
  cd "$srcdir/$_PKGNAME-$pkgver"

  make DESTDIR="$pkgdir/" install || return 1
  
  # Copy some extra files over to the package that 'make install' doesn't do
  install -Dm755 ${srcdir}/rc.$_PKGNAME ${pkgdir}/etc/rc.d/${_PKGNAME}
  install -Dm644 ${srcdir}/${_PKGNAME}-${pkgver}/${_PKGNAME}.conf ${pkgdir}/etc/${_PKGNAME}/${_PKGNAME}.conf

  # Change the default conf to block port 25 by default. Opening port 25
  # to a public network is fscking stupid and open to abuse so we'll default
  # it here. Call it our small contribution to spam prevention.
  sed -i 's/#FirewallRule\ block\ tcp\ port\ 25/FirewallRule\ block\ tcp\ port\ 25/g' ${pkgdir}/etc/${_PKGNAME}/${_PKGNAME}.conf
  
  # Change the default "LAN" interface in the config file
  sed -i 's/^GatewayInterface\ br0$/GatewayInterface\ eth1/g' ${pkgdir}/etc/${_PKGNAME}/${_PKGNAME}.conf
}

# vim:set ts=2 sw=2 et:
