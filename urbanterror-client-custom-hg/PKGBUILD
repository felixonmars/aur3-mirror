# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=urbanterror-client-custom-hg
pkgver=90
pkgrel=1
pkgdesc="Urban Terror (client only, custom build with improved scripting)"
arch=(i686 x86_64)
url="http://www.urbanterror.info"
license=(GPL2)
depends=(sdl openal curl libjpeg lua urbanterror-data)
makedepends=(unzip mercurial cmake)
conflicts=(urbanterror urbanterror-client)

_hgroot="https://bitbucket.org/mickael9"
_hgrepo="ioq3-urt-custom"

source=(urbanterror.sh urbanterror.desktop urbanterror.png)

build() {
    cd "$srcdir"
    msg "Connecting to Mercurial server...."

    if [ -d $_hgrepo ] ; then
        cd $_hgrepo
        hg pull -u || return 1
        msg "The local files are updated."
    else
        hg clone $_hgroot/$_hgrepo || return 1
    fi

    msg "Mercurial checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_hgrepo-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"
    
	## prepare folder
	install -d "$pkgdir/opt/urbanterror/"

    mkdir -p build && cd build
    cmake .. -DBUILD_CLIENT=1 -DBUILD_SERVER=0 || return 1
	make || return 1

    install -m755 -s ioq3urt-client "$pkgdir/opt/urbanterror/"

	## desktop launcher
	install -Dm644 "$srcdir/urbanterror.desktop" "$pkgdir/usr/share/applications/urbanterror.desktop"
	install -Dm644 "$srcdir/urbanterror.png" "$pkgdir/usr/share/pixmaps/urbanterror.png"

	## launch scripts
	install -Dm755 "$srcdir/urbanterror.sh" "$pkgdir/usr/bin/urbanterror"
}

md5sums=('503483fcf54a9a315d74fd709bfdaafc'
         '703aa5578a938e0240e54af2ce7a6668'
         'f9a57d898df73f43c6a85c8d8cc455ba')
