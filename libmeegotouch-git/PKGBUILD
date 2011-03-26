# Contributor: Bernhard Friedreich <friesoft@gmail.com>

pkgname=libmeegotouch-git
pkgver=20110123
pkgrel=1

pkgdesc="Qt based MeeGo Touch Framework for developing touch based user interfaces"
url="http://meego.gitorious.org/meegotouch/libmeegotouch"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('qt>=4.7' 'meegotouch-theme-git' 'gstreamer0.10' 'gstreamer0.10-base' 'gstreamer0.10-base-plugins' 'dbus' 'libxdamage' 'libx11' 'gconf')
makedepends=('git')

provides=( "libmeegotouch-git=${pkgver}" "libmeegotouch=${pkgver}" 'libdui-git' 'libdui')
conflicts=( "libmeegotouch" 'libdui')

install=('libmeegotouch-git.install')

_gitroot="git://gitorious.org/meegotouch/libmeegotouch.git"
_gitname="libmeegotouch-git"

source=('mthemedaemon.desktop')
md5sums=('579998ef26f24fe76f5dc68913998f25')

build() {
    # Export the include dir
    export QTDIR="/usr"
    export INCLUDE="/usr/include"

    msg "Connecting to the GIT server..."
    if [ -d ${_gitname}/.git ]; then
        cd ${_gitname}
        git reset --hard HEAD
        git pull origin
    else
        git clone ${_gitroot} ${_gitname}
        cd ${_gitname}
    fi

    #patch -Np1 -i ${srcdir}/.patch

    ./configure -prefix /usr \
                -libdir /usr/lib \
                -plainqt \
                -release
    make || return 1
    
    export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1
    make INSTALL_ROOT=$pkgdir install || return 1

    mkdir -p $pkgdir/etc/profile.d
    echo "export M_DECORATED=0" > ${pkgdir}/etc/profile.d/libmeegotouch.sh

    mkdir -p ${pkgdir}/etc/xdg/autostart
    cp ${srcdir}/mthemedaemon.desktop ${pkgdir}/etc/xdg/autostart

    # Fix rpmlint errors - some header files have invalid permissions
    chmod 644 ${pkgdir}/usr/include/meegotouch/mrichtexteditstyle.h
    chmod 644 ${pkgdir}/usr/include/meegotouch/mrichtextedit.h

    # Create the mthemedaemon cache directory
    mkdir -p ${pkgdir}/var/cache/meegotouch

    # Remove known zero-length files
    rm -f ${pkgdir}/usr/share/animatedlayout/themes/animatedlayout.conf
    rm -f ${pkgdir}/usr/share/themes/base/meegotouch/widgetsgallery/feedbacks/press-babytoy/vibra.ivt
    rm -f ${pkgdir}/usr/share/themes/base/meegotouch/widgetsgallery/feedbacks/release-space/vibra.ivt
    rm -f ${pkgdir}/usr/share/themes/base/meegotouch/widgetsgallery/widgetsgallery.conf
    rm -f ${pkgdir}/usr/share/themes/base/meegotouch/widgetsgallery/feedbacks/press-space/vibra.ivt
    rm -f ${pkgdir}/usr/share/themes/base/meegotouch/widgetsgallery/feedbacks/release-babytoy/vibra.ivt

    # Remove unpackaged files
    rm -f ${pkgdir}/usr/share/l10n/meegotouch/libmeegotouch.qm
    rm -f ${pkgdir}/usr/share/l10n/meegotouch/animatedlayout.qm
    rm -f ${pkgdir}/usr/share/l10n/meegotouch/widgetsgallery.qm

    # Copy examples, tests, benchmarks to /usr/share/doc/meegotouch
    mkdir -p ${pkgdir}/usr/share/doc/meegotouch
    cp -R ${srcdir}/${_gitname}/demos ${pkgdir}/usr/share/doc/meegotouch/demos
    cp -R ${srcdir}/${_gitname}/examples ${pkgdir}/usr/share/doc/meegotouch/examples
    cp -R ${srcdir}/${_gitname}/tests ${pkgdir}/usr/share/doc/meegotouch/tests
    cp -R ${srcdir}/${_gitname}/benchmarks ${pkgdir}/usr/share/doc/meegotouch/benchmarks
}
