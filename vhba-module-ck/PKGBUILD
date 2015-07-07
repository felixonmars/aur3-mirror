# Maintainer:  prettyvanilla <prettyvanilla@lavabit.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>

_pkgname=vhba-module
pkgname=vhba-module-ck
pkgver=20140928
pkgrel=4
pkgdesc="Kernel module that emulates SCSI devices. For linux-ck."
arch=('i686' 'x86_64')
url="http://cdemu.sourceforge.net/"
license=('GPL')
depends=('linux-ck>=4.0' 'linux-ck<4.1' 'vhba-module')
makedepends=('linux-ck-headers')
#provides=('vhba-module')
install=$pkgname.install
source=("http://downloads.sourceforge.net/cdemu/$_pkgname-$pkgver.tar.bz2")
md5sums=('967007230bb028424216d9b35da422c0')

_extramodules=extramodules-4.0-ck

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"

  make KDIR=/usr/lib/modules/$_kernver/build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 vhba.ko "$pkgdir/usr/lib/modules/$_extramodules/vhba.ko"
}
