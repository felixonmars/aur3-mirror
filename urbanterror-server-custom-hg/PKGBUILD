# Contributor: mickael9 <mickael9 at gmail dot com>
# Original contributor: Gereon Schomber
# Original PKGBUILD by grimi <grimi@poczta.fm>

pkgname=urbanterror-server-custom-hg
pkgver=90
pkgrel=1
pkgdesc="Urban Terror (server only, custom build with improved scripting)"
arch=(i686 x86_64)
url="http://www.urbanterror.info"
license=(GPL2)
depends=(urbanterror-data lua zlib)
makedepends=(unzip mercurial cmake)
conflicts=(urbanterror urbanterror-server)

_hgroot="https://bitbucket.org/mickael9"
_hgrepo="ioq3-urt-custom"

source=(urbanterror-server.sh)

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

	## compile client
    mkdir -p build && cd build
    cmake .. -DBUILD_CLIENT=0 -DBUILD_SERVER=1 || return 1
    make || return 1
	
	install -m755 -s ioq3urt-server "$pkgdir/opt/urbanterror/"

	## launch scripts
	install -Dm755 "$srcdir/urbanterror-server.sh" "$pkgdir/usr/bin/urbanterror-server"
}
md5sums=('34de0394ecd6cea490b59eecac75238d')
