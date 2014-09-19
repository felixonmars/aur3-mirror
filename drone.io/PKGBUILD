# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=drone.io
pkgver=0.1
pkgrel=1
pkgdesc="Continuous Integration platform built on Docker"
arch=("x86_64")
url="https://github.com/drone/drone"
license=('Apache')
provides=('drone.io')
source=(
  "http://downloads.drone.io/latest/drone.deb"
  "./drone.service"
)
md5sums=('4285e75eee480b68dc63015cb14e921c'
         'e45fa6d260e5735ce6a8ae0f8531a38c')
backup=('etc/default/drone')

package() {
  cd ${srcdir}

  bsdtar -xf data.tar.gz -C "${pkgdir}/"

  msg "Moving binaries to /usr/bin..."
  mv ${pkgdir}/usr/{local,}/bin
  rm -rf ${pkgdir}/usr/local
  rm -rf ${pkgdir}/etc/init

  msg "Installing systemd service..."
  install -Dm644 drone.service ${pkgdir}/usr/lib/systemd/system/drone.service
}

# vim:set ts=2 sw=2 et:
