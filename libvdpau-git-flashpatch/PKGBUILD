pkgname=libvdpau-git-flashpatch
pkgver=20120510
pkgrel=1
pkgdesc="Nvidia VDPAU library from git with patch to fix flash blue tint and bleed through"
arch=(i686 x86_64)
url='http://cgit.freedesktop.org/~aplattner/libvdpau'
depends=('gcc-libs')
conflicts=('nvidia-utils<190.42-2')
options=('!libtool')
license=('custom')
makedepends=('git' 'libx11')
provides=('libvdpau')
conflicts=('libvdpau')
source=(flash_patch.patch)
md5sums=('0536a1b860d0fdb1b52b271a040c389e')
 
_gitroot="git://people.freedesktop.org/~aplattner/libvdpau"
_gitname="libvdpau"
 
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
 
  patch -p1 < "$srcdir/flash_patch.patch"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make
}
 
package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
 
  install -d -m755 "$pkgdir/usr/share/licenses/$_gitname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$_gitname/"
}
