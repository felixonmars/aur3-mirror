# Contributor: Mank@jabbim.cz
pkgname=freedcpp-mank
pkgver=82
pkgrel=1
pkgdesc="DC + + client based on the source code FreeDC + + with Ignore Users."
arch=('i686' 'x86_64')
url="http://mank.sytes.net"
license=('GPL')
depends=('boost' 'bzip2' 'gtk2>=2.0' 'libglade' 'libgnome>=2.0' 'libnotify>=0.4.1' 'openssl' 'lua')
makedepends=('pkgconfig' 'subversion' 'scons' 'gcc')
provides=(freedcpp-mank)
conflicts=('linuxdcpp' 'linuxdcpp-bzr' 'linuxdcpp-bzr-i18n')
source=(example-theme.tar.bz2 emoticons.tar.bz2)
md5sums=('8f8e75fea4f6f17a45d722246ab187a4'
         'f12e98ffa825e5a35f514ee85b841807')


_svnmod="freedcppmv"
_svntrunk="https://freedcppmv.svn.sourceforge.net/svnroot/freedcppmv/trunk/"

build() {
    cd ${srcdir}
    msg "Getting sources..."
    
    if [ -d ${_svnmod}/.svn ]; then
	(cd ${_svnmod} && svn up -r ${pkgver})
    else
	svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
	cd ${_svnmod}
    fi

    msg "SVN checkout done or server timeout"


    cd "$srcdir/$_svnmod"
    msg "Starting make..."				
    # Generating build system
    scons PREFIX=/usr LIBDIR=/usr/share || return 1
    scons PREFIX=/usr LIBDIR=/usr/share install FAKE_ROOT=$startdir/pkg || return 1
    scons DESTDIR=${pkgdir} install || return 1

     #cp -R ${srcdir}/mediapack/emoticons  ${pkgdir}/usr/share/freedcpp/
     #cp -R ${srcdir}/mediapack/sounds     ${pkgdir}/usr/share/freedcpp/
    cp -R ${srcdir}/themes ${pkgdir}/usr/share/freedcpp/
    cp -R ${srcdir}/emoticons ${pkgdir}/usr/share/freedcpp/	
}
