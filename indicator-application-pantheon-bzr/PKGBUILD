# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

pkgname=indicator-application-pantheon-bzr
pkgver=r2
pkgrel=2
pkgdesc="A library and indicator to take menus from applications and place them in the panel"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-application"
license=('GPL')
depends=('dbus-glib' 'libappindicator3' 'libdbusmenu-gtk3' 'libindicator3' 'json-glib')
groups=('pantheon')
source=("bzr+lp:~elementary-os/elementaryos/os-patch-indicator-application-trusty"
        '0001_autoconf.patch')
sha512sums=('SKIP'
            '7ef9f2eab8dd17d8957b706ba479c38f5f9e74a69e77af7c8e318809c67b4aea214433f0364741fc4fcbfaefd6bbff3e370e24048cd23f2e09ebe6bca32b1511')

pkgver() {
  cd os-patch-indicator-application-trusty

  printf "r%s" "$(bzr revno)"
}
prepare() {
  cd "${srcdir}/os-patch-indicator-application-trusty"

  patch -p1 -i "${srcdir}/0001_autoconf.patch"
}

build() {
  cd "${srcdir}/os-patch-indicator-application-trusty"

  autoreconf -vfi
  ./configure --prefix=/usr --libexecdir=/usr/lib/indicator-application-pantheon --disable-static
  make
}

package() {
  cd "${srcdir}/os-patch-indicator-application-trusty"

  make DESTDIR="${pkgdir}/" install

  rm -r "${pkgdir}/usr/share/upstart/"
}
