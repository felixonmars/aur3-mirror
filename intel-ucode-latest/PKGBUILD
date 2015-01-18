# $Id: PKGBUILD 225201 2014-10-22 21:35:17Z thomas $
# Maintainer: nemesys <nemstar (at) zoho (dot) com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=intel-ucode-latest
pkgver=20150107
pkgrel=1
pkgdesc="Microcode update files for Intel CPUs (latest)"
arch=('any')
install=$pkgname.install
url="http://downloadcenter.intel.com/SearchResult.aspx?lang=eng&keyword=%22microcode%22"
replaces=('microcode_ctl')
conflicts=('intel-ucode')
license=('custom')
# Some random "download id" that intel has in their downloadcenter
_dlid=24616
source=(http://downloadmirror.intel.com/${_dlid}/eng/microcode-${pkgver}.tgz
        LICENSE
        intel-microcode2ucode.c)
sha256sums=('f5e7fb58643b2bf327eedf7bd91780fd5dfe74397552977cc77194c165910255'
            '6983e83ec10c6467fb9101ea496e0443f0574c805907155118e2c9f0bbea97b6'
            '03a13a966316a4d3d9c7e1b46007fd4b80911aea5ddd957ddf33ce660efe03de')

build() {
  cd "$srcdir"
  gcc -Wall ${CFLAGS} -o intel-microcode2ucode intel-microcode2ucode.c
  ./intel-microcode2ucode ./microcode.dat
}

package() {
  cd "$srcdir"

  install -d -m755 "${pkgdir}"/boot

  mkdir -p kernel/x86/microcode
  mv microcode.bin kernel/x86/microcode/GenuineIntel.bin
  echo kernel/x86/microcode/GenuineIntel.bin | bsdcpio -o -H newc -R 0:0 > "${pkgdir}"/boot/intel-ucode.img
  
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
