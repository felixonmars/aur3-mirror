# Contributor: zhuravlik <ahmad200512@pochta.ru>
# Original Contributor: Alex Zinchenko mng123 @ gmail.com
pkgname=freedcpp-svn-zhur
pkgver=159
pkgrel=1
_mediapackver=0.0.3
pkgdesc="Advanced DC++ client based on LinuxDC++ source with exec patch"
arch=('i686' 'x86_64')
url="http://code.google.com/p/freedcpp/"
license=('GPL')
depends=('boost' 'bzip2' 'gtk2>=2.0' 'libglade' 'libgnome>=2.0' 'libnotify>=0.4.1' 'openssl')
makedepends=('pkgconfig' 'subversion' 'scons')
provides=(freedcpp)
conflicts=('linuxdcpp' 'linuxdcpp-bzr' 'linuxdcpp-bzr-i18n')
source=("http://freedcpp.googlecode.com/files/mediapack.$_mediapackver.tar.bz2" example-theme.tar.bz2 dcexec.patch)
md5sums=('c4383ec870c55e816d1274c1468c2e32' '91ab046720f831b35be9b16e4c9eb4b6' 'ce65e64ba84b3f837e5a36bd9b1b7859')

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

	cd "$srcdir"
	patch -Np1 -i dcexec.patch

    cd "$srcdir/$_svnmod"
    # Generating build system
    scons PREFIX=/usr LIBDIR=/usr/share || return 1
    scons PREFIX=/usr LIBDIR=/usr/share install FAKE_ROOT=$startdir/pkg || return 1
    scons DESTDIR=${pkgdir} install || return 1

    cp -R ${srcdir}/mediapack/emoticons  ${pkgdir}/usr/share/freedcpp/
    cp -R ${srcdir}/mediapack/sounds     ${pkgdir}/usr/share/freedcpp/
    cp -R ${srcdir}/example-theme/themes ${pkgdir}/usr/share/freedcpp/
}
