# Maintainer: ushi <martin.kalcher@gmail.com>
pkgname=update-mirrorlist
pkgver=1.0.9
pkgrel=2
pkgdesc="Update tool for pacmans mirrorlist"
arch=(any)
url="https://github.com/ushis/update-mirrorlist"
license=('GPL')
depends=('coreutils' 'curl' 'pacman' 'iputils' 'grep')
backup=('etc/pacman.d/update-mirrorlist.conf')
install=update-mirrorlist.install

source=(
  'update-mirrorlist'
  'update-mirrorlist.conf'
)

sha256sums=(
  'af1ec558e833d2fe37e59235fc2c8210d925caa080be74c889c6506f0e2c1dba'
  '9b9426cf660ce10d5f75f6b02e0f3997e01bf19fbb56b06fb808abc551706395'
)

package() {
  cd "$srcdir"
  install -D -m755 'update-mirrorlist'      "${pkgdir}/usr/bin/update-mirrorlist"
  install -D -m644 'update-mirrorlist.conf' "${pkgdir}/etc/pacman.d/update-mirrorlist.conf"
}

# vim:set ts=2 sw=2 et:
