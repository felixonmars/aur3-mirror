# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
pkgname=('vtuner-module-lts-hg')
pkgdesc="VTuner client kernel module for virtual DVB's"
pkgver=17.3ab5e05d0518
pkgrel=2
arch=('x86_64' 'i686')
url="http://code.google.com/p/vtuner/"
license=('GPL2')
makedepends=('mercurial' 'linux-lts-headers' 'gcc' 'make' 'patch')
provides=('vtuner-module')
install='vtunerc-lts.install'
source=("hg+https://code.google.com/p/vtuner.linux-driver"
        'kernel-3.10.patch'
        '93-vtunerc-lts.rules')
sha256sums=('SKIP'
            'bcdf6ff8e18e7f4c50bcb758700728d4aa7c3643030c7d6f90b904dc75adac5b'
            '4b2d860cac8c8bab2d8fa79760d4405bef6fd042f4e78b680d25d1a5ebcbf83d')

pkgver() {
  cd "${srcdir}/vtuner.linux-driver"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

prepare() {
  # linux headers location
  export KDIR="/usr/lib/modules/`uname -r`/build"
  cd "${srcdir}/vtuner.linux-driver"
  patch -p1 -i "${srcdir}/kernel-3.10.patch"
}

build() {
  cd "${srcdir}/vtuner.linux-driver"
  make
  gzip -f9 "${srcdir}/vtuner.linux-driver/vtunerc.ko"
}

package() {
  install -Dm644 "${srcdir}/vtuner.linux-driver/vtunerc.ko.gz" "${pkgdir}$(readlink -f "/usr/lib/modules/`uname -r`/extramodules")/vtunerc.ko.gz"
  install -Dm644 "${srcdir}/93-vtunerc-lts.rules" "${pkgdir}/usr/lib/udev/rules.d/93-vtunerc-lts.rules"
}
