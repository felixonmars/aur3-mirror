# Maintainer: Amar Sood <mail@tekacs.com>
pkgname=compute-image-packages
pkgver=1.2.5
pkgrel=2
pkgdesc="Scripts and tools for Google Compute Engine images."
arch=('any')
url="https://github.com/GoogleCloudPlatform/compute-image-packages"
license=('apache')
depends=('python2')
provides=('compute-image-packages')
source=(
  "https://github.com/GoogleCloudPlatform/compute-image-packages/releases/download/$pkgver/google-daemon-$pkgver.tar.gz"
  "https://github.com/GoogleCloudPlatform/compute-image-packages/releases/download/$pkgver/google-startup-scripts-$pkgver.tar.gz"
  "https://github.com/GoogleCloudPlatform/compute-image-packages/releases/download/$pkgver/gcimagebundle-$pkgver.tar.gz"
)
noextract=(
  "google-daemon-$pkgver.tar.gz"
  "google-startup-scripts-$pkgver.tar.gz"
  "gcimagebundle-$pkgver.tar.gz"
)
md5sums=('83c383457e4c675e315714190b65cdf9'
         'aa6babe08034334a174a16ffd2d53ae8'
         '9fd7c3d22d5b37d616aca7df622beb42')

build() {
  cd "$srcdir"
}

package() {
  mkdir -p "$pkgdir/usr/share/imagebundle"
  tar xvaf "$srcdir/gcimagebundle-$pkgver.tar.gz" -C "$pkgdir/usr/share/imagebundle"

  tar xvaf "$srcdir/google-startup-scripts-$pkgver.tar.gz" -C "$pkgdir/"
  tar xvaf "$srcdir/google-daemon-$pkgver.tar.gz" -C "$pkgdir/"

  rm "$pkgdir/README.md"
  cp -a "$pkgdir/lib/." "$pkgdir/usr/lib/"
  rm -fr "$pkgdir/lib"

  chmod -R g-w "$pkgdir"
}

