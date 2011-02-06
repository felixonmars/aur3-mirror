# Contributor: Patrick Schneider <patrick.p2k.schneider@gmail.com>
pkgname=pygowave
pkgver=0.4
pkgrel=9
pkgdesc="Open source Wave implementation in Python"
arch=('i686' 'x86_64')
url="http://github.com/p2k/pygowave"
license=('APACHE')
depends=('twisted>=8.2.0' 'orbited' 'pil' 'django>=1.0' 'django-registration>=0.8' 'python-simplejson' 'demjson' 'python-anyjson' 'python-uuid')
optdepends=('python-lxml: For Gadgets support' 'rabbitmq: Scalable message broker' 'rabbitmq-stomp: Allows PyGoWave to use it')
makedepends=('setuptools')
backup=()
options=()
install=pygowave.install
source=(http://github.com/p2k/$pkgname/tarball/v$pkgver)
md5sums=('0748c9f86b1de6f3966c0fc29ea77c1a')

build() {
  cd "$srcdir"/p2k-pygowave-*

  python setup.py build || return 1
  python setup.py install --root="$pkgdir" || return 1

  msg "Installing scripts"
  install -m 644 -D amqp_rpc_server.py "$pkgdir/srv/http/pygowave/amqp_rpc_server.py"
  install -m 644 pygowave-web.wsgi "$pkgdir/srv/http/pygowave/pygowave-web.wsgi"
  install -m 644 pygowave-web.tac "$pkgdir/srv/http/pygowave/pygowave-web.tac"
  install -m 644 pygowave-rpc.tac "$pkgdir/srv/http/pygowave/pygowave-rpc.tac"
  install manage.py "$pkgdir/srv/http/pygowave/manage.py"
  install launch-pygowave-rpc "$pkgdir/srv/http/pygowave/launch-pygowave-rpc"
  install -D linux_support/rc_script/pygowave-web "$pkgdir/etc/rc.d/pygowave-web"
  install -D linux_support/rc_script/pygowave-rpc "$pkgdir/etc/rc.d/pygowave-rpc"

  msg "Installing additional templates, locales, media and others"
  mkdir -p "$pkgdir/usr/share/pygowave"
  cp -R templates "$pkgdir/usr/share/pygowave"
  cp -R locale "$pkgdir/usr/share/pygowave"
  cp -R media "$pkgdir/usr/share/pygowave"
  cp urls.py settings-template-development.py settings-template-production.py orbited.cfg "$pkgdir/usr/share/pygowave"
}
