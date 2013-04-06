
# Maintainer: RunningDroid <rningdrd AT tormail.net>

_pkgname=xf86-video-fbdev
pkgname=$_pkgname-git
pkgver=0.4.3.1.gac29341
pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git describe --always | sed s/${_pkgname}-// | sed 's/-/./g')"
}
pkgrel=3
pkgdesc="X.Org fbdev video driver - Git version"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xorg/driver/$_pkgname/"
license=('custom')
depends=('glibc' 'xorg-server' 'mtdev' 'X-ABI-XINPUT_VERSION=19')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto' 'git' 'xorg-util-macros')
conflicts=("$_pkgname" 'X-ABI-XINPUT_VERSION!=19')
groups=('xorg-drivers' 'xorg')
source=(git://anongit.freedesktop.org/xorg/driver/$_pkgname)
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package(){
provides="$_pkgname=$(echo $pkgver | awk -F . -v OFS='.' '{print $1 OFS $2 OFS $3}')"
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
