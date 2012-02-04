# Maintainer: Scott Garrett <wintervenom@gmail.com>

pkgname=gst-spectrumdump
pkgver=20111005
pkgrel=1
pkgdesc="Dumps, scales, and amplifies spectrum magnitudes from audio input to stdout/callback."
arch=('any')
url="http://github.com/Wintervenom/gst-spectrumdump"
depends=('python2' 'gstreamer0.10-python' 'gstreamer0.10-good' 'pygobject')
license=('GPL3')
optdepends=('python-gconf')

_gitroot='git://github.com/Wintervenom/gst-spectrumdump.git'
_gitname='gst-spectrumdump'

build() {
    cd "$srcdir"
    msg 'Connecting to GIT server...'
    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg 'The local files are updated.'
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg 'GIT checkout done or server timeout.'
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
