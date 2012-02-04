pkgname=devtodo-svn
pkgver=491
pkgrel=1
pkgdesc="DevTodo is small command line application for maintaining lists of tasks. It stores tasks hierarchically, with each task given one of five priority levels. Data is stored as XML, so various XSLT templates can be executed on the XML to convert it into different formats (eg. HTML)."
url="http://swapoff.org/DevTodo"
arch=('i686' 'x86_64')
depends=('glibc' 'ncurses' 'readline')
backup=('etc/todorc')
license=('GPL')
source=(gcc4.3.0_fix.diff)
md5sums=('1d8bb758be5410dfc13202dd7a2463e9')

_svntrunk="http://swapoff.org/svn/todo/trunk"
_svnmod="devtodo"

build() {
    cd $startdir/src/
 
    svn co $_svntrunk $_svnmod
    msg "SVN checkout done or server timeout"
  
    cd "$srcdir/$_svnmod"
    
    msg2 "Applying GCC 4.3 compatibility patch..."
    patch -p0 < $startdir/gcc4.3.0_fix.diff || return 1
    
    msg2 "autogen.sh..."
    ./autogen.sh --prefix=/usr --sysconfdir=/etc || return 1
    ./autogen.sh --prefix=/usr --sysconfdir=/etc || return 1
    
    msg2 "configure..."
    ./configure --prefix=/usr --sysconfdir=/etc || return 1

    msg2 "make"
    make DESTDIR=$startdir/pkg install || return 1
}
