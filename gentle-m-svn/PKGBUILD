# Maintainer: Jens Staal <staal1978@gmail.com>
pkgname=gentle-m-svn
pkgver=1.9.4
pkgrel=1
pkgdesc="a software for DNA and amino acid editing and much more."
arch=('i686' 'x86_64')
url="http://gentle.magnusmanske.de/"
license=('gpl')
depends=("wxgtk" "sqlite2" "sqlite3" "libmysqlclient" "tinyxml")
makedepends=('subversion' 'automake')


build() {

    svn co https://gentle-m.svn.sourceforge.net/svnroot/gentle-m gentle-m

    rm -rf $srcdir/GENtle # starting fresh every time
    cp -ar $srcdir/gentle-m/trunk $srcdir/GENtle # most recent branch
#   cp -ar $srcdir/gentle-m/tags/start $srcdir/GENtle # an older branch	
#   cp -ar $srcdir/gentle-m/branches/vendor $srcdir/GENtle # an older branch

    alias aclocal-1.9='/usr/bin/aclocal'
    cd $srcdir/GENtle
    ./autogen.sh
    ./configure LDFLAGS='-L/usr/lib/mysql'
    make -j2 -I/usr/include/wx-2.8/wx
    make DESTDIR=$pkgdir install
}
