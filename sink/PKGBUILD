pkgname=sink
pkgver=0.0.1a
pkgrel=1
license=('GPL')
arch=('i686' 'x86_64')
pkgdesc="Sink 'em all (Sea fight game written in bash)"
url="http://habrahabr.ru/blogs/crazydev/80122/"
depends=('debian-netcat')
source=('sink.sh')
md5sums=('ab4429b4ea021a7d2f1a00f017fa9489')

options=('!strip') # otherwise the bytecode gets fucked

build() {
  install -Dm755 sink.sh $pkgdir/usr/bin/sink
}
