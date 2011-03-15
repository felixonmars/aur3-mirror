# Maintainer: Di "thc_flow" Abel <nospam@weedsmoker.im>
pkgname=qemu-legacy-light
_realpkgname=qemu
pkgver=0.11.1
pkgrel=1
pkgdesc="QEMU 0.11 without XEN, KVM, esound, bluetooth, curl, VDE, VNC encryption, usermode and non x86 platforms emulation"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://www.nongnu.org/qemu/"
depends=('sdl' 'alsa-lib' 'util-linux')
provides=('qemu' 'qemu-legacy')
conflicts=('qemu' 'qemu-legacy')
source=(http://savannah.nongnu.org/download/${_realpkgname}/${_realpkgname}-${pkgver}.tar.gz 70-kqemu.rules)

build()
{
  cd ${srcdir}/${_realpkgname}-${pkgver}
  sed -i -e 's/lib64/lib/g' x86_64.ld || return 1
  ./configure --prefix=/usr --audio-drv-list=oss,alsa \
              --audio-card-list=ac97,sb16 \
              --kerneldir="/usr/src/linux-$(uname -r)" \
              --disable-xen --disable-kvm --disable-linux-user \
              --disable-darwin-user --disable-bsd-user \
              --disable-vde --enable-mixemu --disable-curses \
              --disable-vnc-tls --disable-vnc-sasl --disable-curl \
              --disable-bluez --target-list=i386-softmmu \
              --enable-io-thread
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -D -m644 ${srcdir}/70-kqemu.rules \
                   ${pkgdir}/lib/udev/rules.d/70-kqemu.rules
}
md5sums=('193285b0bcf655a7f7577d05ffcb82b1' 'ec06591830b8fcf53913f05f3d66f7e5')
