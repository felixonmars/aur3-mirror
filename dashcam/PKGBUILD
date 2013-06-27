# Maintainer: Zachary Huff <zach.huff.386@gmail.com>

pkgname=dashcam
pkgver=0.1.0
pkgrel=1
pkgdesc="C/Python dashcam built with Gstreamer for Raspberry Pi/BeagleBone Black"
arch=("any")
license=("GPL3")
url="https://github.com/zachhuff386/${pkgname}"
depends=(
    "python2"
    "gstreamer"
    "gst-libav"
    "gst-plugins-base"
    "gst-plugins-base-libs"
    "gst-plugins-good"
    "gst-plugins-bad"
)
makedepends=(
    "python2-distribute"
    "git"
)
optdepends=(
    "python2-pygame: Starting sound support"
    "python2-raspberry-gpio: Raspberry Pi LED support"
    "python2-bbio: BeagleBone Black LED support"
)
provides=("dashcam")
conflicts=("dashcam")
source=("git+${url}.git")
sha256sums=("SKIP")
backup=("etc/dashcam.conf")

build() {
  cd "${srcdir}/${pkgname}"
  git checkout $pkgver
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
