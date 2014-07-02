# Contributor: jaehyeon <jaehyeon@gmail.com>

pkgname=ttf-alee
pkgver=13
pkgrel=2
pkgdesc="A set of free Hangul TrueType fonts made by A Lee"
arch=('any')
url="http://packages.debian.org/unstable/x11/ttf-alee"
license=('custom:Artistic')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(http://ftp.debian.org/debian/pool/main/t/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('8a1a41e1436205f9abb8fcb26d171f4a')

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF

  # Install license
  install -D -m644 "${srcdir}"/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

