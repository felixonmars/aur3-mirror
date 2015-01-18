# Maintainer: JSpaces <jspace -aT- unseen -d0T- is>
# This provides libdjbfft.so for a52dec-fft

_srcname=djbfft
pkgname=lib${_srcname}
pkgver=0.76
pkgrel=4
pkgdesc="Shared library for Fast Fourier Transformation dependancy for a52dec-fft."
arch=('i686' 'x86_64')
url="http://cr.yp.to/djbfft.html"
license=('custom')
provides=('fft')
source=(http://cr.yp.to/djbfft/"$_srcname-$pkgver".tar.gz 
        error.h.patch
        glibc2.4-1.patch
        testsuite-1.patch)
# The link to CLFS patches
# http://svn.cross-lfs.org/svn/repos/patches/djbfft

sha256sums=('799d929c3631a77ef0e16a2449e4fc11af8540b62359f8733ac2899fca2b394c'
            '2eaeaa9b82cff8215712dc3ed5a39802af397c8f413f850ba773c672c6511aa2'
            'deab308df7c4d0ecd09499e18ad5b6b22d12a9545db1a1da9839bab2f5c602f8'
            '8f29fa77e74f11c96ec82f3e5f19ec96c1cc8d93f706464c91b4a68437d9a396')
 
prepare() {
  cd "$_srcname-$pkgver"

  msg "Configuring package location to /usr."
  sed -i 's@/usr/local/djbfft@/usr@' conf-home

  msg "Patching the devel files to include <error.h>."
  patch -p0 < ../error.h.patch

  msg "Patching with CLFS fixes for glibc>=2.4 and testsuite files."
  # http://cblfs.cross-lfs.org/index.php/DJBFFT patches
  patch -Np1 -i "$srcdir"/glibc2.4-1.patch
  patch -Np1 -i "$srcdir"/testsuite-1.patch

  msg "Configuring gcc flags for CARCH version."
  # "idea" for 64 bit straight machine code
  # "Pentium" for i686 which needs -malign-double for 8 bit precision
  if [ ${CARCH}="x86_64" ]; then
     echo "gcc -O1 -fomit-frame-pointer -fPIC -DPIC" > conf-cc
     sed -i 's/auto/idea/' conf-opt
  else
    echo "gcc -O1 -fomit-frame-pointer -fPIC -DPIC -malign-double" > conf-cc
    sed -i 's/auto/Pentium/' conf-opt
  fi
}

build() {
  cd "$_srcname-$pkgver"
  
  msg "Custom CFLAGS causes build failure thus unsetting CFLAGS."
  unset CFLAGS
  
  msg "Compiling as a shared library."
  make LIBDJBFFT="$pkgname".so."$pkgver" LIBPERMS="0644"
}

package() {
  cd "$_srcname-$pkgver"
  msg "Installing shared library."
  install -Dm644 "$pkgname".so."$pkgver" "$pkgdir"/usr/lib/"$pkgname".so."$pkgver"
  msg "Creating symlinks for library."
  ln -svf "$pkgname".so."$pkgver" "$pkgdir"/usr/lib/"$pkgname".so.0
  ln -svf "$pkgname".so."$pkgver" "$pkgdir"/usr/lib/"$pkgname".so

  msg "Installing include files."
  install -d "$pkgdir"/usr/include
  install -m644 "$srcdir"/"$_srcname-$pkgver"/{com*,fft*,has*,real*}.h "$pkgdir"/usr/include/

  msg "Installing license file."
  install -Dm644 "$srcdir"/"$_srcname-$pkgver"/README \
    "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

# vim:set ts=2 sw=2 et:
