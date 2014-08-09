# Maintainer:  Patryk Kowalczyk <patryk at kowalczyk dot ws>

pkgname=nvcontrol-utils
pkgver=340.24
pkgrel=1
pkgdesc="Tools to manage nvidia blob by command line"
arch=('i686' 'x86_64')
url="ftp://download.nvidia.com/XFree86/nvidia-settings/"
license=('GPL')
depends=('xorg-server' 'nvidia-utils' 'libxnvctrl')
source=(ftp://download.nvidia.com/XFree86/nvidia-settings/nvidia-settings-$pkgver.tar.bz2)

build() {
ls
  cd "$srcdir"/nvidia-settings-$pkgver/samples
  make
}

package() {
  cd "$srcdir"/nvidia-settings-$pkgver/samples/_out/Linux_*/
  mkdir -p ${pkgdir}/usr/bin/
  find . -perm /u=x,g=x,o=x -type f -exec cp -a '{}' ${pkgdir}/usr/bin/ \;
}

md5sums=('d61b7e0d3f4d6bc13bb528a26617f978')
