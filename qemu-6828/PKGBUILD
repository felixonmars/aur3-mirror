# Maintainer: Cyker Way <cykerway@gmail.com>

pkgname=qemu-6828
pkgver=0.12.5
pkgrel=1
pkgdesc="QEMU patched for MIT-6.828 course."
arch=('i686')
license=('GPL2' 'LGPL2.1')
url="http://wiki.qemu.org/Index.html"
makedepends=('texi2html' 'perl')
depends=('sdl' 'alsa-lib' 'esound' 'gnutls>=2.4.1' 'bluez' 'vde2' 'util-linux-ng' 'curl' 'libsasl')
install=qemu.install
source=(http://savannah.nongnu.org/download/qemu/qemu-${pkgver}.tar.gz
        debug-seg
        info-mem
        info-pg
        e100
        pcap
        triple)

build()
{
  install -m644 debug-seg info-mem info-pg e100 pcap triple ${srcdir}/qemu-${pkgver}
  cd ${srcdir}/qemu-${pkgver}
  patch -p1 < debug-seg
  patch -p1 < info-mem
  patch -p1 < info-pg
  patch -p1 < e100
  patch -p1 < pcap
  patch -p1 < triple

  ./configure --prefix=/usr --target-list="i386-softmmu"
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
md5sums=('1d02ee0a04dfae2894340273372c1de4'
         '7f920c9ec7cd42d1c755b2ee80968363'
         '1e7b8569b748df909c696776aeed7233'
         'f8dfbe002207f5ed4da58937caa553d2'
         'b4dec355160db200b2f7ff91a52da055'
         '7cbde4eba08c922ff8b080dbf5eb32aa'
         '9170d549513e2405191b60490acb7ce2')
