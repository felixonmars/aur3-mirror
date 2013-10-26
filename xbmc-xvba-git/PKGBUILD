# Maintainer: Hampsterblade <hampsterblade [AT] gmail DOT com>
# Contributor: B <gotleenucks at gmail dot com>
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Ulf Winkelvos <ulf [at] winkelvos [dot] de>
# Contributor: Ralf Barth <archlinux dot org at haggy dot org>
#
# Original credits go to Edgar Hucek <gimli at dark-green dot com>
# for his xbmc-vdpau-vdr PKGBUILD at https://archvdr.svn.sourceforge.net/svnroot/archvdr/trunk/archvdr/xbmc-vdpau-vdr/PKGBUILD.
# This PKGBUILD is an adaptation of the xbmc-git PKGBUILD in the AUR; credits go to the people who contributed to that.

pkgname=xbmc-xvba-git
pkgver=20130304
pkgrel=1
pkgdesc="XBMC Media Center - unofficial development version with XvBA support"
provides=('xbmc')
conflicts=('xbmc' 'xbmc-pulse' 'xbmc-svn' 'xbmc-git')
replaces=('xbmc-svn')
arch=('i686' 'x86_64')
url="https://github.com/FernetMenta/xbmc/"
license=('GPL' 'LGPL')
depends=('afpfs-ng' 'bluez' 'faac' 'faad2' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'libass' 'libcdio' 'libmad' 'libmicrohttpd' 'libplist' 'libmodplug' 'libnfs' 'libmpeg2' 'libssh' 'libmysqlclient' 'libsamplerate' 'libxrandr' 'libshairport' 'lsb-release' 'lzo2' 'mesa' 'mesa-demos' 'smbclient' 'sdl_image>=1.2.10' 'sdl_mixer' 'swig' 'taglib' 'tinyxml' 'unzip' 'xorg-xdpyinfo' 'yajl' 'xvba-sdk')
makedepends=('boost' 'cmake' 'git' 'gperf' 'nasm' 'zip')
optdepends=('avahi: to use zerconf features (remote, etc...)'
            'gdb: for meaningful backtraces in case of trouble - STRONGLY RECOMMENDED'
            'lirc: remote controller support'
            'pulseaudio: pulseaudio support'
            'udisks: automount external drives'
            'upower: used to trigger suspend functionality'
            'python-simplejson: weather service functionality'
            'unrar: access compressed files without unpacking them')
options=('makeflags')
install="${pkgname}.install"

_gitroot="git://github.com/FernetMenta/xbmc.git"
_prefix=/usr

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d "${pkgname%-git-xvba}" ]; then
    cd "${pkgname%-git-xvba}"
    if [ ! -d .git/refs/remotes/origin ] ; then
      git remote add xbmc $_gitroot
    fi
    git checkout master
    git fetch xbmc master
    git reset --hard xmbc/master
  else
    git clone "${_gitroot}" "${pkgname%-git-xvba}"
    cd "${pkgname%-git-xvba}"
  fi
  git checkout master

  # Configure XBMC
  cd "${srcdir}/${pkgname%-git-xvba}"

  # fix lsb_release dependency
  sed -i -e 's:/usr/bin/lsb_release -d:cat /etc/arch-release:' xbmc/utils/SystemInfo.cpp

  # remove "--as-needed" from LDFLAGS
  unset LDFLAGS; LDFLAGS="-Wl,--hash-style=gnu"

  # fix configure: error: Submodule lib/libdvd/libdvdcss failed to configure
  (cd lib/libdvd/libdvdcss; sed -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' -i configure.ac)

  msg "Bootstrapping XBMC"
  ./bootstrap

  msg "Configuring XBMC" 
  export PYTHON_VERSION=2  # external python v2
  ./configure --prefix="${_prefix}" \
    --enable-optimizations \
    --enable-external-libraries \
    --disable-external-ffmpeg \
    --enable-xvba \
    --disable-debug \
    --disable-pulse

  # Now build
  msg "Running make"
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${pkgname%-git-xvba}"

  msg "Running make install"
  make prefix="${pkgdir}${_prefix}" install

  # Make sure we use python2
  sed -i -e 's/python/python2/g' ${pkgdir}/${_prefix}/bin/xbmc

  # lsb_release fix
  sed -i -e 's/which lsb_release &> \/dev\/null/\[ -f \/etc\/arch-release ]/g' "${pkgdir}${_prefix}/bin/xbmc"
  sed -i -e "s/lsb_release -a 2> \/dev\/null | sed -e 's\/\^\/    \/'/cat \/etc\/arch-release/g" "${pkgdir}${_prefix}/bin/xbmc"

  # .desktop files
  install -Dm644 "${srcdir}/${pkgname%-git-xvba}/tools/Linux/xbmc.desktop" "${pkgdir}${_prefix}/share/applications/xbmc.desktop"
  install -Dm644 "${srcdir}/${pkgname%-git-xvba}/tools/Linux/xbmc-48x48.png" "${pkgdir}${_prefix}/share/pixmaps/xbmc.png"

  # Tools
  install -Dm755 "${srcdir}/${pkgname%-git-xvba}/xbmc-xrandr" "${pkgdir}${_prefix}/share/xbmc/xbmc-xrandr"
  install -Dm755 "${srcdir}/${pkgname%-git-xvba}/tools/TexturePacker/TexturePacker" "${pkgdir}${_prefix}/share/xbmc/"

  # Licenses
  install -d -m755 "${pkgdir}${_prefix}/share/licenses/${pkgname}"
  for licensef in LICENSE.GPL copying.txt; do
    mv "${pkgdir}${_prefix}/share/doc/xbmc/${licensef}" "${pkgdir}${_prefix}/share/licenses/${pkgname}"
  done

  # cleanup some stuff
  msg "Cleanup unneeded files"
  rm -rf "${pkgdir}/usr/share/xsessions"
  rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"

  # strip
  msg "Stripping binaries"
  find "${pkgdir}" -type f -exec strip {} \; >/dev/null 2>&1
}
