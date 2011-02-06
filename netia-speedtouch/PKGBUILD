# Contributor grimi@poczta.fm

pkgname=netia-speedtouch
pkgver=1.0
pkgrel=2
pkgdesc="Netia-net24 speedtouch 330 setup pack"
url="http://www.linux-usb.org/SpeedTouch/index.html"
depends=('ppp' 'udev' 'linux-atm')
arch=('i686')
license=(custom)
provides=('br2684ctl')
install=net24.install
backup=('etc/ppp/chap-secrets' 'etc/ppp/pap-secrets' 'etc/resolv.conf' 'etc/ppp/peers/net24')
source=("http://www.linux-usb.org/SpeedTouch/firmware/firmware-extractor.tar.gz"
        "http://www.speedtouch.com/download/drivers/USB/SpeedTouch330_firmware_3012.zip"
        "http://ftp.debian.org/debian/pool/main/b/br2684ctl/br2684ctl_20040226.orig.tar.gz"
        "http://ftp.debian.org/debian/pool/main/b/br2684ctl/br2684ctl_20040226-1.diff.gz"
        "net24.peers" "net24.resolv" "net24.rc")
md5sums=('752e33faf0b62176114e757dfc1e7191' '2551ce46ef785642f2c6768511f70ff3'
         '6eb4d8cd174e24a7c078eb4f594f5b69' 'b10cfc558c80f262339f8f08cbfc469a'
         '4c1daffad30ebc3ade7c6c8d799e3e4f' '2ef996a5b54c97010a422b6f38d01b42'
         '5d24efdc3eac959169c51dee8d31c54d')

build() {
  # install br2684ctl
  cd $startdir/src/br2684ctl-20040226.orig
  patch -Np1 -i ../br2684ctl_20040226-1.diff
  cc -o br2684ctl br2684ctl.c -latm
  install -D -m755 br2684ctl $startdir/pkg/usr/bin/br2684ctl
  # install firmware
  cd $startdir/src/firmware-extractor
  install -m644 ../ZZZL_3.012 $startdir/src/firmware-extractor/mgmt.o
  ./configure
  make || return 1
  install -p -d $startdir/pkg/lib/firmware
  install -m600 speedtch-{1,2}.bin $startdir/pkg/lib/firmware
  # install rest stuff
  cd $startdir/src
  install -D -m755 net24.rc $startdir/pkg/etc/rc.d/net24
  install -D -m644 net24.peers $startdir/pkg/etc/ppp/peers/net24
  install -D -m644 net24.resolv $startdir/pkg/etc/ppp/resolv.conf
  cd $startdir/pkg/etc; ln -s /etc/ppp/resolv.conf resolv.conf
}
