# Contributor: tardo <tardo@nagi-fanboi.net>
# Maintainer: Ray Kohler <ataraxia937@gmail.com>
# Category: multimedia

pkgname=festival-hts-voices
pkgver=2.1
pkgrel=1
pkgdesc="Festival voices based on the HMM-Based Speech Synthesis System (HTS)"
url="http://hts.sp.nitech.ac.jp/"
depends=('festival' 'sox')
arch=('i686' 'x86_64')
license=('custom')
install=festival-hts-voices.install
source=("http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_awb_arctic_hts-${pkgver}.tar.bz2"
		"http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_bdl_arctic_hts-${pkgver}.tar.bz2"
		"http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_clb_arctic_hts-${pkgver}.tar.bz2"
		"http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_jmk_arctic_hts-${pkgver}.tar.bz2"
		"http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_rms_arctic_hts-${pkgver}.tar.bz2"
		"http://hts.sp.nitech.ac.jp/archives/${pkgver}/festvox_nitech_us_slt_arctic_hts-${pkgver}.tar.bz2")
md5sums=('b688790a3dcd3e7afbf37269857fda6f'
         '667b48685d530d2b478957c7734b915b'
         '4b329ce637475f971cba6f4436aad750'
         '7da91d0fc65e64b243a935c5cce1838b'
         '78c0422bf0b008f66111c56ee2219b62'
         '257e3fe54c2d727f7484db77df546535')

build() {
  cd $startdir/src/lib/voices/us
  mkdir -p $startdir/pkg/usr/share/festival/voices/english
  cp -R * $startdir/pkg/usr/share/festival/voices/english
  install -D -m644 $startdir/src/lib/voices/us/nitech_us_awb_arctic_hts/hts/COPYING \
				$startdir/pkg/usr/share/licenses/$pkgname/COPYING

}
