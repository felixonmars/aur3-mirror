# Contributor: Ray Rashif <schivmeister@gmail.com>

pkgname=catalyst-rt
pkgver=8.8
_kernver=2.6.26-rt
pkgrel=1
pkgdesc="Proprietary AMD/ATI kernel drivers for Radeon brand cards. For kernel26rt."
arch=(i686 x86_64)
url="http://www.ati.amd.com"
license=('custom')
depends=("catalyst-utils>=$pkgver" "kernel26rt>=2.6.26.5_rt9-1" "kernel26rt<2.6.27")
install=$pkgname.install
source=(http://www2.ati.com/drivers/linux/ati-driver-installer-${pkgver/./-}-x86.x86_64.run
	2.6.26.patch)

build() {
    cd "$srcdir"

    [ "$CARCH" = "i686" ] && _arch="x86"
    [ "$CARCH" = "x86_64" ] && _arch="x86_64"

    /bin/bash ./ati-driver-installer-${pkgver/./-}-x86.x86_64.run \
      --extract archive_files

    cd archive_files/common
    patch -Np0 -i "$srcdir/2.6.26.patch" || return 1

    cp "$srcdir/archive_files/arch/$_arch/"* "$srcdir/" -r
    cp "$srcdir/archive_files/common/"* "$srcdir/" -r

    if [ "$CARCH" == "x86_64" ]; then
      cp "$srcdir/archive_files/x710_64a/"* "$srcdir/" -r
    else
      cp "$srcdir/archive_files/x710/"* "$srcdir/" -r
    fi
    
    cd "$srcdir/lib/modules/fglrx/build_mod/"

    # Build the kernel module
    cp 2.6.x/Makefile .
    make -C "/lib/modules/$_kernver/build" SUBDIRS="$(pwd)" \
      modules || return 1

    # Install the kernel module
    install -Dm0644 "$srcdir/lib/modules/fglrx/build_mod/fglrx.ko" \
      "$pkgdir/lib/modules/$_kernver/video/fglrx.ko"

    sed -i "s/KERNEL_VERSION=.*/KERNEL_VERSION=$_kernver/g" \
      "$startdir/$install"

    # install licenses
    install -Dm0644 "$srcdir/archive_files/ATI_LICENSE.TXT" \
      "$pkgdir/usr/share/licenses/$pkgname/AMD_ATI_LICENSE.TXT"
}
md5sums=('276976fb5aaf108efcdbf37256bf6d51'
         '132569a6ea9cbb0f07fe4479126aa9a4')
