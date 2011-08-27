# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=damn-small-nexuiz
pkgver=0.42
pkgrel=1
pkgdesc="A somewhat playable Nexuiz version for netbooks - precompiled binary version."
arch=(i686 x86_64)
url="http://dsn.sourceforge.net"
license=('GPL')
depends=('libxxf86dga' 'alsa-lib' 'perl' 'libxpm' 'sdl' 'libxxf86vm' 'libjpeg6')
#install=
source=(http://downloads.sourceforge.net/project/dsn/dsn/${pkgver}/dsn_${pkgver/\./}_linux.zip)
md5sums=('e11d96db11936bafd248ac87b8177e97')
sha256sums=('21275e64c8fab8f67a8fd41fd2f95f5bb4c2aa4f72d5fd98408f24f142b76e9d')

build() {
  local _INSTALL_DIR=${pkgdir}/opt/damn-small-nexuiz
  install -d -m 0755 ${_INSTALL_DIR}
  cp -rPf data ${_INSTALL_DIR}
  cp -rPf havoc ${_INSTALL_DIR}
  cp -rPf server ${_INSTALL_DIR}
  find ${_INSTALL_DIR} -type f -exec chmod 644 {} \;
  find ${_INSTALL_DIR} -name "*\.sh" -type f -exec chmod 755 {} \;
  find ${_INSTALL_DIR} -name "*\.pl" -type f -exec chmod 755 {} \;
  install -m 0644 README ${_INSTALL_DIR}
  install -m 0755 nexuiz-linux-* ${_INSTALL_DIR}

  install -d -m 0755 ${pkgdir}/usr/bin
  ln -s /opt/damn-small-nexuiz/nexuiz-linux-glx.sh ${pkgdir}/usr/bin/ds-nexuiz-glx
  ln -s /opt/damn-small-nexuiz/nexuiz-linux-sdl.sh ${pkgdir}/usr/bin/ds-nexuiz-sdl
}

# vim:set ts=2 sw=2 et:
