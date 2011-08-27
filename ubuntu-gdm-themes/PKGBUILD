# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: simo91 <simo91.linux@gmail.com>

pkgname=ubuntu-gdm-themes
pkgver=0.33
pkgrel=1
pkgdesc="Ubuntu GDM themes"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/ubuntu-gdm-themes"
license=('custom')
depends=('gdm')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/u/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('0b07ae7fd308a9dbc4054fe6eb0d03af')

build() {
  cd ${srcdir}/$pkgname

  install -d ${pkgdir}/usr/share/gdm/themes || return 1
  mv Human*/ ${pkgdir}/usr/share/gdm/themes || return 1

  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING || return 1
}
