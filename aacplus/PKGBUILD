# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=aacplus
pkgver=7.2.0
_ver=720
pkgrel=3
pkgdesc="Enhanced aacPlus general audio codec, floating-point ANSI-C code"
arch=('i686')
url="http://www.3gpp.org/"
license=('custom')
depends=('gcc-libs')
source=(http://www.3gpp.org/ftp/Specs/archive/26_series/26.410/26410-720.zip \
	LICENSE)
md5sums=('03baade4a7fbe596a960601d3c76e2f4'
         'c8a65191e61e8a6b345ac48f734820a2')

build() {
  cd $srcdir/
  bsdtar -xf 26410-$_ver-ANSI-C_source_code.zip

  # build encoder
  cd $srcdir/3GPP_enhanced_aacPlus_src_*/FloatFR_aacPlusenc/
  make

  # build decoder
  cd $srcdir/3GPP_enhanced_aacPlus_src_*/FloatFR_aacPlusdec/
  make
}

package() {
  install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cd $srcdir/3GPP_enhanced_aacPlus_src_*
  install -D -m755 FloatFR_aacPlusenc/enhAacPlusEnc $pkgdir/usr/bin/${pkgname}Enc
  install -D -m755 FloatFR_aacPlusenc/enhAacPlusEnc_brswitch $pkgdir/usr/bin/${pkgname}Enc_brswitch
  install -D -m755 FloatFR_aacPlusdec/enhAacPlusDec $pkgdir/usr/bin/${pkgname}Dec
}
