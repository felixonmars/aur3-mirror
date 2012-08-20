# Maintainer: Ilya Voronin <ivoronin@gmail.com>
pkgname=sshm
pkgver=0.4.3
pkgrel=1
pkgdesc='A little command-line tool to manage your ssh servers'
arch=('i686' 'x86_64')
url=http://sourceforge.net/projects/sshm/
license=GPL2
depends=openssh
options=('strip')
source=('http://sourceforge.net/projects/sshm/files/sshm/0.4.3/sshm-0.4.3.tar.gz')
md5sums=('f7edc73952bfe3d1e1092f6dd117df73')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -D man/sshm.1 "$pkgdir/usr/share/man/man1/sshm.1"
}
