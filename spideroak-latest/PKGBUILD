# Maintainer: Dan Serban
# Contributor: ddffnn <ddffnn@gmail.com>
# Contributor: sfabius <sfabius@gmail.com>
# Contributor: nblock <nblock [/at\] archlinux DOT us>

pkgname=spideroak-latest
pkgver=4.x.xxxx.beta # 4.x.xxxx (beta) series
pkgrel=1
pkgdesc="Secure, cross-platform, consolidated, free online backup, storage, access, sharing and sync tool (beta channel)"
url=https://spideroak.com/
arch=(i686 x86_64)
depends=(openssl)
optdepends=(dbus qt)
conflicts=(spideroak)
license=(custom:freeware)
options=(!strip)
_filearch=i386
_last_known_md5sum="f212ff2b9b8a9f2e4bf71cd5de2560ea"
[ "${CARCH}" == "x86_64" ] && _filearch=x86_64 && _last_known_md5sum="1bb0dbfa1305041e49660bc6151bf3c5"

build()
{
  _file="${pkgname}_beta.deb"
  wget -O "${_file}" "https://spideroak.com/directdownload?platform=ubuntumaverick&arch=${_filearch}&beta=yes"
  _actual_md5sum=$(md5sum "${_file}" | cut -d" " -f1)
  [ "${_actual_md5sum}" != "${_last_known_md5sum}" ] && echo && echo && echo "Please raise the out-of-date flag for this package: http://aur.archlinux.org/packages.php?ID=47096" && echo && echo
  msg "Extracting ..."
  bsdtar -xf "${_file}" data.tar.gz
  bsdtar -xf data.tar.gz
  msg2 "... completed."
  rm data.tar.gz
  cd "${srcdir}"/etc
  rm -r apt
  mkdir -p "${srcdir}"/usr/share/spideroak
  cd "${srcdir}"/usr/lib
  mv SpiderOak lib
  mv lib "${srcdir}"/usr/share/spideroak/
  cd "${srcdir}"/usr
  rm -r bin lib
  cd "${srcdir}"
  mv etc usr "${pkgdir}"/
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/spideroak
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo 'export LD_LIBRARY_PATH="/usr/share/spideroak/lib:${LD_LIBRARY_PATH}"' >> "${USRBINFILE}"
  echo '/usr/share/spideroak/lib/SpiderOak "$@"' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
  DESKTOPFILE="${pkgdir}"/usr/share/applications/spideroak.desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=SpiderOak (Beta)" >> "${DESKTOPFILE}"
  echo "Comment=SpiderOak Secure Backup and File Sharing Client (Beta)" >> "${DESKTOPFILE}"
  echo "Exec=spideroak" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Icon=/usr/share/pixmaps/spideroak.png" >> "${DESKTOPFILE}"
  echo "Categories=Network;" >> "${DESKTOPFILE}"
}
