# Maintainer: TDY <tdy@gmx.com>

pkgname=dazukofs-git
pkgver=20121228
pkgrel=1
pkgdesc="A stackable filesystem providing online file access control for userspace applications (linux 3.6+)"
arch=('i686' 'x86_64')
url="https://github.com/CaledoniaProject/dazukofs-linux3.6"
license=('GPL')
depends=('linux>=3.6')
makedepends=('git')
provides=('dazukofs')
conflicts=('dazukofs')
install=dazukofs.install
source=(dazukofs.conf)
md5sums=('914ddd8a0cefbf9c1157834dacda6891')

_gitroot=https://github.com/CaledoniaProject/dazukofs-linux3.6.git
_gitname=dazukofs-linux3.6

_kernver=$(pacman -Q linux | cut -d. -f2 | cut -f1 -d -)
_extramodules=extramodules-3.$_kernver-ARCH

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

  make DAZUKOFS_KERNEL_SRC=/lib/modules/$(< /usr/lib/modules/$_extramodules/version)/build
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm644 dazukofs.ko "$pkgdir/lib/modules/extramodules-3.$_kernver-ARCH/dazukofs.ko"
  gzip -9 "$pkgdir/lib/modules/extramodules-3.$_kernver-ARCH/dazukofs.ko"
  install -Dm644 "$srcdir/dazukofs.conf" "$pkgdir/etc/modules-load.d/dazukofs.conf"
  sed -i "/^EXTRAMODULES/ s|=.*|=$_extramodules|" "$startdir/$install"
}

# vim:set ts=2 sw=2 et:
