# Contributor: Paul Bohme paul@bohme.org
pkgname=tpm_emulator
pkgver=0.6.1
pkgrel=1
pkgdesc="Software-based TPM emulator"
url="http://tpm-emulator.berlios.de/"
license="GPL"
depends=(gmp)
conflicts=()
arch=(i686)
install=$pkgname.install
source=(http://download.berlios.de/tpm-emulator/$pkgname-$pkgver.tar.gz
        remove-user.patch
        tpmd.rc.d)
md5sums=('95741ffbe3d82b9601a1b446aa9f7a5b'
         '3fcfe65b818321ca45cda3751c8c2b11'
         '522b83b25b39a2a51d07e8cd22d08d61')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p0 < ../remove-user.patch || return 1
  make || return 1
  mkdir -p $startdir/pkg/etc/udev/rules.d/
  make DESTDIR=$startdir/pkg install
  install -Dm755 ../tpmd.rc.d $startdir/pkg/etc/rc.d/tpmd
}
