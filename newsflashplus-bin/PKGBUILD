# Maintainer: Rustam Tsurik <rustam.tsurik@gmail.com>
# Submitter: dryes <joswiseman@gmail>

pkgname='newsflashplus-bin'
pkgver='3.5.0b0'
pkgrel=1
pkgdesc='Newsflash Plus is a full fledged Usenet binary reader providing unbeatable performance.'
url='http://ensisoft.com/index.php'
arch=('i686' 'x86_64')
license=('Custom')
depends=('openssl' 'glibc')
[[ "${CARCH}" == 'x86_64' ]] && depends+=('lib32-libpng12' 'lib32-glib2' 'lib32-libsm' 'lib32-libxrender' 'lib32-fontconfig' 'lib32-libxext' 'lib32-icu48') || depends+=('libpng12' 'icu48')
provides=('newsflashplus')
options=('!strip')
source=("http://ensisoft.com/software/newsflash_plus_${pkgver}.tar.gz" "newsflashplus-bin.desktop")
md5sums=('16d0f35e4fedeea9c4b50e7ca72fc98b' '399b0a7553506578c441edb0fa1ff5b6')

package() {
  mkdir -p "${pkgdir}/"{opt,usr/bin,usr/share/applications}
  cp -r "${srcdir}/dist_final" "${pkgdir}/opt/newsflashplus"
  
  echo -e "#!/bin/bash\n\ncd /opt/newsflashplus\n\nbash newsflash.sh \"\$@\"" >> "${pkgdir}/usr/bin/newsflashplus"
  chmod 755 "${pkgdir}/usr/bin/newsflashplus"

  cp ${srcdir}/newsflashplus-bin.desktop ${pkgdir}/usr/share/applications
}
