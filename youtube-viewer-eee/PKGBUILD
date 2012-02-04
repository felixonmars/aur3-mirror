# Maintainer: Trizen <trizen at go dot ro>

pkgname=youtube-viewer-eee
pkgver=2.2.19
pkgrel=1
pkgdesc="Search and play YouTube videos in MPlayer. (480p version)"
arch=('any')
url="http://trizen.go.ro"
license=('GPL')
depends=('mplayer' 'perl-libwww')
source=(http://trizen.go.ro/files/youtube-viewer-eee)
md5sums=('e1552da2eb7b9b876585666619310452')

build() {
  install -Dm 755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}
