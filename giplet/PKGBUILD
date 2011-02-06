# Contributor: uastasi  <uastasi@archlinux.us>
pkgname=giplet
pkgver=0.2.3
pkgrel=1
pkgdesc="A simple GNOME panel applet that displays your computer's ip address."
arch=('i686' 'x86_64')
url="http://giplet.sourceforge.net/"
license=('GPL')
depends=('python' 'gnome-python' 'gnome-python-desktop' 'gnome-python-extras' 'gnome-applets')
makedepends=('libglade')
install=giplet.install
source=(http://downloads.sourceforge.net/giplet/$pkgname-$pkgver.tar.gz)
md5sums=('5009cb10210a689bcf2958309c461ef3')

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
    }
