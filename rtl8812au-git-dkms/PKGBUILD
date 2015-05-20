# Maintainer: Simon Hanna <simon DOT hanna (at) serve-me (dOt) info>
# Contributor: hideaki <hideaki(at)gmail>
# Contributor: xzy3186 <xzy3186(at)gmail>

pkgname=rtl8812au-git-dkms
_basename=rtl8812au
pkgver=r31.83f539d
pkgrel=1
pkgdesc="A kernel module for Realtek 8812au network cards with dkms support"
url="https://github.com/csssuf/rtl8812au"
license=("GPL")
arch=('i686' 'x86_64')
depends=('linux-headers' 'dkms')
conflicts=()
source=("git+https://github.com/csssuf/rtl8812au.git"
        "dkms.conf")
install=$_basename.install
sha256sums=('SKIP'
            'a8e1b56815d23523bccf90330c1f6ebcb827d227aea720b2d247dacf42ab658a')

pkgver() {
  cd "$srcdir/$_basename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
   cd $srcdir/$_basename
   mkdir -p $pkgdir/usr/src/$pkgname-$pkgver
   cp -pr * $pkgdir/usr/src/$pkgname-$pkgver
   cp $srcdir/dkms.conf $pkgdir/usr/src/$pkgname-$pkgver
}
