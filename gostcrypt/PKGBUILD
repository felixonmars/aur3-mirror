# Maintainer: flow  

pkgname=gostcrypt
pkgver=1.0
pkgrel=2
pkgdesc="Free open-source cross-platform disk encryption software (fork truecrypt)"
url="https://www.gostcrypt.org"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('fuse' 'wxgtk2.8')
optdepends=()
makedepends=('nasm')
conflicts=()
replaces=()
backup=()
#install=''
source=("https://www.gostcrypt.org/download/${pkgver}/linux/GostCrypt_Linux_${pkgver}.zip"
"ftp://ftp.archlinux.org/other/tc/pkcs-2.20.tar.gz"
"${pkgname}.desktop")

sha256sums=('f44237c54aa1bcfd22057740e5e1cdf8e17a0025a16f455ae93d3c68a6adbff7'
            'd2bf64094eec48b4695a15d91c05fe4469485a5cc6b0efc0ee75a20c095bd40d'
            '1f686d38b8478c25a84d786dea178deb5fcc16afe1f0dca13e5994fc21d6382d')

build() {
  cd "${srcdir}/GostCrypt_Linux_${pkgver}"

  # Build
  export WX_CONFIG=/usr/bin/wx-config-2.8
  make PKCS11_INC="${srcdir}/pkcs-2.20" LFLAGS+="-ldl"

}
package() {
  cd "${srcdir}/GostCrypt_Linux_${pkgver}"

  # Install Binary
  install -D -m755 Main/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  # Install Desktop file and Icon
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 Resources/Icons/GostCrypt-48x48.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"

  # Install License
  install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
    
}
