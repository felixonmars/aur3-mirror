# Maintainer: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/
pkgname=mplayerstart
pkgver=20130303
pkgrel=1
pkgdesc="Wrapper for mplayer which adds resumable playback, disables screensavers, restores volume levels, uses multiple displays"
arch=(any)
license=('GPL3')
url=("http://igurublog.wordpress.com/downloads/script-$pkgname/")
depends=('mplayer' 'zenity')
optdepends=('xdialog' 'kdebase-kdialog' 'alsa-lib')
license=('GPL3')
_gitroot="git://github.com/IgnorantGuru/$pkgname.git"
_gitname="$pkgname"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin master
        msg "The local files are updated."
    else
        git clone --depth 1 -b master $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    rm -rf "$srcdir/$_gitname/.git/shallow"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    echo
}

