# Contributor: Troels Liebe Bentsen <tlb@rapanden.dk>
_modname=fglrx
pkgname=dkms-fglrx
pkgver=8.39.4
pkgrel=1
pkgdesc="Proprietary kernel drivers/modules for the AMD/ATI RADEON (9500 and later), \
         MOBILITY RADEON (M10 and later), RADEON XPRESS IGP and FireGL (Z1 and later) series of graphics accelerators."
arch=(i686 x86_64)
url="http://www.ati.com"
license=('custom:"ATI"') #license provided by ati-fglrx-utils package
depends=('dkms' 'fglrx-utils>=8.39.4')
replace=('fglrx' 'fglrx-ck' 'fglrx-suspend2' 'fglrx-mm')
conflicts=('fglrx' 'fglrx-ck' 'fglrx-suspend2' 'fglrx-mm')
provides=('fglrx' 'fglrx-ck' 'fglrx-suspend2' 'fglrx-mm')
install=fglrx.install
source=(http://www2.ati.com/drivers/linux/ati-driver-installer-$pkgver-x86.x86_64.run
    dkms.conf)

md5sums=('0d04bccfc0baf8defafa8f66b53a0ef6'
         'f2b6b19e7275f93d6f9a9a65f296e2d3')

build() {
  [ "$CARCH" = "i686" ] && _arch="x86"
  [ "$CARCH" = "x86_64" ] && _arch="x86_64"

  chmod a+x ati-driver-installer-$pkgver-x86.x86_64.run
  ./ati-driver-installer-$pkgver-x86.x86_64.run --extract archive_files

  cp $startdir/src/archive_files/arch/${_arch}/* $startdir/src/ -r 
  cp $startdir/src/archive_files/common/* $startdir/src/ -r 

  if [ "$CARCH" == "x86_64" ]; then
    cp $startdir/src/archive_files/x710_64a/* $startdir/src/ -r
  else
    cp $startdir/src/archive_files/x710/* $startdir/src/ -r
  fi

  cd $startdir/src
  cd $startdir/src/lib/modules/fglrx/build_mod/
  cp 2.6.x/Makefile .

  mkdir -p $startdir/pkg/usr/src/
  cp -a $startdir/src/lib/modules/fglrx/build_mod/ $startdir/pkg/usr/src/$_modname-$pkgver-$pkgrel

  sed -i -e "s/PACKAGE_VERSION=\".*\"/PACKAGE_VERSION=\"${pkgver}-${pkgrel}\"/" $startdir/dkms.conf
  cp $startdir/dkms.conf $startdir/pkg/usr/src/$_modname-$pkgver-$pkgrel/
}
