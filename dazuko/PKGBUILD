# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=dazuko
pkgver=2.3.9
pkgrel=1
pkgdesc="Device driver allowing userland applications to execute file access control"
arch=('i686' 'x86_64')
url="http://www.dazuko.org/"
license=('GPL')
depends=('kernel26')
install=dazuko.install
source=(http://dazuko.dnsalias.org/files/$pkgname-${pkgver}.tar.gz)
md5sums=('41bc91adb1848518025207ebff967732')

build() {
  cd $srcdir/$pkgname-${pkgver}/

  # Adds support for the "init module" event, important for use with F-Secure software
  patch -Np0 -i patch_fsecure_init_event.diff

  # Needs kernel patch (patch_dpath.diff) to be safe on SMP kernels
  ./configure --disable-debug --disable-chroot-support --enable-event-init-module \
    --without-dep --without-library --without-example-c --enable-syscalls \
    --mapfile=/boot/System.map26
  make

  # Install kernel module
  install -D -m644 dazuko.ko ${startdir}/pkg/lib/modules/$(uname -r)/extra/dazuko.ko
}

# vim:set ts=2 sw=2 et:
