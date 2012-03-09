# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=fedora-arm-installer
pkgver=1.0.0
pkgrel=1
pkgdesc="Writes binary image files to any specified block device"
arch=('any')
# Also at http://www.raspberrypi.org/archives/805
url="http://fedoraproject.org/wiki/Fedora_ARM_Installer"
license=('GPL')
depends=('pyqt')
provides=("faii=${pkgver}")
conflicts=('faii')
source=("http://files.velocix.com/c1410/fedora/installer/source/faii-${pkgver}.tar.gz"
        'org.archlinux.pkexec.fedora-arm-installer.policy'
        'fedora-arm-installer.desktop'
        'fedora-arm-installer-pkexec')
sha512sums=('58e5d65ba0af5dc94e7a578dde10141f454704425075d29d86312c51dd6fe55cf3bea3a09819257b2544c609cd5704eca239653cd3a038ac8fa7aa7ea30ff71c'
            'a3ff297693af5b3e4dcaea3d01e6bb457c9e7b75be696ec3fe96933b79f34a07269a82d278b302409ded2f321b4713f5a24f8ab92d73087df4d8c41371d0a33f'
            'f117af182ef78b83072470d9be62a0c3550f99b8fe1e27cdac7df31c221271b506b3b1fcb857b7a352e6b0cb9570d452030a9f50bb5e621ba33398819426ae9a'
            '9c17cfa163452c93e0d944819cbbc04be9a5dd668d9548cb9b36f010cd0244f16493e5e40069c3342e8581f7ca9393227fb24abaf178b19a3492c87fc0c6b324')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install desktop file (from Fedora)
  install -dm755 "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/${pkgname}.desktop" \
                "${pkgdir}/usr/share/applications/"

  # Install policykit file to run app as root (from gparted PKGBUILD)
  install -dm755 "${pkgdir}/usr/share/polkit-1/actions/"
  install -m644 "${srcdir}/org.archlinux.pkexec.${pkgname}.policy" \
                "${pkgdir}/usr/share/polkit-1/actions/"

  # Icon for policykit password window
  install -dm755 "${pkgdir}/usr/share/pixmaps/"
  ln -s '/usr/share/fedora-arm-installer/data/logo.png' \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install launcher script
  install -dm755 "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/${pkgname}-pkexec" "${pkgdir}/usr/bin/"

  # Install main program
  install -dm755 "${pkgdir}/usr/sbin/"
  install -m755 fedora-arm-installer "${pkgdir}/usr/sbin/"

  # Install data files
  install -dm755 "${pkgdir}/usr/share/${pkgname}/data/"
  install -m644 data/* "${pkgdir}/usr/share/${pkgname}/data/"
}

# vim:set ts=2 sw=2 et:
