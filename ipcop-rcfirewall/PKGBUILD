# Maintainer: felipe.facundes <felipe.facundes at gmail dot com>
# Contributor: felipe.facundes <felipe.facundes at gmail dot com
#

pkgname=ipcop-rcfirewall
pkgver=2.0
pkgrel=1
pkgdesc="IPCop-rcfirewall is a script for iptables, extracted the famous IPCop firewall."
arch=('any')
depends=('iptables')
makedepends=('tar')
url="http://ipcop.org/"
license=('GPL')
source=(
https://www.dropbox.com/s/5o21l6wosiclkzq/rcfirewall-2.0.tar.xz)

build()
{
 cd "$srcdir"
 install -d "${pkgdir}/"
 chmod +x usr/bin/rcfirewal*
 cp -rf "usr" "${pkgdir}/" || return 1
 echo -e "run command for enable: rcfirewall-start 		&&  for disable	rcfirewall-stop"
 }

sha256sums=('e16d3b17a195b215ac2df3ac4578ebb8fdde7eafe6bc2432edb153c4bd176e5f')