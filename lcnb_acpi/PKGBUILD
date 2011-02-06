# Maintainer: gyo <gyo_at_archlinux_dot_fr>
pkgname=lcnb_acpi
pkgver=0.10
pkgrel=1
pkgdesc="A module for handling ACPI hotkeys on Hercules eCAFE netbook"
arch=(i686)
url="http://www.ecafe.hercules.com/"
license=('GPL2')
groups=
provides=
depends=()
makedepends=()
install=($pkgname.install)
source=($pkgname-$pkgver.tar.gz
        Makefile_standalone_compile.patch
        lcnb_acpi_gcc43.patch)
md5sums=('9504ab8e81c0275bca218364e77039b1'
         '6d279f06f88dfebb77dd9ab21bcb5036'
	 '4eef008bd77c5449eded4e1c05d2a577')

 
build() {
  cd $srcdir/$pkgname-$pkgver-1mdv2008.1/
  patch -Np1 -i ../Makefile_standalone_compile.patch || return 1
  patch -Np1 -i ../lcnb_acpi_gcc43.patch || return 1
  make || return 1
  install -d -m755 $pkgdir/lib/modules/`uname -r`/3rdparty/acpi/
  install -m644 $pkgname.ko $pkgdir/lib/modules/`uname -r`/3rdparty/acpi/
}
