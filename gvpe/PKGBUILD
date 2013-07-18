# Maintainer: Vadim Kaushan <admin@disasm.info>
# Contributor: Marc Lehmann <schmorpforge@schmorp.de>
pkgname=gvpe
pkgver=2.25
pkgrel=2
pkgdesc="Simple and robust virtual network solution"
url="http://software.schmorp.de/pkg/gvpe.html"
arch=('x86_64' 'i686')
license=(GPL3)
depends=()
source=("http://ftp.gnu.org/gnu/gvpe/${pkgname}-${pkgver}.tar.gz"
        "gvpe@.service"
        "if-up"
        "node-up"
        "node-down"
        "gvpe.conf.example")
sha256sums=('73c32d9a28fadd6aa531e0fed27c7a96bc0e5e9a5626ebf70368eaad3dbb51bf'
            '60a6b5f03524ede9e9fa2538623b7a808cf02e41f91e800b7c1afe039effd28f'
            '89ea3660f780aabc37adcb621dbfd7cffa70b463c0251f03ad05c58fc564a762'
            '8a74c5c3fcea5586fc72d6c8c2c30a23b3dd32e92bf1674b29a126a0c8ac2fa3'
            '1ae1ad31a0d91fac1764111acbc5fef6d5edf6876c24b44f97cf1b1e9be9b89c'
            '1d01d9f384fb1baa4f15fcc43ab8b3f8fb68250b88cd639010ff00a8a0f7b4ac')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm700 -d "${pkgdir}/etc/gvpe/pubkey"  
  install -Dm644 "${srcdir}/gvpe@.service" "${pkgdir}/usr/lib/systemd/system/gvpe@.service"
  install -Dm700 "${srcdir}/if-up"     "${pkgdir}/etc/gvpe/if-up"
  install -Dm700 "${srcdir}/node-up"   "${pkgdir}/etc/gvpe/node-up"
  install -Dm700 "${srcdir}/node-down" "${pkgdir}/etc/gvpe/node-down"
  install -Dm600 "${srcdir}/gvpe.conf.example" "${pkgdir}/etc/gvpe/gvpe.conf.example"
  install -Dm755 -d "${pkgdir}/usr/share/doc/gvpe/complex-example"
  
  cd doc/complex-example
  install -Dm644 -t "${pkgdir}/usr/share/doc/gvpe/complex-example" README gvpe.conf if-up node-up
}

# vim:set ts=2 sw=2 et: