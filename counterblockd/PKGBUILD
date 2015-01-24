# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterblockd
pkgver=1.0.1
pkgrel=1
pkgdesc="Provides extended API services to Counterwallet, as well as Counterparty 3rd-party applications"
arch=('any')
depends=('cython2'
         'git'
         'leveldb'
         'libxml2'
         'libxslt'
         'mongodb'
         'perl-image-exiftool'
         'python2'
         'python2-aniso8601'
         'python2-appdirs'
         'python2-colorama'
         'python2-configobj'
         'python2-dateutil'
         'python2-flask'
         'python2-gevent-git'
         'python2-geventhttpclient'
         'python2-gevent-socketio'
         'python2-gevent-websocket'
         'python2-grequests-git'
         'python2-json-rpc'
         'python2-jsonschema'
         'python2-lxml'
         'python2-numpy'
         'python2-pillow'
         'python2-prettytable'
         'python2-pycoin'
         'python2-pygeoip'
         'python2-pymongo'
         'python2-python-bitcoinlib'
         'python2-pyzmq'
         'python2-redis'
         'python2-repoze.lru'
         'python2-requests'
         'python2-rfc3987'
         'python2-strict-rfc3339'
         'redis'
         'sqlite'
         'zeromq')
makedepends=('python2-sphinx')
optdepends=('armory: for armory_utxsvr'
            'counterpartyd: Counterparty protocol')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterblockd"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/counterblockd/tar.gz/$pkgver
        counterblockd.conf
        counterblockd.logrotate
        counterblockd.service
        counterblockd-reparse.service)
sha256sums=('e81bc9e1c54efafe10e5ef87a109e3581f99370fd128cf93d35998f0406ff426'
            '689ed406660b8413448c7caffae8128aeac2f0720101d2d0b8693d9366c754aa'
            'c33c46216455937b12af16ff51f01d5b6d0592ad1b86c727e16eb005683aedaf'
            '516b8490ef31038f18aac74180180ef4ef10296c18322dc54b4d6b830b201c61'
            '5d3af025f42c661986d97aed20d7b828b0a394d134c4c12a97f5003d7e40db25')
install=counterblockd.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python$#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python3#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python$#/usr/bin/env python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python3#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building man pages...'
  make man -C docs/
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/counterblockd/LICENSE"

  msg 'Installing user manual...'
  for _manpage in `find docs/_build/man/ -type f -name "*.1" -printf '%f\n'`; do
    install -Dm 644 docs/_build/man/$_manpage "$pkgdir/usr/share/man/man1/$_manpage"
  done

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/counterblockd/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/counterblockd"
  install -dm 700 "$pkgdir/var/log/counterblockd"
  find . -mindepth 1 -maxdepth 1 -type d -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/counterblockd" \;

  msg 'Installing appfiles...'
  find . -mindepth 1 -maxdepth 1 -type f -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/counterblockd" \;

  msg 'Installing counterblockd.conf...'
  #install -Dm 600 "$srcdir/counterblockd.conf" "$pkgdir/etc/counterblockd/counterblockd.conf"
  install -Dm 600 "$srcdir/counterblockd.conf" "$pkgdir/etc/conf.d/counterblockd"

  msg 'Installing counterblockd.service'
  install -Dm 644 "$srcdir/counterblockd.service" "$pkgdir/usr/lib/systemd/system/counterblockd.service"
  install -Dm 644 "$srcdir/counterblockd-reparse.service" "$pkgdir/usr/lib/systemd/system/counterblockd-reparse.service"

  msg 'Installing counterblockd.logrotate...'
  install -Dm 644 "$srcdir/counterblockd.logrotate" "$pkgdir/etc/logrotate.d/counterblockd"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
