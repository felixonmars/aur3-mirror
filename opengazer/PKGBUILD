# Contributor: Muhammad Qadri <Muhammad dot A dot Qadri at gmail dot com>
pkgname=opengazer
pkgver=0.1.2
pkgrel=1
pkgdesc="Application that uses an ordinary webcam to estimate the direction of your gaze."
arch=('i686')
url="http://www.inference.phy.cam.ac.uk/opengazer/"
license=('GPL2')
depends=('vxl' 'opencv>=0.97' 'gtkmm>=2.8.0' 'cairomm>=1.6.0' 'boost>=1.32.0')
options=()
install=$pkgname.install
source=("http://www.inference.phy.cam.ac.uk/opengazer/$pkgname-$pkgver.tar.gz"
        "opengazer.patch")
md5sums=('2c5d856850b20d030989893351374778'
         '74c89e2b61d500b7c718fab518aec636')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg "Applying patch"
  patch -p1 -i ../opengazer.patch

  msg 'Running make'
  make || return 1
}

package() {

  install -Dm755 $srcdir/$pkgname-$pkgver/opengazer $pkgdir/usr/bin/opengazer
  install -Dm644 $srcdir/$pkgname-$pkgver/haarcascade_frontalface_alt.xml $pkgdir/usr/share/$pkgname/haarcascade_frontalface_alt.xml
  install -Dm644 $srcdir/$pkgname-$pkgver/calpoints.txt $pkgdir/usr/share/$pkgname/calpoints.txt

}

# vim:set ts=2 sw=2 et:
