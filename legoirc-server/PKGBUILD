pkgname=legoirc-server
pkgver=0.1
pkgrel=1
pkgdesc="LEGO IR Controller Server"
arch=('any')
url="https://github.com/jtyr/legoirc-server"
license=('MIT')
depends=('vlc' 'bcm2835')
backup=('etc/conf.d/legoirc-server.conf' 'etc/conf.d/vlc-camera-stream.conf')
source=('legoirc-server-0.1.tar.gz')
md5sums=('6f4372eff52ba40e9e89d74fc303c305')

build() {
    cd "$srcdir/$pkgname-$pkgver/"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    make DESTDIR="$pkgdir" install
}
