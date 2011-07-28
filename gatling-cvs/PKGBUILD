pkgname=gatling-cvs
pkgver=20110728
pkgrel=1
pkgdesc="a http, ftp and smb server"
arch=('i686' 'x86_64')
url=http://www.fefe.de/gatling/
license=(GPL)
conflicts=(gatling)
depends=(openssl)
makedepends=('dietlibc' 'libowfat>=0.28' 'cvs')
source=()
md5sums=()

_cvsroot=":pserver:cvs@cvs.fefe.de:/cvs"
_cvsmod="gatling"

build() {
    cd "$srcdir"
    msg "Connecting to cvs.fefe.de CVS server...."
    if [ -d "$_cvsmod/CVS" ]; then
        cd "$_cvsmod"
        cvs -z3 update -d
    else
        cvs -z3 -d "$_cvsroot" co -D "$pkgver" -f "$_cvsmod"
        cd "$_cvsmod"
    fi

    msg "CVS checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_cvsmod-build"
    cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
    cd "$srcdir/$_cvsmod-build"

    sed -i '0,/\/man/s//\/share\/man/' GNUmakefile
    make DIET=/opt/diet/bin/diet
}

package() {
      cd "$srcdir/$_cvsmod-build"
      make prefix=$pkgdir/usr install
}
