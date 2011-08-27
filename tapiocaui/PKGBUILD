# Maintainer: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=tapiocaui
pkgver=0.3.9.1
pkgrel=3
pkgdesc="A GTK+ based GoogleTalk client."
arch=('i686' 'x86_64')
url="http://tapioca-voip.sourceforge.net"
license=('LGPL')
depends=('tapioca-xmpp' 'gconf' 'libglade' 'gstreamer0.10-farsight' 'farsight')
source=(http://dl.sourceforge.net/sourceforge/tapioca-voip/$pkgname-$pkgver.tar.gz
        tapiocaui_mainwin.c.patch
        tapiocaui_shell_media.c.patch)
md5sums=('2b0fc6997e793784763fe23c81a4986f' 'c89c5a73803031b7d1163c36e5f21fdb'\
         'a6d6cc671c3239ec2a9da765b471612c')

build() {
    cd $startdir/src/$pkgname-$pkgver

    # Apply patches to fix compiler warnings and to work with new farsight
    patch -p1 < ../tapiocaui_mainwin.c.patch
    patch -p1 < ../tapiocaui_shell_media.c.patch

    sed -i -e 's| -Werror||g' configure
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install
}
