# Maintainer: Chris Darnell <cedeel+arch@gmail.com>
# Contributor: Corrado Primier <ilbardo gmail com>
# Contributor: Other contributors existed but lost information
# Contributor: dpevp <daniel.plaza.espi@gmail.com>
# Contributor: jordi Cerdan (jcerdan) <jcerdan@tecob.com>

pkgname=pommed
pkgver=1.39
pkgrel=4
pkgdesc="Handles the hotkeys of Apple MacBook (Pro) laptops"
arch=('i686' 'x86_64')
url="http://pommed.alioth.debian.org/"
license=('GPL2')
install=$pkgname.install
makedepends=('pkgconfig')
depends=('alsa-lib' 'audiofile' 'confuse' 'dbus-core' 'pciutils')
optdepends=('eject: disc ejection support')
#backup=('etc/pommed.conf')
source=("https://alioth.debian.org/frs/download.php/file/3583/${pkgname}-${pkgver}.tar.gz"
        "pommed.service"
        "http://alioth.debian.org/tracker/download.php/31066/412713/313891/5185/0001-Add-support-for-LCD-back-light-on-latest-kernels.patch")
md5sums=('f36757d180ed4f35fced6c096e1bcbeb'
         'db988bb0b29bf45250a4daa32db7e5f2'
         '557af3517f8fa754a3a5ef6a0a729fc1'
        )
build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/0001-Add-support-for-LCD-back-light-on-latest-kernels.patch"
  make pommed
}

package() {
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/pommed/pommed ${pkgdir}/usr/sbin/pommed
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/pommed.conf.mactel ${pkgdir}/etc/pommed.conf.mactel
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/pommed.conf.pmac ${pkgdir}/etc/pommed.conf.pmac
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/dbus-policy.conf ${pkgdir}/etc/dbus-1/system.d/pommed.conf

  # Man page
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/pommed.1 ${pkgdir}/usr/share/man/man1/pommed.1

  # Sounds
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/pommed/data/goutte.wav ${pkgdir}/usr/share/pommed/goutte.wav
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/pommed/data/click.wav ${pkgdir}/usr/share/pommed/click.wav

  # Systemd
  install -Dm644 "${srcdir}/pommed.service" "${pkgdir}/usr/lib/systemd/system/pommed.service"
}

# vim:set ts=2 sw=2 et:
