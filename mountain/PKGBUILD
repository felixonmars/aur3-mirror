# Maintainer: Javier Aravena Claramunt <javier@aravenas.com>
pkgname="mountain"
pkgver=1.20
epoch=1
_realname=Mountain
_realver=v1_2_Linux
pkgrel=1
pkgdesc="Mountain simulator"
arch=('x86_64' 'i686')
url="http://mountain-game.com/"
license=('custom')
if [[ "$CARCH" == 'x86_64' ]]; then
    depends=(lib32-libgl lib32-glu lib32-libxext lib32-libxcursor lib32-alsa-lib)
elif [[ "$CARCH" == 'i686' ]]; then
    depends=(libgl glu libxext libxcursor alsa-lib)
fi
source=("file://${_realname}" "hib://${_realname}_${_realver}.zip")

md5sums=('8cff8497024bd6b12c35e9918752dd14'
         'da5a239d7ca1f90d7cfe5e072b7f415e')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

package() {
    cd "$srcdir/"
    install_dir="${pkgdir}/opt/${_realname}"
    install -m755 -d $"{install_dir}"
    install -D -m755 ${_realname} ${pkgdir}/usr/bin/${_realname}
    install -m755 -D "${_realname}.x86" "${install_dir}/${_realname}.x86"
    cp -r "${_realname}_Data" "${install_dir}"
}
