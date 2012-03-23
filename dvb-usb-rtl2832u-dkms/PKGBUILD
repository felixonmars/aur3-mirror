# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=dvb-usb-rtl2832u-dkms
pkgver=2.2.2
pkgrel=1
pkgdesc="Linux module for the RTL2832U DVB-T USB2.0 device, dkms version"
arch=(any)
url="https://github.com/ambrosa/DVB-Realtek-RTL2832U-2.2.2-10tuner-mod_kernel-3.0.0"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=(rtl2832u-git)
conflicts=(rtl2832u-git)
install=dvb-usb-rtl2832u-dkms.install
source=('Makefile.patch' 'dkms.conf')
md5sums=('77d67b1b9f6870e0d869f412aaa487dd'
         'cd7c58916e2efa648abb359aa7891218')

_git_root=https://github.com/ambrosa/DVB-Realtek-RTL2832U-2.2.2-10tuner-mod_kernel-3.0.0.git
_git_name=dvb-usb-rtl2832u

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_git_name" ]]; then
    cd "$_git_name" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_git_root" "$_git_name"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  rm -rf "$srcdir/$_git_name-build"
  git clone "$srcdir/$_git_name" "$srcdir/$_git_name-build"
  cd "$srcdir/$_git_name-build/RTL2832-2.2.2_kernel-3.0.0"
  patch -uN Makefile $srcdir/Makefile.patch
}

package() {
  cd "$srcdir/$_git_name-build/RTL2832-2.2.2_kernel-3.0.0"
  install -dm 0755 $pkgdir/usr/src/dvb-usb-rtl2832u-2.2.2
  cp -a * $pkgdir/usr/src/dvb-usb-rtl2832u-2.2.2
  cd "$srcdir/"
  install -Dm 0644 dkms.conf $pkgdir/usr/src/dvb-usb-rtl2832u-2.2.2
}

# vim:set ts=2 sw=2 et:
