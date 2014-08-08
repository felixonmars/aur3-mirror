# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt do de>

pkgname=tpfanco-svn
pkgver=136
pkgrel=1
pkgdesc="Monitors temperatures and controls fan speed of IBM/Lenovo ThinkPad notebooks."
replaces=('tpfand')
provides=('tpfanco')
conflicts=('tpfanco' 'tpfand-no-hal' 'tpfand' 'tpfand-profiles' 'tpfan-admin')
depends=('systemd' 'python2-dmidecode-git' 'python2-dbus' 'pygtk' 'python2-rsvg' )
makedepends=('subversion')
arch=('i686' 'x86_64')
license=('GPL')
url="http://code.google.com/p/tpfanco"
install=tpfand.install
backup=('etc/tpfand.conf')
# source=(tpfand.DAEMON tpfand.PMUTILS tpfand.service pod-utf8.patch sbin-bin.patch)
source=(sbin-bin.patch)

_svntrunk='http://tpfanco.googlecode.com/svn/trunk/'
_svnmod='tpfanco-read-only'

build() {
    cd $srcdir

    msg "Connecting to $_svntrunk..."
    if [ -d $_svnmod/.svn ]; then
	(cd $_svnmod && svn up -r $pkgver)
    else
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout, creating working copy..."
    rm -rf $srcdir/$_svnmod-build
    cp -r $_svnmod $_svnmod-build
    cd $srcdir/$_svnmod-build

    msg "Patching for python2 and Arch-specifics..."
    patch -p1 < $srcdir/sbin-bin.patch
#    patch -p0 < $srcdir/pod-utf8.patch

    msg "Starting tpfand make (only manual)..."
    cd $srcdir/$_svnmod-build/tpfand
    make man

    msg "Starting tpfan-admin make..."
    cd $srcdir/$_svnmod-build/tpfan-admin
    make all
}


package() {
    msg "Packaging tpfand..."
    cd $srcdir/$_svnmod-build/tpfand
    make DESTDIR=$pkgdir install-systemd
    install -d $pkgdir/usr/share/man/man8
    install -m644 tpfand.8 $pkgdir/usr/share/man/man8/tpfand.8
    install -d $pkgdir/usr/share/tpfand
    install -m644 etc/tpfand.conf $pkgdir/usr/share/tpfand/tpfand.conf.default

    msg "Packaging tpfan-admin..."
    cd $srcdir/$_svnmod-build/tpfan-admin
    make DESTDIR=$pkgdir install
    install -d $pkgdir/usr/share/man/man1
    install -d $pkgdir/usr/share/icons/hicolor/{scalable/apps,128x128/apps,22x22/apps,48x48/apps}
    install -m644 tpfan-admin.1 $pkgdir/usr/share/man/man1/tpfan-admin.1
    install -m644 art/fanicon.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/fanicon.svg
    install -m644 share/tpfan-admin-128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/tpfan-admin.png
    install -m644 share/tpfan-admin-22x22.png $pkgdir/usr/share/icons/hicolor/22x22/apps/tpfan-admin.png
    install -m644 share/tpfan-admin-48x48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/tpfan-admin.png

    msg "Packaging tpfand-profiles..."
    cd $srcdir/$_svnmod-build/tpfand-profiles
    make DESTDIR=$pkgdir install

    msg "Cleaning up superfluous files and directories..."
    rm -rf $pkgdir/etc/{acpi,init.d}

    msg "Packaging this system's /etc/tpfand.conf..."
    if [ -e /etc/tpfand.conf ] ; then
	install -m644 /etc/tpfand.conf $pkgdir/etc/tpfand.conf
    else
	install -m644 $srcdir/$_svnmod-build/tpfand/etc/tpfand.conf $pkgdir/etc/tpfand.conf
    fi
}

md5sums=('ad2ec7837581775f3c8f5bd5c28f3cba')
