# $Id:$
# Contributor: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)
# Maintainer: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)

pkgname=qtstalker-qt4
_dstname=qtstalker-qt4-branch
_realname=qtstalker
pkgver=0.37.8
pkgrel=2
pkgdesc="Commodity/Stock Charting and Technical Analysis Platform"
arch=('i686' 'x86_64')
url=http://qtstalker.sourceforge.net/
license=('GPL')
depends=('db4.8>=4.8.0' 'qt>=4.5.0' 'ta-lib-svn>=1542')
conflicts=('qtstalker<=0.36' 'qtstalker-cvs')
provides=(${_realname})
changelog='ChangeLog'
source=(http://anu.homelinux.net/pub/Linux/ports/distfiles/${_dstname}.tar.bz2)

build() {
    msg "Patching source..."
    cd "$srcdir/${_dstname}"
    msg2 "Applying patch 'debian/01_qtstalker.cfg.patch'"
    patch -sp1 < debian/patches/01_qtstalker.cfg.patch
    sed -e 's|^# INCLUDEPATH.*|INCLUDEPATH += /usr/include/db4.8|' -i qtstalker.cfg

    msg "Running ./configure..."
    ./configure || return $?

    msg "Starting make all install..."
    make || return $?
    make INSTALL_ROOT=$pkgdir install || return $?

    msg "Making it nice..."
    find ./misc/CUS_examples -type f |sed 's/^\.\///' |while read file; do
	install -D -m 0644 $file $pkgdir/usr/share/doc/${_realname}/html/$file
    done
    find $pkgdir/usr/share/${_realname}/indicator -type f |sed "s|/${_realname}/indicator|/doc/${_realname}/html/misc/CUS_examples|" |while read file; do
	rm $file
    done
    install -D -m 0664 debian/${_realname}.1 $pkgdir/usr/share/man/man1/$pkgname.1
    install -D -m 0664 debian/${_realname}.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -D -m 0664 pics/${_realname}.xpm $pkgdir/usr/share/pixmaps/${_realname}.xpm
}

# vim:set ts=4 sw=4 et:
md5sums=('eb1e6cc49f069aed74f3524114e1224f')
