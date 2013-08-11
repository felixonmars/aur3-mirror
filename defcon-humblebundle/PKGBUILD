# Contributor: Naelstrof <naelstrof at gmail dot com>
# Maintainer: James Denholm <nod.helm@gmail.com>

pkgname=defcon-humblebundle
pkgver=1.6
pkgrel=2
pkgdesc="Introversion Software's thermonuclear war simulator, Humble-style."
arch=('i686' 'x86_64')
url="http://www.humblebundle.com/"
license=('custom')
groups=('humblebundle')
conflicts=('defcon')
depends=(libgl mesa libvorbis sdl)
_realname="defcon"
if [ "${CARCH}" = "x86_64" ]; then
  _gamepkg="${_realname}_${pkgver}-1_amd64.tar.gz"
  _pkgget="hib://${_gamepkg}"
  _gamepkg_md5sum="aacecb7e05cc9a2cf31fce8f87fb5cb6"
else
  _gamepkg="${_realname}_${pkgver}-1_i386.tar.gz"
  _pkgget="hib://${_gamepkg}"
  _gamepkg_md5sum="231461515874c1d394e3bec0324ab32d"
fi
source=("${_realname}.desktop" "${_pkgget}")
md5sums=('4d2d32e8fd9c7b9746e58afb2b0f1a85' ${_gamepkg_md5sum})
# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar'

package() {
  cd "${srcdir}/${_realname}"

  #install all game files to /opt
  install -d ${pkgdir}/opt
  tar xvf ${srcdir}/${_gamepkg} -C ${pkgdir}/opt

  #remove arch specific name from binary
  if [ -d ${pkgdir}/opt/Defcon ]; then
    mv ${pkgdir}/opt/Defcon ${pkgdir}/opt/${_realname}
  fi
  if [ ! -f ${pkgdir}/opt/${_realname}/defcon.bin ]; then
      mv ${pkgdir}/opt/${_realname}/defcon.bin*\
	      ${pkgdir}/opt/${_realname}/defcon.bin
  fi

  #install /usr/bin symlink
  install -d ${pkgdir}/usr/bin/
  ln -s ${pkgdir}/opt/${_realname}/defcon.bin ${pkgdir}/usr/bin/${_realname}

  #install game icon
  install -d ${pkgdir}/usr/share/pixmaps/
  install -D -m644 ${pkgdir}/opt/${_realname}/defcon.png\
	  ${pkgdir}/usr/share/pixmaps/

  #install application shortcut
  install -d ${pkgdir}/usr/share/applications
  cp ${srcdir}/defcon.desktop ${pkgdir}/usr/share/applications/

  #install license
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m644 ${pkgdir}/opt/${_realname}/license.txt\
	  ${pkgdir}/usr/share/licenses/${pkgname}/

  #remove unneeded files
  if [ "${CARCH}" = "x86_64" ]; then
    rm -rf ${pkgdir}/opt/${_realname}/lib64
  else
    rm -rf ${pkgdir}/opt/${_realname}/lib32
  fi
}
