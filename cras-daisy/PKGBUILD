# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=cras-daisy
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

md5sums=('3f0d0ba389795cb4bafea8d584652bd5'
         'f44dd92bf89da8d192d0d0a8b0fba442'
         '113dbdf7e1e931ba6288c255c7c287dc'
         'e5487745f964f37d487c095bcff56d0f'
         '2fa50f51db3cefae7a2f38b11e6192bf'
         '87dd8458232da630f5617873d42d8350'
         'SKIP')

build() {
  cd "$srcdir/$_gitname"

  BOARD=daisy make
}

package() {
  BOARD=daisy make -C "$srcdir/$_gitname" DESTDIR="${pkgdir}/" install
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

  install -m 644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
