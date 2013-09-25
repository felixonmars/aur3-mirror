# Contributor: Alex Zinchenko mng123 @ gmail.com
pkgname=freedcpp-svn
pkgver=211
pkgrel=1
pkgdesc="DC + + client based on the source code LinuxDC + +."
arch=('i686' 'x86_64')
url="http://code.google.com/p/freedcpp/"
license=('GPL')
depends=('boost' 'bzip2' 'gtk2>=2.0' 'libglade' 'libgnome>=2.0' 'libnotify>=0.4.1' 'openssl' 'miniupnpc')
makedepends=('pkgconfig' 'subversion' 'scons')
provides=(freedcpp)
conflicts=('linuxdcpp' 'linuxdcpp-bzr' 'linuxdcpp-bzr-i18n')
source=(http://freedcpp.googlecode.com/files/mediapack.0.0.3.tar.bz2 
	example-theme.tar.bz2)
md5sums=('c4383ec870c55e816d1274c1468c2e32' 
	 '91ab046720f831b35be9b16e4c9eb4b6')

_svnmod="freedcpp"
_svntrunk="http://freedcpp.googlecode.com/svn/trunk/"

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
    msg "Starting make..."

    cd "$srcdir/$_svnmod"
    # Generating build system
    scons PREFIX=/usr LIBDIR=/usr/share || return 1
    scons PREFIX=/usr LIBDIR=/usr/share install FAKE_ROOT=${pkgdir} || return 1
    scons DESTDIR=${pkgdir} install || return 1

    cp -R ${srcdir}/mediapack/emoticons  ${pkgdir}/usr/share/freedcpp/
    cp -R ${srcdir}/mediapack/sounds     ${pkgdir}/usr/share/freedcpp/
    cp -R ${srcdir}/example-theme/themes ${pkgdir}/usr/share/freedcpp/
}
