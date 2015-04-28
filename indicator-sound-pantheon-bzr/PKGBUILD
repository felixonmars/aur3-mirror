# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Balló György <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

pkgname=indicator-sound-pantheon-bzr
pkgver=r3
pkgrel=1
pkgdesc="A unified sound menu"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-sound"
license=('GPL')
depends=('accountsservice' 'dconf' 'libgee06' 'libnotify' 'libpulse' 'libxml2')
makedepends=('cmake' 'gobject-introspection' 'intltool' 'vala')
provides=(indicator-sound{,-pantheon}{,-bzr}=${pkgver})
conflicts=(indicator-sound{,-pantheon})
groups=('pantheon')
install=${pkgname}.install
source=("bzr+lp:~elementary-os/elementaryos/os-patch-indicator-sound-trusty"
        'com.ubuntu.sound.gschema.xml'
        '0001_Not_a_phone.patch'
        '0002_Remove_tests.patch')
sha512sums=('SKIP'
            '04e662c9724f983c0b9129e13394937541949d481de3722e72046a68a49772707a145854a09bc7830e10ddd9bcf3b3095c9101fbc0c29fd03cfd267a074aee3c'
            '57649313d8bd5e053d95e52882039a39ac505ac26a90c9144fc18705fb618548c3c83aafb2a2fc89f6ed7539720811ffa0e9055566ad612f473b6a427e58ac4f'
            'ea699074d47e08828ee8d7cab3b833c68cdb8c9dcc97b501acb6ffd8d678c9d127742acec1af79cd271afc7b9dc0ac28a84c300eaca047c1344bbd2be52b0113')

pkgver() {
  cd os-patch-indicator-sound-trusty

  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${srcdir}/os-patch-indicator-sound-trusty"

  patch -p1 -i "${srcdir}/0001_Not_a_phone.patch"
  patch -p1 -i "${srcdir}/0002_Remove_tests.patch"

  sed -i 's/unity-control-center/gnome-control-center/g' src/service.vala
}

build() {
  cd "${srcdir}/os-patch-indicator-sound-trusty"

  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib
  make
}

package() {
  cd "${srcdir}/os-patch-indicator-sound-trusty/build/"

  make DESTDIR="${pkgdir}/" install

  install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas/"
  install -m644 "${srcdir}/com.ubuntu.sound.gschema.xml" \
                "${pkgdir}/usr/share/glib-2.0/schemas/"

  rm -r "${pkgdir}/usr/share/upstart/"

  sed -i 's/NotShowIn/OnlyShowIn/g' \
    "${pkgdir}/etc/xdg/autostart/indicator-sound.desktop"
}
