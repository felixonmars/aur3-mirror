# Maintainer: xzy3186 <xzy3186(at)gmail>
# Contributors: Bob Fanger <bfanger(at)gmail>, Filip <fila pruda com>, Det <nimetonmaili(at)gmail>
# Based on [community-testing]'s r8168: https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/r8168

pkgname=r8168-all
_basename=r8168
pkgver=8.039.00
pkgrel=2
pkgdesc="A kernel module for Realtek 8168 network cards (for all kernels)"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw"
license=('GPL')
makedepends=('linux-headers')
conflicts=('r8168' 'r8168-lts' 'r8168-ck')
provides=('r8168')
#source=("https://r8168.googlecode.com/files/$_basename-$pkgver.tar.bz2")
source=("http://r8168dl.appspot.com/files/r8168-${pkgver}.tar.bz2"
        "linux40.patch")
install=$pkgname.install
sha256sums=('767d922270274e781d8d42493a0021db1cafcb0388ac62564d0c0c3d82703edd'
            'e6087439b30c8f6c26113c182dd1f95044d918241b1c281b6e84b9a334e68910')

prepare() {
   cd $_basename-$pkgver

   # Use separate source directories
   for _kernver in $(cat /usr/lib/modules/extramodules-*/version); do
      cp -r src src-$_kernver
   done
}

build() {
   # Build for all kernels
   for _kernver in $(cat /usr/lib/modules/extramodules-*/version); do
      cd "$srcdir/$_basename-$pkgver/src-$_kernver"
      if [ $(echo $_kernver | sed "s/\(^[0-9]\.[0-9]\).*/\1/g") = "4.0" ]
      then
         patch -Np2 -i "$srcdir/linux40.patch"
         echo "come here"
      fi

      # Build
      msg2 "Building module for $_kernver"
      make -C /usr/lib/modules/$_kernver/build \
         SUBDIRS="$srcdir/$_basename-$pkgver/src-$_kernver" \
         EXTRA_CFAGS="-DCONFIG_R8168_NAPI -DCONFIG_R8168_VLAN" \
         modules
   done
}

package() {
   # Install for all kernels
   for _extramod in $(find /usr/lib/modules/extramodules-*/version -printf '%h\n'); do
      _kernver=$(cat $_extramod/version)

      # Install
      install -Dm644 $_basename-$pkgver/src-$_kernver/$_basename.ko "$pkgdir/$_extramod/$_basename.ko"

      # Compress
      gzip "$pkgdir/$_extramod/$_basename.ko"
   done
}
