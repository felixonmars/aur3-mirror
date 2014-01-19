# Maintainer: Niluge_KiWi <kiwiiii@gmail.com>

pkgname=runner2
pkgver=1.0
_hibver=1388171186
pkgrel=1
pkgdesc="BIT.TRIP Presents... Runner2: Future Legend of Rhythm Alien"
url="http://www.runner2.com/"
arch=('i686' 'x86_64')
license=('custom')
depends=('sdl' 'libgl' 'zlib')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://BITTrip2_linux_${_hibver}.zip")
md5sums=('cd3308ef1a38df43702fa97029a6ecb1')


package()
{
  # untar correct embedded archive
  mkdir -p "${pkgdir}/opt/tmp/"
  cd "${pkgdir}/opt/tmp/"
  
  [ "$CARCH" = "x86_64" ] && _arch=amd64 || _arch=i386
  tar xzf "${srcdir}/Linux/${pkgname}_$_arch.tar.gz"
  
  # install
  cd "${pkgname}-1.0/"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  mv "${pkgname}"/* "${pkgdir}/opt/${pkgname}/"
  
  # Install launcher script
  echo -e "#!/bin/sh\ncd /opt/${pkgname} && ./${pkgname}" \
        > "launcher.sh"
  install -Dm755 "launcher.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install desktop entry
  # patch the included desktop entry paths
  sed -i 's|/usr/local/bin|/usr/bin|' "${pkgname}.desktop"
  sed -i 's|/usr/local/share/gaijin_games|/opt|' "${pkgname}.desktop"
  install -Dm644 "${PWD}/${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mv "README"* "${pkgdir}/usr/share/doc/${pkgname}"

  # cleanup
  rm -rf "${pkgdir}/opt/tmp/"
}
