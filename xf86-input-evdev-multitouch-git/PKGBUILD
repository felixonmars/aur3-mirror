# Maintainer: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Based on Det's xf86-input-evdev-git, which is
# Based on [extra]'s xf86-input-evdev

# This is only needed until our patch is not applied to the master branch in
# xf86-input-evdev-git. See the patch description for patch details. This also
# enforces the dependency mtdev which is needed for multitouch support in
# xf86-input-evdev

# If patching fails, then the patch probably was applied upstream.

_pkgname=xf86-input-evdev
pkgname=$_pkgname-multitouch-git
pkgver=20120124
pkgrel=1
pkgdesc="X.Org evdev Input driver - Git version with multitouch enforced"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xorg/driver/$_pkgname/"
license=('custom')
depends=('glibc' 'mtdev')
makedepends=('xorg-server-devel>=1.10.99.902' 'git')
options=('!libtool' '!makeflags')
groups=('xorg-drivers' 'xorg')
provides=("$_pkgname=99")
conflicts=("$_pkgname" 'xorg-server<1.10.99.902')
source=( '0001-Process-ABS_-X-Y-even-if-multitouch-is-enabled.patch' )
md5sums=( '0ccc4dacd510393277a2cdaad52a4325' )

_gitroot=git://anongit.freedesktop.org/xorg/driver/$_pkgname
_gitname=$_pkgname

build() {
  msg "Connecting to anongit.freedesktop.org GIT server...."

  if [ -d $_gitname ] ; then
     cd $_gitname
     msg "reseting local changes..."
     git checkout -f
     git pull origin && cd ..
     msg "The local files are updated."
  else
     git clone --depth 1 $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cd $_gitname
  msg "Patching..."
  patch -p1 < $srcdir/0001-Process-ABS_-X-Y-even-if-multitouch-is-enabled.patch
  msg "Starting make..."
  ./autogen.sh --prefix=/usr
  make
}

package(){
  cd $_gitname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
