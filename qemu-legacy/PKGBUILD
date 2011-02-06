# Maintainer: Vamp898 (vamp898@web.de)
pkgname=qemu-legacy
_realpkgname=qemu
pkgver=0.11.1
pkgrel=1
pkgdesc="QEMU is a generic and open source processor emulator which achieves a good emulation speed by using dynamic translation."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://www.nongnu.org/qemu/"
depends=('sdl' 'alsa-lib' 'esound' 'gnutls>=2.4.1' 'bluez' 'vde2' 'util-linux-ng' 'curl' 'libsasl')
install=qemu.install
source=(http://savannah.nongnu.org/download/${_realpkgname}/${_realpkgname}-${pkgver}.tar.gz
        65-kvm.rules
        70-kqemu.rules)

build()
{
  cd ${srcdir}/${_realpkgname}-${pkgver}
  sed -i -e 's/lib64/lib/g' x86_64.ld || return 1
  ./configure --prefix=/usr --audio-drv-list=oss,alsa,sdl,esd \
              --audio-card-list=ac97,sb16,es1370,adlib \
              --kerneldir="/usr/src/linux-$(uname -r)"
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -D -m644 ${srcdir}/70-kqemu.rules \
                   ${pkgdir}/lib/udev/rules.d/70-kqemu.rules
  install -D -m644 ${srcdir}/65-kvm.rules \
                   ${pkgdir}/lib/udev/rules.d/65-kvm.rules
}
md5sums=('193285b0bcf655a7f7577d05ffcb82b1'
         'cead7ba387159d360f892281499975df'
         'ec06591830b8fcf53913f05f3d66f7e5')
