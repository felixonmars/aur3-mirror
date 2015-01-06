# Maintainer: Ben Reedy <breed808 *AT* breed808 *DOT* com>
# Contributor: xylosper <darklin20@gmail.com>

_pkgbase=cmplayer

pkgname=cmplayer-git
pkgver=0.8.16.r62.g0aa1f90
pkgrel=1
pkgdesc="Powerful and easy-to-use multimedia player (git version)"
arch=('i686' 'x86_64')
url="http://$_pkgbase.github.io"
license=('GPL')
install=$_pkgbase.install
depends=('qt5-base' 'qt5-declarative' 'qt5-x11extras' 'qt5-quickcontrols' 'icu'
         'libdvdread' 'libcdio-paranoia' 'libcdio' 'libdvdnav' 'libquvi'
         'alsa-lib' 'libpulse' 'portaudio' 'jack' 'libchardet'
         'mpg123' 'libva' 'libgl' 'fribidi' 'libass' 'ffmpeg')
makedepends=('git' 'mesa' 'gcc' 'pkg-config' 'python')
provides=('cmplayer')
conflicts=('cmplayer')
source=(git+https://github.com/xylosper/${_pkgbase}.git
        git+https://github.com/xylosper/mpv.git)
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/$_pkgbase"
    git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g' | cut -c2-
}

prepare() {
    cd "$srcdir/$_pkgbase"
    git submodule init
    sed -i "s|https://github.com/xylosper/mpv.git|$srcdir/mpv|g" .gitmodules
    git submodule sync
    git submodule update
}

build() {
    cd "$srcdir/$_pkgbase/src/mpv" && python ./bootstrap.py
    cd "$srcdir/$_pkgbase"
    ./configure --prefix=/usr \
    --enable-jack \
    --enable-pulseaudio \
    --enable-cdda
    make
}

package() {
    cd "$srcdir/$_pkgbase"
    make DEST_DIR="$pkgdir" install
}
