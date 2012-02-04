# Contributor: Erdem Cakir <1988er@gmail.com>
pkgname=youtube-zenity
pkgver=1
pkgrel=1
pkgdesc="A userfriendly YouTube Downloader powered by Zenity. (Converts to MP3 and MP4)"
arch=('i686' 'x86_32' 'x86_64')
url="http://live.gnome.org/Zenity"
license=('unknown')
depends=('zenity' 'youtube-dl' 'ffmpeg')
install=${pkgname}.install

build() {
    cd $srcdir

    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -Dm 644 ${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
    install -Dm 644 ${pkgname}.svg $pkgdir/usr/share/pixmaps/${pkgname}.svg
}
