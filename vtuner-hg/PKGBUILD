# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
pkgbase=vtuner-hg
pkgdesc="access DVB devices over the network"
pkgname=('vtuner-client-hg' 'vtuner-server-hg')
pkgver=116.b6fa0d2b133b
pkgrel=4
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="http://code.google.com/p/vtuner/"
license=('GPL2')
makedepends=('mercurial' 'gcc' 'make' 'patch')
source=("hg+https://code.google.com/p/vtuner.apps"
        'add_arm_targets.diff'
        'vtunerc@.service'
        'vtunerd.service'
        'vtunerc0'
        'vtunerd'
        'vtunerc-driver_kmod')
sha256sums=('SKIP'
            '86b861ddb581fe90bee4e16643289d4fec36f923f587205eda3da85b774fab22'
            '870e48fb79b9065b5c98056df1aa6638c4dd3c5340331aed8a91af45f2162477'
            '9e4568a92caf05b5add190e792b788100aea3aac783ff1681c816a7ac87c631b'
            '964b7bff3850e613ab84770438ec602eb721e0ed5f6a3e803e76e0b657e9a5cd'
            'c47790245befba5f0c1424e48854a2c06f62edc819c797ff14a15e80128568bc'
            '8cf60a015965830d86ee213bbae1d066c72941b716acf535ccb799aa884631f3')

pkgver() {
  cd "${srcdir}/vtuner.apps"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

prepare() {
  cd "${srcdir}/vtuner.apps"
  patch -p1 -i "${srcdir}/add_arm_targets.diff"
}

build() {
  cd "${srcdir}/vtuner.apps"
  make ${CARCH}
}

package_vtuner-client-hg() {
  pkgdesc="VTuner client for virtual DVB's"
  provides=('vtuner-client')
  depends=('vtuner-module')
  backup=('etc/conf.d/vtunerc0')
  install -Dm744 "${srcdir}/vtuner.apps/dist/${CARCH}/vtunerc.${CARCH}" "${pkgdir}/usr/bin/vtunerc"
  install -Dm644 "${srcdir}/vtunerc@.service" "${pkgdir}/usr/lib/systemd/system/vtunerc@.service"
  install -Dm744 "${srcdir}/vtunerc-driver_kmod" "${pkgdir}/usr/lib/systemd/scripts/vtunerc-driver_kmod"
  install -Dm644 "${srcdir}/vtunerc0" "${pkgdir}/etc/conf.d/vtunerc0"
}

package_vtuner-server-hg() {
  pkgdesc="VTuner server for broadcasting local DVB devices in network"
  provides=('vtuner-server')
  backup=('etc/conf.d/vtunerd')
  install -Dm744 "${srcdir}/vtuner.apps/dist/${CARCH}/vtunerd.${CARCH}" "${pkgdir}/usr/bin/vtunerd"
  install -Dm644 "${srcdir}/vtunerd.service" "${pkgdir}/usr/lib/systemd/system/vtunerd.service"
  install -Dm644 "${srcdir}/vtunerd" "${pkgdir}/etc/conf.d/vtunerd"
}
