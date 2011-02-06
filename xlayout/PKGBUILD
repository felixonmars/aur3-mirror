# $Id: PKGBUILD,v 1.36 2004/12/07 08:59:32 judd Exp $
# Maintainer: big_gie <coagulateur@gmail.com>
pkgname=xlayout
pkgver=0.3
pkgrel=1
pkgdesc="Make possible the choice of the X layout at boot time via a kernel parameter"
url="http://wiki.archlinux.org/index.php/XLayout"
source=(xlayout)
install=(xlayout.install)

build() {

  mkdir -p $startdir/pkg/etc/rc.d

  #-rwxr-xr-x
  install -m 755 $startdir/src/xlayout $startdir/pkg/etc/rc.d/xlayout

}
md5sums=('b01bde0691d1d18348d0d5baf99d08f5')
