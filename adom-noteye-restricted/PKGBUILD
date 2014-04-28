# Maintainer: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">

# This is a PKGBUILD for ADOM prereleases restricted only to Indiegogo campaign donors.
# Please fill in the username and password you received by email for the download link to work.

_username=
_password=

DLAGENTS=("http::/usr/bin/wget --user ${_username} --password ${_password} %u")

pkgname=adom-noteye-restricted
pkgver=1.2.0_pre22
pkgrel=1
pkgdesc="A roguelike game with a quest-centric, plot driven structure"
arch=('i686' 'x86_64')
conflicts=('adom' 'adom-restricted' 'adom-noteye')
provides=('adom')
depends=('ncurses' 'mesa' 'sdl_image' 'sdl_net' 'sdl_mixer' 'lua51' 'libtinfo')
url="http://www.adom.de/"
license=('custom: "adom"')
sha1sums=('' '51d28fe3f0420cd354113fd7ceb2a1a7abf1b069')
if [ "$CARCH" = x86_64 ]
 then
  _arch_link=64
  sha1sums[0]='d8ab7fe689e654c9ea2f3d0308bd68dee20bf1e6'
 else
  _arch_link=32
  sha1sums[0]='e291cf4d6ab83e157301304ff8ffd1c7ce57797b'
fi

source=(http://www.ancardia.com/secure/download/current/adom_noteye_linux_ubuntu_${_arch_link}_${pkgver}.tar.gz LICENSE)

package() {
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom/LICENSE
  # Copy entire contents of the archive to /opt
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/adom" "${pkgdir}/opt/"
  # Remove some bundled libs for which we have perfectly good versions available
  cd "${pkgdir}/opt/adom/lib"
  rm -f "${pkgdir}/opt/adom/lib/libFLAC.so.8"
  rm -f "${pkgdir}/opt/adom/lib/libjpeg.so.8"
  rm -f "${pkgdir}/opt/adom/lib/liblua5.1.so.0"
  ln -s ../../../usr/lib/liblua5.1.so liblua5.1.so.0
  rm -f "${pkgdir}/opt/adom/lib/libmikmod.so.2"
  # libnoteye.so we keep at this point
  rm -f "${pkgdir}/opt/adom/lib/libogg.so.0"
  rm -f "${pkgdir}/opt/adom/lib/libSDL-1.2.so.0"
  rm -f "${pkgdir}/opt/adom/lib/libSDL_image-1.2.so.0"
  rm -f "${pkgdir}/opt/adom/lib/libSDL_mixer-1.2.so.0"
  rm -f "${pkgdir}/opt/adom/lib/libSDL_net-1.2.so.0"
  rm -f "${pkgdir}/opt/adom/lib/libtiff.so.4"
  rm -f "${pkgdir}/opt/adom/lib/libvorbisfile.so.3"
  rm -f "${pkgdir}/opt/adom/lib/libvorbis.so.0"
  # Since the adom binary uses a relative RPATH, it's either
  # this or patching the binary
  install -d "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/adom"
#!/bin/sh
cd /opt/adom && ./adom
EOF
  chmod 755 "${pkgdir}/usr/bin/adom"
}
