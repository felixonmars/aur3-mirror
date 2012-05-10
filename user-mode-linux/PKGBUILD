pkgname=user-mode-linux
_kernelname=-uml
pkgver=3.3.5
pkgrel=1
pkgdesc="Run multiple virtual Linux systems as applications within a normal Linux system"
arch=('i686' 'x86_64')
license=('GPL2')
source=(ftp://ftp.kernel.org/pub/linux/kernel/v3.0/linux-$pkgver.tar.bz2
        config)
md5sums=('2f6b7da0418e26312bcabd08ab448569'
         '64a900a5064a7110e55dbf1922b479d1')
depends=('glibc' 'uml_utilities')
makedepends=('libpcap')
url="http://user-mode-linux.sourceforge.net/"

build() {
  cd "$srcdir/linux-$pkgver"
  cp "$srcdir/config" ./.config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  fi

  LDFLAGS="" make oldconfig ARCH=um
  LDFLAGS="" make vmlinux modules ARCH=um
}

package() {
  cd "$srcdir/linux-$pkgver"

  mkdir -p "$pkgdir/lib/modules" "$pkgdir/usr/lib/uml"

  make INSTALL_MOD_PATH="$pkgdir" modules_install ARCH=um

  mv "$pkgdir/lib/modules" "$pkgdir/usr/lib/uml/"
  rm -rf "$pkgdir/lib/"

  mkdir -p "$pkgdir/usr/bin"
  cp vmlinux "$pkgdir/usr/bin"
}
