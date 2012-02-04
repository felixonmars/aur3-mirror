# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=uremotedesktop
pkgver=1.9.4
pkgrel=1
pkgdesc="URemoteDesktop Linux Server - Android remote control"
arch=('any')
url="http://uremotedesktop.guatedroid.com/index.php?title=URemoteDesktop_Server"
license=('unknown')
depends=('java-runtime' 'xautomation')
makedepends=('unzip')
source=("http://uremotedesktop.guatedroid.com/images/1/1f/URemoteDesktop_Server.zip" "uremotedesktop.sh")
noextract=('URemoteDesktop_Server.zip');
md5sums=('e8395847f13c553941fb48f0ab91e387' '28687fb3cab4ae222fd09a8aa1abb2de') 

build() {
  unzip -fo URemoteDesktop_Server.zip
  mkdir -p "${pkgdir}/opt/uremotedesktop"
  install -m644 UremoteDesktop_Server/*.class UremoteDesktop_Server/keys.config "${pkgdir}/opt/uremotedesktop/"
  install -m755 UremoteDesktop_Server/vd.sh "${pkgdir}/opt/uremotedesktop/"

  install -D -m755 "${srcdir}/uremotedesktop.sh" "${pkgdir}/usr/bin/uremotedesktop"
}

# vim:set ts=2 sw=2 et:
