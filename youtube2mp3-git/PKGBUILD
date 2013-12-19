# Maintainer: Patryk Rzucidlo (@PTKDev) <ptkdev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=youtube2mp3-git
_gitname="youtube2mp3"
pkgver=20131218
pkgrel=1
pkgver=20131218
pkgrel=1
pkgdesc="A simple system to convert YouTube music videos to MP3"
arch=('any')
url="https://github.com/emres/youtube2mp3"
license=('GPL3')
makedepends=('git')
conflicts=('youtube2mp3')
depends=('ffmpeg' 'lame' 'youtube-dl' 'zenity')
source=(git+https://github.com/emres/youtube2mp3)
md5sums=('SKIP')
package() {
         cd "$srcdir/$_gitname"
	install -d -m 755 "$pkgdir"/usr/bin
	install -d -m 755 "$pkgdir"/usr/share/{applications,pixmaps}

	cd "$srcdir"/${_gitname}

	install -m 755 youtube2mp3.sh "$pkgdir"/usr/bin/youtube2mp3
	install -m 644 YouTube\ Downloader.desktop "$pkgdir"/usr/share/applications/
	install -m 644 img/youtube.png "$pkgdir"/usr/share/pixmaps/
}

pkgver() {
  date +%Y%m%d
}
