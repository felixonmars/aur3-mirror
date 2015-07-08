# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
pkgname=shellter
pkgver=4.0
pkgrel=1
pkgdesc="Dynamic PE shellcode injection tool"
arch=('i686' 'x86_64')
url="https://www.shellterproject.com"
license=('custom:license.txt')
depends=('wine')
provides=('shellter')
source=("https://www.shellterproject.com/Downloads/Shellter/Latest/${pkgname}.zip")
sha256sums=('SKIP')
DLAGENTS=("https::/usr/bin/curl -A Archlinux -k -o %o %u")

build() {
  cd "${srcdir}/${pkgname}"
  msg "Building ${pkgname}"
}

package() {

  cd "${srcdir}/${pkgname}"

  msg "Creating directory hierarchy"
  install -d -m 755 "${pkgdir}/usr/bin"
  install -d -m 755 "${pkgdir}/usr/share/${pkgname}"
  install -d -m 755 "${pkgdir}/usr/share/${pkgname}/icon"
  install -d -m 755 "${pkgdir}/usr/share/${pkgname}/shellcode_samples"

  # ohmygod forgive me xD
  msg "Installing ${pkgname} launch script to ${pkgdir}/usr/bin/${pkgname}"
  cat >> "${pkgdir}/usr/bin/${pkgname}" << "EOF"
#!/bin/sh
/usr/bin/wine /usr/share/shellter/shellter.exe ${@}
exit $?
EOF
  chmod +x "${pkgdir}/usr/bin/${pkgname}"

  msg "Installing files to ${pkgdir}/usr/share/${pkgname}"
  install -c -m 644 shellter.exe "${pkgdir}/usr/share/${pkgname}"
  install -c -m 644 faq.txt "${pkgdir}/usr/share/${pkgname}"
  install -c -m 644 version_history.txt "${pkgdir}/usr/share/${pkgname}"
  install -c -m 644 license.txt "${pkgdir}/usr/share/${pkgname}"

  msg "Installing readme to ${pkgdir}/usr/share/${pkgname}"
  install -c -m 644 readme.txt "${pkgdir}/usr/share/${pkgname}"

  msg "Installing ${pkgname} license file"
  install -D -m 644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  msg "Installing icon to ${pkgdir}/usr/share/${pkgname}/icon"
  install -c -m 644 icon/shellter.ico "${pkgdir}/usr/share/${pkgname}/icon"

  msg "Installing samples to ${pkgdir}/usr/share/${pkgname}/shellcode_samples"
  install -c -m 644 shellcode_samples/calcenc "${pkgdir}/usr/share/${pkgname}/shellcode_samples"
  install -c -m 644 shellcode_samples/info.txt "${pkgdir}/usr/share/${pkgname}/shellcode_samples"
  install -c -m 644 shellcode_samples/calc "${pkgdir}/usr/share/${pkgname}/shellcode_samples"
  install -c -m 644 shellcode_samples/krb3 "${pkgdir}/usr/share/${pkgname}/shellcode_samples"
  install -c -m 644 shellcode_samples/krb1 "${pkgdir}/usr/share/${pkgname}/shellcode_samples"

}
# vim:set ts=2 sw=2 et:
