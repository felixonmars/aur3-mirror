#Maintainer: crondog

pkgname=xf86-video-freedreno-git
_pkgname=xf86-video-freedreno
pkgver=1.0.0.r7.g076cad8
pkgrel=1
pkgdesc="X.org freedreno video driver"
arch=("armv7h")
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=15')
conflicts=('xorg-server<1.15.0' 'X-ABI-VIDEODRV_VERSION<15' 'X-ABI-VIDEODRV_VERSION>=16' ${_pkgname})
provides=("${_pkgname}")
groups=('xorg-drivers' 'xorg')
source=('git://anongit.freedesktop.org/xorg/driver/xf86-video-freedreno')
sha256sums=('SKIP')

pkgver(){
    cd ${_pkgname}
    git describe | sed 's/xf86-video-freedreno-//' | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
