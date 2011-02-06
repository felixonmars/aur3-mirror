# Maintainer: Jeremy Hughes <jedahu@gmail.com>
pkgname=s3backer-svn
pkgver=436
pkgrel=1
pkgdesc="s3 single file backing store"
arch=(i686 x86_64)
url=http://code.google.com/p/s3backer
license=(GPL)
depends=(curl fuse openssl zlib expat pkg-config)
makedepends=(subversion)
provides=(s3backer)
replaces=(s3backer)
md5sums=()

_svntrunk=http://s3backer.googlecode.com/svn/trunk/
_svnmod=s3backer

build() {
    cd "$srcdir"
    msg -n "Checking out $pkgver from svn..."
    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up) || return 1
    else
        svn co $_svntrunk --config-dir ./ $_svnmod || return 1
    fi
    msg "Starting build..."
    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    cd "$srcdir/$_svnmod-build"
    ./autogen.sh || return 1
    ./configure --prefix=/usr || return 1
    make || return 1
    make DESTDIR="$pkgdir/" install
}
