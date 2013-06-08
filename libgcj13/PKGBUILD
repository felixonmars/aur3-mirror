# Please report PKGBUILD bugs at
# https://github.com/ystein/archlinux-aur-packages

# Maintainer: Yannik Stein <yannik.stein [at] gmail.com>

pkgname='libgcj13'
pkgver=4.7.3_2
pkgrel=1
pkgdesc="Dynamically load and interpret java class files. Built from binary \
executables available in Debian repositories. Please report PKGBUILD bugs at \
https://github.com/ystein/archlinux-aur-packages."
url=http://gcc.gnu.org/java/
arch=(i686 x86_64)
license=(GPL)
conflicts=(gcc-gcj)

if [ $CARCH = 'i686' ]; then
  _DEBARCH=i386
  md5sums=(eb0bfa5c1441d7dbdec7eb6aabcc3ebe  )
else
  _DEBARCH=amd64
  md5sums=(c1501acc0815cb0de371db8b2b1276c3)
fi
source=(http://ftp.de.debian.org/debian/pool/main/g/gcj-4.7/${pkgname}_${pkgver//_/-}_${_DEBARCH}.deb)

build() {
  tar xf data.tar.gz
}

package() {
  find -type f -name 'libgcj.so*' -execdir install -Dm755 {} $pkgdir/usr/lib/{} \;

  # find newest library
  NLIB="/"$(cd $pkgdir; find usr/lib -maxdepth 1 -type f -name 'libgcj.so*' | sort --reverse | head -1)
  ln -s $NLIB $pkgdir/usr/lib/libgcj13.so
}
