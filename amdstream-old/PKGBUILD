# Maintainer: Vojtech Kral <kral.vojtech at gmail dot com>
# Contributor: Dawid Wrobel <dawid at klej dot net>

pkgname=amdstream-old
pkgver=1.4.0_beta
pkgrel=3
pkgdesc="AMD ATI Stream SDK, old version, provided for convenience"
arch=(i686 x86_64)
url="http://ati.amd.com/technology/streamcomputing/sdkdwnld.html"
depends=("catalyst>=9.3")
makedepends=(rpmextract)
source=("http://download-developer.amd.com/GPU/executables/atistream-$pkgver-lnx32.tar.gzip")
license=("custom")
md5sums=('a6b2b04d62c925d5d7545210d3108440')

_arch="i386"
[ "$CARCH" = "x86_64" ] && source=("http://download-developer.amd.com/GPU/executables/atistream-$pkgver-lnx64.tar.gzip")
[ "$CARCH" = "x86_64" ] && md5sums=('3c9e053d964b438f2a6b29eaf483c6c0')
[ "$CARCH" = "x86_64" ] && _arch=("x86_64")

build() {
   cd $startdir/src

   #deal with atistream-brook
   dd if=atistream-brook-$pkgver.${_arch}.run of=atistreambrook.tar.gz bs=16384 skip=1 &> /dev/null || return 1
   tar -xzf atistreambrook.tar.gz &> /dev/null || return 1
   rpmextract.sh atistream-brook-$pkgver-1.${_arch}.rpm &> /dev/null|| return 1

   #deal with atistram-cal
   dd if=atistream-cal-$pkgver.${_arch}.run of=atistreamcal.tar.gz bs=16384 skip=1 &> /dev/null
   tar -xzf atistreamcal.tar.gz &> /dev/null || return 1
   rpmextract.sh atistream-cal-$pkgver-1.${_arch}.rpm &> /dev/null || return 1

   #install both
   install -m644 -D EndUserLicense.txt $startdir/pkg/usr/share/licenses/amdstream/license.txt
   cp -R $startdir/src/usr $startdir/pkg/
}
