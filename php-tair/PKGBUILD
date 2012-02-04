pkgname=php-tair
pkgver=2
pkgrel=1
pkgdesc="tair client for php"
arch=('i686' 'x86_64')
url="http://code.google.com/p/php-tair/"
license=('MIT')
depends=('php' 'taobao-tair-svn')
makedepends=('subversion' 'php' 'taobao-tair-svn')
source=()

md5sums=()
backup=()

_svnmod='php-tair-svn'
_svntrunk="http://php-tair.googlecode.com/svn/trunk/"

build()
{
    cd "$srcdir/"
    msg "Getting source..."
    if [ -d "$_svnmod/.svn" ] ; then
        cd "$_svnmod" && svn --config-dir ../ -r $pkgver up
    else
        svn --config-dir ./ -r $pkgver co "$_svntrunk" "$_svnmod"
    fi

    LDFLAGS=""

    msg "SVN checkout done or server timeout"
    msg "Creating make environment..."
    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

    msg "Starting make..."

    cd "$srcdir/$_svnmod-build"
    phpize
    ./configure --prefix=/usr || return 1
    make || return 1
    make INSTALL_ROOT=$pkgdir install || return 1
    echo "extension=tair.so" > tair.ini
    grep tair $srcdir/$_svnmod-build/tmp-php.ini >> tair.ini
    install -Dm644 tair.ini $pkgdir/etc/php/conf.d/tair.ini
}
