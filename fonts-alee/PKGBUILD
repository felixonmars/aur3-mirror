# Maintainer : seongmin cho <linukizx@gmail.com>
# Contributor: jaehyeon <jaehyeon@gmail.com>

pkgname=fonts-alee
pkgver=13.1
pkgrel=1
pkgdesc="A set of free Hangul TrueType fonts made by A Lee"
arch=('any')
url="https://packages.debian.org/sid/fonts-alee"
license=('custom:Artistic')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(http://http.debian.net/debian/pool/main/f/${pkgname}/${pkgname}_${pkgver}.tar.xz)
md5sums=('62eff42b85516dc59b5ea7c26506d80f')

package() {
  install -d -m 755 "${pkgdir}"/usr/share/fonts/TTF
  
  cd ${srcdir}/${pkgname}-${pkgver}
  install -m 0644 *.ttf "${pkgdir}"/usr/share/fonts/TTF

  # Install license
  install -D -m 0644 "${srcdir}"/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
