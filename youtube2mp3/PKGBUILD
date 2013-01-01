# Maintainer: Patryk Rzucidlo (@PTKDev) <ptkdev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=youtube2mp3
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple system to convert YouTube music videos to MP3"
arch=('any')
url="https://github.com/ur6lad/youtube2mp3"
license=('GPL3')
depends=('ffmpeg' 'lame' 'youtube-dl' 'zenity')
source=(http://github.com/ur6lad/${pkgname}/archive/${pkgver}.tar.gz)
changelog=${pkgname}.ChangeLog.markdown

package() {
	install -d -m 755 "$pkgdir"/usr/bin
	install -d -m 755 "$pkgdir"/usr/share/{applications,pixmaps}

	cd "$srcdir"/${pkgname}-${pkgver}

	install -m 755 youtube2mp3.sh "$pkgdir"/usr/bin/youtube2mp3
	install -m 644 YouTube\ Downloader.desktop "$pkgdir"/usr/share/applications/
	install -m 644 img/youtube.png "$pkgdir"/usr/share/pixmaps/
}

md5sums=('daac38dc66b3a6d4e3bf3c637a146a8c')
sha256sums=('01402bb8f687b73691f884de387acb47c297d7d4a877bab8d9dc7314ac58db7f')
