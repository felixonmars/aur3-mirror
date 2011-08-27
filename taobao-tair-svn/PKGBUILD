pkgname=taobao-tair-svn
pkgver=28
pkgrel=1
pkgdesc="Tair is a distributed, high performance key/value storage system"
arch=('i686' 'x86_64')
url="http://code.taobao.org/project/view/2/"
license=('GPLv2')
depends=('tb-common-utils-svn')
makedepends=('subversion' 'boost' 'automake' 'autoconf' 'gcc' 'make')
source=('config_server.rc' 'data_server.rc')

md5sums=('617d294751756eaa29edfce500125197'
 '0c0445a77d4b54b0f1e25ae5e69d68b2')

backup=('usr/local/tair/etc/configserver.conf'
 'usr/local/tair/etc/dataserver.conf'
 'usr/local/tair/etc/group.conf')

_svnmod='taobao-tair-svn'
_svntrunk="http://code.taobao.org/svn/tair/trunk/"

build()
{
    cd "$srcdir/"
    msg "Getting source..."
    if [ -d "$_svnmod/.svn" ] ; then
        cd "$_svnmod" && svn --config-dir ../ -r $pkgver up
    else
        svn --config-dir ./ -r $pkgver co "$_svntrunk" "$_svnmod"
    fi

    msg "SVN checkout done or server timeout"
    msg "Creating make environment..."
    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

    msg "Starting make..."

    cd "$srcdir/$_svnmod-build"

    #bash exit 1

    export TBLIB_ROOT=/usr
    ./bootstrap.sh
    ./configure --prefix=/usr/local/tair

    make &&
    make DESTDIR=$pkgdir install

    mkdir -p $pkgdir/etc/rc.d
    cp $startdir/config_server.rc $pkgdir/etc/rc.d/tair_cs
    cp $startdir/data_server.rc $pkgdir/etc/rc.d/tair_ds
    chmod +x $pkgdir/etc/rc.d/tair_cs
    chmod +x $pkgdir/etc/rc.d/tair_ds

    mkdir -p $pkgdir/usr/local/tair/{logs,fdb,data}

    rm -rf "$srcdir/$_svnmod-build"
}
