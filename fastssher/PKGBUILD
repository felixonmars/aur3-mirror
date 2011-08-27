# Contributor: Dmitry Kosenkov <junker at front dot ru>
# 

pkgname=fastssher
pkgver=0.2
pkgrel=1
pkgdesc="It provides fast connections to Linux/Unix hosts over SSH protocol. You don't need to remember the IP address, hostname, login, or password. Just select server from the list and press 'Connect'"
url="http://sourceforge.net/projects/fastssher/"
arch=('i686' 'x86_64')
license=('GPL-3')
makedepends=('perlxml intltool')
depends=('gtk2>=2.12 libglade>=2.2 gnome-keyring sshpass')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c89d90bfb47a3723c933abc5a7fe29a5')
build() {
cd $srcdir/${pkgname}-$pkgver
./configure --prefix=/usr
make || return 1
make DESTDIR=${pkgdir} install || return 1
}
