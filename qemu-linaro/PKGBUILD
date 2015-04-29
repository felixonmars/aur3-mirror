# Maintainer: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
# Contributor: Eric Cyb <cyberic99 _@_ gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname=qemu-linaro
ver=14.01
pkgver=1.7.0
pkgrel=4
pkgdesc="Community Improvements on A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="https://launchpad.net/qemu-linaro"
makedepends=('texi2html' 'perl' 'python2')
depends=('pixman' 'libjpeg' 'libpng' 'sdl' 'alsa-lib' 'nss' 'glib2'
         'gnutls>=2.4.1' 'bluez-libs' 'vde2' 'util-linux' 'curl' 'libsasl'
         'libgl' 'libpulse' 'seabios' 'libcap-ng' 'libaio' 'libseccomp'
         'libiscsi' 'gtk3' 'vte290' 'dtc')
backup=('etc/qemu/target-x86_64.conf')
conflicts=('qemu' 'qemu-kvm')
provides=('qemu' 'libcacard')
install=${pkgname}.install
source=("$pkgname::http://releases.linaro.org/${ver}/components/toolchain/qemu-linaro/${pkgname}-${pkgver}-20${ver}.tar.gz"
        '65-kvm.rules')
options=(!strip)
sha512sums=('c296eef720af68e194b939aeb5208391c57b0264a9bf1dd461e3a9b6d6a6416355ccede8e8a4b76eeeadcf340e32fc3b1b0025212fc88f24b72c7f01f315a4f0'
            '98aad2a2f212a7ac0ee5b60a9c92744fa462bce5f26594845c7a31d692aaaca2d52cb57bdbede7dfc60b9862c2a6510665dbb03215d5cf76e62516a283decdd6')

build ()
{
  #you can add --enable-docs to build the doc. you will need texinfo and perl.
  cd "${srcdir}/${pkgname}-${pkgver}-20${ver}"
  sh ./configure --prefix=/usr --sysconfdir=/etc --audio-drv-list='pa alsa sdl'\
              --python=/usr/bin/python2 --smbd=/usr/bin/smbd \
              --disable-docs --libexecdir=/usr/lib/qemu \
              --enable-gtk --with-gtkabi=3.0 --enable-linux-aio --enable-seccomp
              make DESTDIR=$pkgdir
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-20${ver}"
  make DESTDIR="${pkgdir}" libexecdir="/usr/lib/qemu" install
  rm -f "${pkgdir}/usr/share/qemu/bios.bin"

  install -D -m644 "${srcdir}/65-kvm.rules" \
                   "${pkgdir}/usr/lib/udev/rules.d/65-kvm.rules"
  # bridge_helper needs suid
  # https://bugs.archlinux.org/task/32565
  chmod u+s "${pkgdir}/usr/lib/qemu/qemu-bridge-helper"
  # add sample config
  echo "allow br0" > ${pkgdir}/etc/qemu/bridge.conf.sample
  # strip scripts directory
    find "${pkgdir}/usr/src/linux-${_kernver}/scripts"  -type f -perm -u+w 2>/dev/null | while read binary ; do
      case "$(file -bi "$binary")" in
        *application/x-executable*) # Binaries
        /usr/bin/strip $STRIP_BINARIES "$binary";;
      esac
    done

  # remove conflicting files
  rm "${pkgdir}/usr/share/qemu/acpi-dsdt.aml"
  rm "${pkgdir}/usr/share/qemu/q35-acpi-dsdt.aml"
}

