# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=wacom_serial5-git
pkgver=latest
pkgrel=1
pkgdesc="A driver for protocol V Wacom serial tablets (Intuos, Intuos2)"
arch=(any)
url="https://github.com/RoaldFre/wacom_serial5"
license=('unknown')
groups=()
depends=('inputattach-wacom5')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('70-serial-wacom.rules')
noextract=()
md5sums=('ca5fba5d5ee3aa249f281493044b8a5b')

_gitroot=https://github.com/RoaldFre/wacom_serial5.git
_gitname=wacom_serial5
_kernver=`uname -r`

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  make all
}

package() {
  cd "$srcdir/$_gitname-build"
  ls
  gzip ./wacom_serial5.ko
  install -d -m755 $pkgdir/lib/modules/$_kernver/kernel/drivers/input/tablet
  install -d -m755 $pkgdir/etc/udev/rules.d
  install -D -m644 ./wacom_serial5.ko.gz $pkgdir/lib/modules/$_kernver/kernel/drivers/input/tablet/
  install -D -m644 $srcdir/70-serial-wacom.rules $pkgdir/etc/udev/rules.d/
#  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
