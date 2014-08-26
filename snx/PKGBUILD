# Maintainer: Viliam Pucik <viliam.pucik[at]gmail[dot]com>
pkgname=snx
pkgver=800005058
pkgrel=4
pkgdesc="Check Point SSL Network Extender"
url="https://www.checkpoint.com/"
arch=('x86_64' 'i686')
license=('unknown')
depends=('libstdc++5' 'libx11' 'pam')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libstdc++5' 'lib32-libx11' 'lib32-pam')
source=('snx_install.sh')
md5sums=('d213bdd25cdd2bf20f1213709e23342b')

package() {
  install -d -m0700 "${pkgdir}/etc/snx"
  install -d -m0700 "${pkgdir}/etc/snx/tmp"
  mkdir -p "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  tail -n +78 "${srcdir}/snx_install.sh" | bunzip2 -c - | tar -x snx -f -
  chown root:root "${pkgdir}/usr/bin/snx"
  chmod 4511 "${pkgdir}/usr/bin/snx"
}

# vim:set ts=2 sw=2 et:
