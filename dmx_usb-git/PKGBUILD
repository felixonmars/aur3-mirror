# Maintainer: Sébastien Leblanc
pkgname=dmx_usb-git
pkgver=20130819
pkgrel=3

# 2012-08-22

pkgdesc="DMX driver for the Enttec Open DMX USB interface"
url="https://github.com/lowlander/dmx_usb_module"
arch=('x86_64' 'i686')
license=('GPL')
makedepends=('git')
depends=('linux>=3.10.0' 'linux<3.11')
_linuxver="3.10"

_gitroot='https://github.com/lowlander/dmx_usb_module.git'
_gitname='dmx_usb_module'

source=(
  'dmx_usb.conf'
  'dmx_usb.install'
)

sha512sums=(
    'b40793d80f3fe40b82f163f5b7e6931515d9c691faaae749868edb8883ac949b27e9aa36e99ebdaec913b80a93dc51bfe4cff381cd204ce447f2160f821e3a69'
    '9639465b78a1e04e2164169ec0b52022f6be036e31acb7d4c80bcb621091c71daf2d4e5d93bf3523c940ef7b5437f52c9ca7a5ee01816f0a29dafd541d121add'
)

build() {
  cd "$srcdir"
  msg "Connecting to Git server..."

  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "Local files up to date"
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "Preparing to make"
  cd "$srcdir"
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  make clean
  make
}

package() {
  install -D "$srcdir/$_gitname-build"/dmx_usb.ko "$pkgdir"/usr/lib/modules/extramodules-"$_linuxver"-ARCH/dmx_usb.ko
  install -D "$srcdir/$_gitname-build"/dmx_usb_test "$pkgdir"/usr/bin/dmx_usb_test
  install -D "$srcdir"/dmx_usb.conf "$pkgdir"/etc/modprobe.d/dmx_usb.conf
}

