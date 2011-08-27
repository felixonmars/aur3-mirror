# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>
# Based on the wifidog-gateway package
pkgname=wifidog-gateway-svn
_PKGNAME=wifidog
pkgver=1461
pkgrel=2
pkgdesc="A complete and embeddable captive portal solution for operating an open hotspot or network of hotspots while preventing abuse of their Internet connection."
arch=('i686' 'x86_64')
url="http://dev.wifidog.org"
license=('GPLv2')
groups=('wifidog')
makedepends=(subversion)
depends=('iptables')
optdepends=('iproute2: for bandwidth throttling')
install="$pkgname.install"
backup=("etc/${_PKGNAME}/${_PKGNAME}.conf")
source=("rc.wifidog")
conflicts=(wifidog-gateway)
provides=(wifidog-gateway)
md5sums=('2e355a6d063601a3bf21a733bdac3bcb')

_svntrunk=https://dev.wifidog.org/svn/trunk/${_PKGNAME}
_svnmod=${_PKGNAME}

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  ./autogen.sh || return 1
  ./configure --prefix=/usr \
              --sysconfdir=/etc/${_PKGNAME} \
              --mandir=/usr/share/man || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install || return 1
  
  # Copy some extra files over to the package that 'make install' doesn't do
  install -Dm755 "${srcdir}/rc.${_PKGNAME}" "${pkgdir}/etc/rc.d/${_PKGNAME}"
  install -Dm644 "${srcdir}/$_svnmod-build/${_PKGNAME}.conf" "${pkgdir}/etc/${_PKGNAME}/${_PKGNAME}.conf"
  install -Dm644 "${srcdir}/$_svnmod-build/wifidog-msg.html" "${pkgdir}/etc/${_PKGNAME}/wifidog-msg.html"

  # Change the default conf to block port 25 by default. Opening port 25
  # to a public network is fscking stupid and open to abuse so we'll default
  # it here. Call it our small contribution to spam prevention.
  sed -i 's/#FirewallRule\ block\ tcp\ port\ 25/FirewallRule\ block\ tcp\ port\ 25/g' "${pkgdir}/etc/${_PKGNAME}/${_PKGNAME}.conf"

  # Change the default "LAN" interface in the config file
  sed -i 's/^GatewayInterface\ br0$/GatewayInterface\ eth1/g' "${pkgdir}/etc/${_PKGNAME}/${_PKGNAME}.conf"
}
