# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=cras-daisy-spring
pkgdesc="Chromium OS audio server"
pkgver=R30.4537
pkgrel=1
arch=('any')
groups=('chromarchy')
url="http://git.chromium.org/gitweb/?p=chromiumos/third_party/adhd.git;a=summary"
license=('custom:chromiumos')
_gitname='adhd'
depends=('iniparser' 'ladspa' 'sbc' 'speex' 'alsa-utils')
makedepends=('git' 'chromiumos-overlay')
provides=('cras')

source=(cras.service
        cras.socket
        cras-state.service
        crasctl
        org.chromium.cras.conf
        LICENSE
        "$_gitname::git+http://git.chromium.org/git/chromiumos/third_party/adhd.git#branch=release-R30-4537.B")

md5sums=('af12775646abbea7210d5e0451b7bd4b'
         'f44dd92bf89da8d192d0d0a8b0fba442'
         '113dbdf7e1e931ba6288c255c7c287dc'
         'bcb5dba2a6116b7fe939be97ac492782'
         '2fa50f51db3cefae7a2f38b11e6192bf'
         '87dd8458232da630f5617873d42d8350'
         'SKIP')

build() {
  cd "$srcdir/$_gitname"

  BOARD=daisy_spring make
}

package() {
  BOARD=daisy_spring make -C "$srcdir/$_gitname" DESTDIR="${pkgdir}/" install
  rm -fr ${pkgdir}/etc/init

  install -d ${pkgdir}/usr/lib/systemd/system
  install -m 644 ${srcdir}/cras.service ${pkgdir}/usr/lib/systemd/system/cras.service
  install -m 644 ${srcdir}/cras.socket ${pkgdir}/usr/lib/systemd/system/cras.socket
  install -m 644 ${srcdir}/cras-state.service ${pkgdir}/usr/lib/systemd/system/cras-state.service

  install -d ${pkgdir}/usr/bin
  install -m 755 ${srcdir}/crasctl ${pkgdir}/usr/bin/crasctl

  install -d ${pkgdir}/etc/dbus-1/system.d
  install -m 644 ${srcdir}/org.chromium.cras.conf ${pkgdir}/etc/dbus-1/system.d/org.chromium.cras.conf

  install -d ${pkgdir}/etc
  install -m 644 /usr/share/chromiumos-overlay/chromeos-base/audioconfig/files/asound.conf ${pkgdir}/etc/asound.conf

  install -d ${pkgdir}/usr/share/alsa/ucm/DAISY-I2S
  install -m 644 ${srcdir}/$_gitname/ucm-config/daisy_spring/DAISY-I2S/* ${pkgdir}/usr/share/alsa/ucm/DAISY-I2S

  install -m 644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
