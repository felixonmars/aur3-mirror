# Contributor: Patrick Schneider <patrick.p2k.schneider@gmail.com>
pkgname=pygowave-erlang-rpc
pkgver=0.4.1
pkgrel=1
pkgdesc="PyGoWave RPC Server written in Erlang"
arch=('i686' 'x86_64')
url="http://github.com/p2k/pygowave"
license=('APACHE')
depends=('erlang' 'mysql')
optdepends=('rabbitmq: Scalable message broker' 'rabbitmq-stomp: Allows PyGoWave Erlang RPC to use it')
backup=(etc/pygowave-erlang-rpc.conf)
options=()
source=(http://github.com/p2k/pygowave/tarball/v$pkgver pygowave-erlang-rpc.conf)
md5sums=('8e35814dcf245c1db61739c12fc636e0'
         '86bd59d8e69e8bdd2ce1807c4e751c7f')

build() {
  cd "$srcdir"/p2k-pygowave-*

  cd pygowave_erlang_rpc
  msg "Compiling application..."
  make || return 1

  msg "Installing application..."
  make DESTDIR="$pkgdir/usr" install || return 1
  cd ..

  msg "Installing rc script & config..."
  install -Dm 755 linux_support/rc_script/pygowave-erlang-rpc "$pkgdir/etc/rc.d/pygowave-erlang-rpc"
  install -m 644 "$srcdir/pygowave-erlang-rpc.conf" "$pkgdir/etc/pygowave-erlang-rpc.conf"

}
