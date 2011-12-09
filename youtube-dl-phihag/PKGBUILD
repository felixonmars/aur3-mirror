# Maintainer: Austin <doorknob60@gmail.com>

pkgname=youtube-dl-phihag
pkgver=2011.09.18c
pkgrel=1
pkgdesc="Phihag's fork of youtube-dl, a downloader for video hosting sites such as Youtube, with some extra patches and features"
arch=('any')
url="https://github.com/phihag/youtube-dl"
license=('custom:public domain')
depends=('python2')
conflicts=('youtube-dl')
provides=('youtube-dl')
source=('youtube-dl.tar.gz::https://github.com/phihag/youtube-dl/tarball/master')
md5sums=('f6be0fe0d49ff3e55405a8313a388bd2')

package() {
  cd "$srcdir/phihag-youtube-dl-efb113c"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' youtube-dl
  install -D -m755 youtube-dl "${pkgdir}/usr/bin/youtube-dl"
}
