# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Balló György <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

pkgname=indicator-power-bzr
pkgver=284
pkgrel=1
pkgdesc="An indicator to show the power status of your devices"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-power"
license=('GPL')
depends=('dconf' 'libnotify' 'upower')
makedepends=('cmake' 'intltool' 'python2')
provides=(indicator-power{,-bzr})
conflicts=('indicator-power')
groups=(unity)
install=${pkgname}.install
source=("bzr+lp:indicator-power" 
        '0001-Not-a-phone.patch' 
        'indicator-power-pantheon.desktop')
sha512sums=('SKIP'
            '8a25bbf83036bd8355142eb49207a98943901f299e7fd3bd7bd90f6bc876d77a52f8685016f3129cdfbc74dbc64d028328ae072fd7868df2b56450307af7621f'
            '31bf2bbb4c03dd7032f3593cc9f244a2dbced64bb32312c7fc72e6342e7063d3396af1e590af0808f6f0e9bfe92ee32cd9a601081e471eff3d925c0ab666a0bd')

pkgver() {
  cd indicator-power
  bzr revno
}

prepare() {
  cd "${srcdir}/indicator-power"

  patch -p1 -i ../0001-Not-a-phone.patch

  sed -ie '/NotShowIn=/d' data/indicator-power.desktop.in
}

build() {
  cd "${srcdir}/indicator-power"

  export CFLAGS+=" -Wno-error"

  rm -rf build; mkdir build; cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib -Denable_tests=OFF
  make
}

package() {
  cd "${srcdir}/indicator-power/build/"

  make DESTDIR="${pkgdir}/" install

  install -Dm644 ${srcdir}/indicator-power-pantheon.desktop ${pkgdir}/etc/xdg/autostart/

  find "${pkgdir}" -type f -name '*.a' -delete

  rm -r "${pkgdir}/usr/share/upstart/"
}

