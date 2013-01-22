# Maintainer: Alucryd <alucryd at gmail dot com>

pkgname=virtualbox-hook
pkgver=2.2
pkgrel=1
pkgdesc="mkinitcpio hook to compile the virtualbox modules"
url="https://www.virtualbox.org/"
arch=('any')
license=('GPL3')
depends=('virtualbox-host-dkms')
conflicts=('mkinitcpio-vbox')
install=${pkgname}.install
source=("https://raw.github.com/Alucryd/mkinitcpio-hooks/master/vbox")
sha256sums=('bc5045f505b631555dbfffade04704b014559acb8de13df502789b8983f06ce9')

package() {
  cd "${srcdir}"
  sed -i "s|arch|$CARCH|g" vbox
  install -dm 755 "${pkgdir}/usr/lib/initcpio/install"
  install -m 644 vbox "${pkgdir}/usr/lib/initcpio/install/vbox"
}

# vim: ts=2 sw=2 et:
