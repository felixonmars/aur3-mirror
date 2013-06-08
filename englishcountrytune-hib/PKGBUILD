# Maintainer: Mikhail Bulash <scaryspiderpig@gmail.com>

pkgname=englishcountrytune-hib
pkgver=0_20130608
_hibver=1370040672
pkgrel=1
pkgdesc='English Country Tune, a 3D geometric puzzler (Humble Bundle version)'
url='http://www.englishcountrytune.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('glu' 'libxcursor' 'mesa')
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_installer="EnglishCountryTune_Linux_${_hibver}.tar.gz"
source=("hib://${_installer}"
        'https://humblepull-wolfire.netdna-ssl.com/misc/files/bc6348892a/images/icons/englishcountrytune.png'
        'englishcountrytune-hib.desktop')
md5sums=('1097749402732c31348fd430b94e9350'
         '45dc80457274efb78db13711975aa04b'
         'b578b5f380f900cd7c6c58ca4dc4fa77')

package() {
  cd $srcdir
  _target="/opt/EnglishCountryTune"

  # Install game files
  mkdir -p "${pkgdir}${_target}"
  cp -rT "English Country Tune" "${pkgdir}${_target}"

  # Select arch

  cd "${pkgdir}${_target}"
  if [ "$CARCH" = "x86_64" ]; then
    _binary="English Country Tune.x86_64"
    rm "English Country Tune.x86"
    rm -r "English Country Tune_Data/Mono/x86"
  else
    _binary="English Country Tune.x86"
    rm "English Country Tune.x86_64"
    rm -r "English Country Tune_Data/Mono/x86_64"
  fi

  cd ${srcdir}

  # Install desktop entry
  install -Dm644 "${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "englishcountrytune.png" \
                "${pkgdir}/usr/share/pixmaps/englishcountrytune.png"

  # Install launcher script
  echo -e "#!/bin/sh\ncd ${_target} && \"./$_binary\"" \
        > "launcher.sh"
  install -Dm755 "launcher.sh" "${pkgdir}/usr/bin/englishcountrytune"
}
