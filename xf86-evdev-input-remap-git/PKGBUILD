# Maintainer: Your Name <youremail@domain.com>
pkgname=xf86-evdev-input-remap-git
pkgver=20120717
pkgrel=1
pkgdesc="X.org evdev input driver patched to support keycode remapping"
arch=(i686 x86_64)
url="http://www.thenautilus.net/SW/xf86-input-evdev/"
license=('custom')
depends=('glibc')
makedepends=('git' 'pkgconfig' 'xorg-server>=1.7.0' 'inputproto>=2.0' 'randrproto>=1.3.1' 'xorg-server-devel')
provides=("xf86-input-evdev=$pkgver")
conflicts=('xorg-server<1.7.0' 'xf86-input-evdev')
options=('!libtool')
source=(Fix_inverted_horizontal_scroll.diff)

_gitroot=git://www.thenautilus.net/xf86-input-evdev
_gitbranch=code-remap-2.7.0
_gitname=xf86-input-evdev-remap

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" -b "$_gitbranch" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  patch -Np1 -i ${srcdir}/Fix_inverted_horizontal_scroll.diff
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

}

# vim:set ts=2 sw=2 et:
md5sums=('748e7d4dcf6c7acd29b588091034f84c')
