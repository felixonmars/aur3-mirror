# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

pkgname=policykit1-gnome
pkgver=0.94
pkgrel=1
pkgdesc="PolicyKit1 integration for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://people.freedesktop.org/~david/polkit-HEAD/"
license=('GPL')
depends=('policykit1>=0.94' 'gtk2>=2.18.0')
makedepends=('intltool')
source=(http://hal.freedesktop.org/releases/polkit-gnome-${pkgver}.tar.bz2)
md5sums=('eebab8363a7b7c0516aca4f7b7cd7f7a')

build() {
  cd "${srcdir}/polkit-gnome-${pkgver}"

  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib/PolicyKit1
  make || return 1
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
