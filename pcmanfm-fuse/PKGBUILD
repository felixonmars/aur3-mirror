# Contributor: Chris Bannister <c.bannister@gmail.com>

pkgname=pcmanfm-fuse
pkgver=770
pkgrel=4
pkgdesc="A fast and light file manager with remote file system mounting support."
arch=(i686 x86_64)
url="http://pcmanfm.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'glib2' 'startup-notification' 'hal' 'dbus' 'fuse' 'intltool' 'gamin' 'sshfs' 'curlftpfs' 'smbnetfs')
makedepends=('subversion' 'gcc' 'automake')
conflicts=('pcmanfm')
optdepends=('fusesmb: to mount samba shares')
source=()
md5sums=()

_svntrunk=https://pcmanfm.svn.sourceforge.net/svnroot/pcmanfm/branches/fuse/
_svnmod=pcmanfm

build() {
    cd $startdir/src

    if [ -d $_svnmod/.svn ]; then
        cd $_svnmod
        svn up
        cd ../
    else
        svn co $_svntrunk $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make ..."

    rm -rf "${_svnmod}-build"
    cp -r "${_svnmod}" "${_svnmod}-build"
    cd "${_svnmod}-build"

    pwd

    ./autogen.sh
    ./configure --prefix=/usr --enable-hal --disable-desktop-integration

    make || return 1
    make DESTDIR=$startdir/pkg install
}
