# $Id:$
# Contributor: Ameysh <trader9@gmail.com>
# Maintainer: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)

pkgname=qtstalker-cvs
_realname=${pkgname%-*}
pkgver=20110929
pkgrel=1
pkgdesc="Commodity/Stock Charting and Technical Analysis Platform"
arch=('i686' 'x86_64')
url=http://qtstalker.sourceforge.net/
license=('GPL')
depends=('qt>=4.6.0' 'qwt5>=5.2.2' 'ta-lib-svn>=1542')
optdepends=('perl-libwww: for updation of quote/other data')
conflicts=('qtstalker<=0.36' 'qtstalker-qt4')
replaces=('qtstalker<=0.36' 'qtstalker-qt4')
provides=(${_realname})
changelog='ChangeLog'

_cvsroot=":pserver:anonymous@${_realname}.cvs.sourceforge.net:/cvsroot/${_realname}"
_cvsmod=${_realname}

source=('PKGBUILD.local' 'QtStalkerScript.cpp.patch' 'qtstalker.desktop')

# Include local code, huh
if [ -x PKGBUILD.local ]; then
    . ./PKGBUILD.local
fi

build() {
    msg "Connecting to ${_cvsroot#*@} CVS server..."
    cd "$srcdir"
    if [ -d ${_cvsmod}-cvs/CVS ]; then
	(cd ${_cvsmod}-cvs && cvs -z3 update -d)
    else
	cvs -z3 -d ${_cvsroot} co -d ${_cvsmod}-cvs ${_cvsmod}
    fi
    msg "CVS checkout done or server timeout"

    msg "Preparing builddir..."
    rsync -av --delete --exclude 'CVS' --exclude '.cvs*' $srcdir/${_cvsmod}-cvs/ $srcdir/${_realname}-build
    cd $srcdir/${_realname}-build || return $?

    msg "Running ./configure..."
    sed 's|/usr/local|/usr|' -i ${_realname}.config
    if [ -f /etc/arch-release ]; then
	sed 's|lqwt$|lqwt5|' -i ${_realname}.pro
	echo "INCLUDEPATH += /usr/include/qwt5" >>${_realname}.config
    fi
    patch -p0 -i $srcdir/QtStalkerScript.cpp.patch
    ./configure || return $?

    msg "Starting make all install..."
    make || return $?
    make INSTALL_ROOT=$pkgdir install || return $?

    msg "Making it nice..."
    mkdir -p $pkgdir/usr/share/applications
    install -m 644 ../../${_realname}.desktop $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps
    install -m 644 pics/${_realname}.xpm $pkgdir/usr/share/pixmaps
    rm -f $pkgdir/usr/share/doc/qtstalker/COPYING
}

# vim:set ts=4 sw=4 et:
md5sums=('728f6a98a8a4b3eb67e72ead618495c5'
         '9c7cbdc73c93c3c2b33627874882b034'
         'ba0af5c39ccefd8bb3479fbc9c5f6322')
