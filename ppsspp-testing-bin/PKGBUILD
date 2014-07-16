# Maintainer: uberushaximus <uberushaximus AT gmail DOT com>
# Contributor: Thiago Kenji Okada <thiago DOT mast3r AT gmail DOT com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=ppsspp-testing-bin
pkgver=v0.9.8.1526.gda32e5d
pkgrel=1
pkgdesc="A PSP emulator for Android, Windows, Mac, and Linux, written in C++. (binary testing version)"
arch=(i686 x86_64)
url="http://www.ppsspp.org"
license=(custom GPL2)
depends=(zlib sdl ffmpeg glu)
makedepends=(setconf)
conflicts=(ppsspp)
provides=(ppsspp)

source=("https://raw.githubusercontent.com/hrydgard/ppsspp/master/LICENSE.TXT"
    "https://raw.githubusercontent.com/hrydgard/ppsspp/master/assets/icon.svg"
    "https://raw.githubusercontent.com/hrydgard/ppsspp/master/Qt/PPSSPP.desktop"
    "ppsspp-sdl.sh")

if [[ $CARCH = "i686" ]]; then
    _pkgver=$(curl -s "http://ppsspp.angelxwind.net/builds/Linux-Generic/i386/Karen_angelXwind/Version.txt")
    source+=("http://ppsspp.angelxwind.net/builds/Linux-Generic/i386/karenbuildbot-net.angelxwind.ppsspp-testing-linux-i386-generic.tar.gz")
else
    _pkgver=$(curl -s "http://ppsspp.angelxwind.net/builds/Linux-Generic/amd64/Karen_angelXwind/Version.txt")
    source+=("http://ppsspp.angelxwind.net/builds/Linux-Generic/amd64/karenbuildbot-net.angelxwind.ppsspp-testing-linux-amd64-generic.tar.gz")
fi

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '81fdecc5efd17694d257d224f5ed1b5ebc10798590e644105f60d6ef885e78a9'
            'SKIP')

pkgver() {
    echo "$_pkgver" | sed 's/-/./g'
}

package() {
    cd "$srcdir"
    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
    install -Dm644 icon.svg "$pkgdir/usr/share/icons/ppsspp.svg"
    install -Dm644 PPSSPP.desktop "$pkgdir/usr/share/applications/PPSSPP.desktop"
    setconf "$pkgdir/usr/share/applications/PPSSPP.desktop" Exec /usr/bin/ppsspp-sdl
    setconf "$pkgdir/usr/share/applications/PPSSPP.desktop" Icon /usr/share/icons/ppsspp.svg
    install -Dm755 ppsspp-sdl.sh "$pkgdir/usr/bin/ppsspp-sdl"
    install -Dm755 PPSSPPSDL "$pkgdir/usr/share/ppsspp/PPSSPPSDL"
    cd assets
    find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/ppsspp/assets/"{} \;
}
