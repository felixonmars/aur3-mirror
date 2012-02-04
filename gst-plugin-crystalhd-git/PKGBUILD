# Contributors: Evilandi666 <evilandi.aur(at)googlemail.com>
pkgname=gst-plugin-crystalhd-git
pkgver=20120115
pkgrel=1
pkgdesc="Broadcom Crystal HD GST Plugin (Totem for instance) from git.wilsonet.com"
arch=('i686' 'x86_64')
url="http://git.linuxtv.org/jarod/crystalhd.git"
license=('GPL2')
depends=('libcrystalhd-git' 'gstreamer0.10-base')
makedepends=('make' 'autogen' 'git')
options=(!libtool)
_gitroot='git://git.linuxtv.org/jarod/crystalhd.git'
_gitname='crystalhd'

build() {

    cd $startdir/src

    msg "Connecting to git.wilsonet.com GIT server...."

    if [ -d $startdir/src/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
        cd $_gitname
    fi

    cd filters/gst/gst-plugin/

    ./autogen.sh --prefix=/usr
    make || return 1
    make install DESTDIR=$pkgdir || return 1
}
