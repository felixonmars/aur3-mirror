# Maintainer: deusstultus <deusstultus@gmail.com>

# Contributors by way of cgminer package in arch repos
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: monson <holymonson@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: David Manouchehri <david@davidmanouchehri.com>

# Contributor by way of cgminer-git in AUR
# Contributor: Atterratio <atterratio at gmail>

pkgname=cgminer-amd-adl-git
provides=('cgminer')
_gitname=cgminer
epoch=1
pkgver=4900.9282054
pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
pkgrel=1
pkgdesc="Multi-threaded multi-pool GPU, FPGA and ASIC miner for bitcoin and derivative coins with AMD ADL extension."
url='http://forum.bitcoin.org/index.php?topic=28402.0'
license=('GPL3' 'custom')
#Note license was GPL2 prior to Tue Feb 21 22:23:07 2012 +1100 if playing with old versions with this PKGBUILD
arch=('i686' 'x86_64')
depends=('curl' 'libcl' 'libusbx' 'jansson')
conflicts=('cgminer' 'cgminer-git')
replaces=('cgminer-git-adl')
makedepends=('opencl-headers' 'git' 'unzip')
optdepends=('ncurses: For ncurses formatted screen output'
            'opencl-catalyst: OpenCL implementation for AMD')
source=("git+https://github.com/ckolivas/cgminer.git"
	"http://download2-developer.amd.com/amd/GPU/zip/ADL_SDK_4.0.zip"
        "$_gitname.conf.d::https://projects.archlinux.org/svntogit/community.git/plain/trunk/cgminer.conf.d?h=packages/cgminer"
        "$_gitname.service::https://projects.archlinux.org/svntogit/community.git/plain/trunk/cgminer.service?h=packages/cgminer")
noextract=('ADL_SDK_4.0.zip')
sha512sums=('SKIP'
            '6f0ae7ac5d0efc26a8fdabd61696402c119f5399531423fafd35f9c0da3d4181ca54b361e83b777ad719b64b335a55c02083f1cea7f4d01e86eacc032de29fb5'
            '99c38bc395848f9712ce172343d31f5c60f5d8ac1cfe2f48df8f3ec6c488fc275763a79c5ef36b99f32faa465b5a65284b38e8a63ef9b144075ee13971313b41'
            '3317b60c6b1f14c47d8ee636113ef40a4023ab14054129de80a37947b381fd2b647a7053f4e1bb639efa225a514e862fa531908714c34040dda2d6221dde7f5f')

backup=("etc/conf.d/$_gitname" "etc/$_gitname.conf")
[ "$CARCH" == "x86_64" ] && makedepends+=('yasm')

prepare() {
  unzip -jod "$srcdir/$_gitname/ADL_SDK/" "$srcdir/ADL_SDK_4.0.zip" "include/*.h"
  unzip -od "$srcdir/AMD_ADL_SDK" "$srcdir/ADL_SDK_4.0.zip" "Public-Documents/ADL*"
}

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh

  # We have latest jansson and libusb - just use them
  sed "s|ac_subdirs_all='compat/libusb\-1.0'||" -i ./configure
  sed 's|subdirs="$subdirs compat/libusb\-1.0"||' -i ./configure
  sed 's|LIBUSB_LIBS="compat/libusb-1.0/libusb/.libs/libusb-1.0.a"|LIBUSB_LIBS=-lusb-1.0|' -i ./configure
  sed 's|JANSSON_LIBS="compat/jansson/libjansson.a"|JANSSON_LIBS=-ljansson|' -i ./configure
  sed 's|compat/Makefile compat/jansson/Makefile||' -i ./configure

  sed 's|JANSSON_INCLUDES = -I$(top_srcdir)/compat/jansson||' -i ./Makefile.in
  sed 's|USBUTILS_INCLUDES = -I$(top_srcdir)/compat/libusb\-1.0/libusb|USBUTILS_INCLUDES = -I/usr/include/libusb-1.0|' -i ./Makefile.in
  sed 's|SUBDIRS = lib compat ccan|SUBDIRS = lib ccan|' -i ./Makefile.in

  rm -r compat

  # Here you may want to use custom CFLAGS
  #export CFLAGS="-O2 -march=native -mtune=native -msse2"

  ./configure \
    --prefix=/usr \
    --enable-scrypt \
    --enable-opencl \
    --enable-bflsc \
    --enable-bitforce \
    --enable-icarus \
    --enable-modminer \
    --enable-ztex \
    --enable-avalon \
    --enable-adl 

  make
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$_gitname.service "$pkgdir"/usr/lib/systemd/system/$_gitname.service
  install -Dm644 "$srcdir"/$_gitname.conf.d "$pkgdir"/etc/conf.d/$_gitname
  sed 's#/usr/local/bin#/usr/bin#g' example.conf > $_gitname.conf
  install -Dm644 $_gitname.conf "$pkgdir"/etc/$_gitname.conf
  install -Dm644 "$srcdir/AMD_ADL_SDK/Public-Documents/ADL SDK EULA.rtf" "$pkgdir/usr/share/licenses/$pkgname/AMD_ADL_SDK_EULA.rtf"
  install -Dm644 "$srcdir/AMD_ADL_SDK/Public-Documents/ADL SDK EULA.pdf" "$pkgdir/usr/share/licenses/$pkgname/AMD_ADL_SDK_EULA.pdf"
}
