pkgname=rabbitmq-stomp
pkgver=1.7.2
pkgrel=2
pkgdesc="STOMP gateway for RabbitMQ"
arch=(i686 x86_64)
url="http://rabbitmq.com"
license=('MPL')
depends=('rabbitmq=1.7.2')
makedepends=(mercurial)
install=rabbitmq-stomp.install
source=()

build(){
	cd "$srcdir"

	hg clone http://hg.rabbitmq.com/rabbitmq-public-umbrella

	cd rabbitmq-public-umbrella
	
	hg clone http://hg.rabbitmq.com/rabbitmq-stomp -r tip

	cd rabbitmq-stomp

	# Small hack for clean compiling
	mkdir src/rabbit_common
	ln -s /usr/lib/erlang/lib/rabbitmq_server-$pkgver/include src/rabbit_common/include

	make package || return 1

	install -Dm 644 dist/rabbit_stomp.ez "$pkgdir/usr/lib/erlang/lib/rabbitmq_server-$pkgver/plugins/rabbit_stomp.ez"
}
