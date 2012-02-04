# Maintainer: hugo <hugoalveslobo@sapo.pt>
pkgname=br2684ctl
pkgver=20040226
pkgrel=1
pkgdesc="PPPoE over ATM bridging utility for ADSL modems."
arch=(i686 x86_64)
url="http://packages.debian.org/unstable/net/br2684ctl"
depends=('linux-atm')

source=(http://ftp.debian.org/debian/pool/main/b/br2684ctl/br2684ctl_20040226.orig.tar.gz http://ftp.debian.org/debian/pool/main/b/br2684ctl/br2684ctl_20040226-1.diff.gz br2684ctl.sh)
md5sums=('6eb4d8cd174e24a7c078eb4f594f5b69' 'b10cfc558c80f262339f8f08cbfc469a' '3a5b5e3b2272d01dfb04b8d1b6713739')

build() {
  cd $startdir/src/br2684ctl-20040226.orig
  patch -Np1 -i /../br2684ctl_20040226-1.diff.gz
  cc -o br2684ctl br2684ctl.c -latm
  mkdir -p $startdir/pkg/usr/sbin
  mkdir -p $startdir/pkg/etc/rc.d
  install -D -m755  br2684ctl $startdir/pkg/usr/sbin/ 
  install -D -m755  ../br2684ctl.sh $startdir/pkg/etc/rc.d/br2684ctl
}
