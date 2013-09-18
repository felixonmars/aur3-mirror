# Maintainer: Wolfgang Mueller <vehk@vehk.de>

pkgname=ytp-git
_realname=ytp
pkgver=b62b6b1
pkgrel=3
pkgdesc="A small wrapper around youtube-dl that plays videos in mplayer/mpv"
arch=('any')
url="https://github.com/vehk/yt"
license=('custom')
depends=('youtube-dl')
optdepends=(
    'mplayer: video playback'
    'mplayer2: video playback'
    'mpv: video playback'
)
makedepends=('git')
provides=($_realname)
conflicts=($_realname)
source=('git://github.com/vehk/yt.git')
md5sums=('SKIP')
_gitname="yt"

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --always | sed 's/-/./g'
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
