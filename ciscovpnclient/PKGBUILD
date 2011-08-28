# Maintainer: ik_5 <idokan@gmail.com>
pkgname=ciscovpnclient
_pkgname=vpnclient
pkgver=4.8.02.0030_k9
_pkgver=4.8.02.0030-k9
_kernver="`uname -r`"
pkgrel=1
pkgdesc="Client to access Cisco VPNs (Virtual Private Network)"
arch=('x86_64')
url="http://www.painfullscratch.nl/code/vpn/index.html"
license=('custom')
groups=()
depends=(linux)
makedepends=(linux linux-headers)
checkdepends=()
optdepends=()
provides=(cisco-vpnclient)
conflicts=(cisco-vpnclient)
replaces=(cisco-vpnclient)
backup=()
options=()
install=$pkgname.install
changelog=
source=(http://projects.tuxx-home.at/ciscovpn/clients/linux/4.8.02/$_pkgname-linux-x86_64-$_pkgver.tar.gz 
        vpnclient-linux-4.8.02-64bit.ge.2.6.31.patch 
        vpnclient-linux-4.8.02-64bit.patch)
noextract=()
md5sums=('3ccc9641fd7dae29bfc90556ae5c4b74' 
         'ae01e85d83efed95745052365a2f2f99'
         '1cf19ef6ce89db33ef4a9740a559d7b1') #generate with 'makepkg -g'

build() {
  cd "$srcdir/vpnclient"

  msg2 "Applying patches..."
  patch < ../vpnclient-linux-4.8.02-64bit.ge.2.6.31.patch || return 1
  patch < ../vpnclient-linux-4.8.02-64bit.patch || return 1

  msg2 "Remove old autoconf settings"
  sed "s/#include <linux\/autoconf.h>//g" linuxcniapi.c > linuxcniapi.c
  sed "s/#include <linux\/autoconf.h>//g" frag.c > frag.c
  sed "s/#include <linux\/autoconf.h>//g" IPSecDrvOS_linux.c > IPSecDrvOS_linux.c 
  sed "s/#include <linux\/autoconf.h>//g" interceptor.c > interceptor.c

  msg2 "Building..." 
  KBUILD_NOPEDANTIC=1 make
}

package() {
  cd "$srcdir/vpnclient"

  msg2 "Installing files and creating symlinks..."
  install -d -m755 "$pkgdir/opt/$pkgname/bin"
  install -D -m755 $_pkgname cvpnd ipseclog cisco_cert_mgr "$pkgdir/opt/$pkgname/bin/"
  install -D -m755 libvpnapi.so "$pkgdir/opt/$pkgname/lib/libvpnapi.so"
  install -D -m644 vpnapi.h "$pkgdir/opt/$pkgname/include/vpnapi.h"
  install -D -m644 $_pkgname.ini "$pkgdir/opt/$pkgname/$_pkgname.ini"
  install -D -m644 sample.pcf "$pkgdir/opt/$pkgname/Profiles/sample.pcf"
  install -d -m755 "$pkgdir/opt/$pkgname/Certificates"
  install -D -m644 cisco_ipsec.ko "$pkgdir/lib/modules/$_kernver/CiscoVPN/cisco_ipsec.ko"
  install -D -m644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -d -m755 "$pkgdir/usr/bin"
  install -d -m755 "$pkgdir/etc"
  ln -sf "/opt/$pkgname/bin/vpnclient" "$pkgdir/usr/bin/cisco-vpnclient"
  ln -sf "/opt/$pkgname/bin/cisco_cert_mgr" "$pkgdir/usr/bin/cisco_cert_mgr"
  ln -sf "/opt" "$pkgdir/etc/opt"

  msg2 "Updating install file..."
}
