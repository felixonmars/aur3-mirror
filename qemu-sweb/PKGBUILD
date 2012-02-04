# Based on Tobias Powalowski's <tpowa@archlinux.org> original arch linux qemu package.
realname=qemu
pkgname=qemu-sweb
pkgver=0.15.0
pkgrel=2
pkgdesc="Qemu with debug-info patch for the use with the sweb operating system."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://wiki.qemu.org/Index.html"
makedepends=('texi2html' 'perl' 'python2')
conflicts=(qemu)
provides=(qemu)
depends=('libjpeg' 'libpng' 'sdl' 'alsa-lib' 'nss' 'glib2' 'gnutls>=2.4.1' 'bluez' 'vde2' 'util-linux-ng' 'curl' 'libsasl' 'libgl')
backup=('etc/qemu/target-x86_64.conf')
install=qemu.install
source=(http://wiki.qemu.org/download/${realname}-${pkgver}.tar.gz
        65-kvm.rules
        qemu-debug-info-0xe9.patch)
options=(!strip)

build()
{
  cd ${srcdir}/${realname}-${pkgver}

  patch -i ${srcdir}/qemu-debug-info-0xe9.patch

  sed -i -e 's/lib64/lib/g' x86_64.ld
  ./configure --prefix=/usr --sysconfdir=/etc --audio-drv-list=oss,alsa,sdl \
              --python=/usr/bin/python2 \
              --audio-card-list=ac97,sb16,es1370,hda \
              --enable-docs
              make
}

package() {
  cd ${srcdir}/${realname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -D -m644 ${srcdir}/65-kvm.rules \
                   ${pkgdir}/lib/udev/rules.d/65-kvm.rules
  # strip scripts directory
    find ${pkgdir}/usr/src/linux-${_kernver}/scripts  -type f -perm -u+w 2>/dev/null | while read binary ; do
      case "$(file -bi "$binary")" in
        *application/x-executable*) # Binaries
        /usr/bin/strip $STRIP_BINARIES "$binary";;
      esac
    done

}
md5sums=('dbc55b014bcd21b98e347f6a90f7fb6d'
         'b316a066d2f1bb57d8f5b7ea1d0d1caf'
         'a84a042559750476f030bf40334c4bc8')
