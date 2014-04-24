# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterwalletd
pkgver=0.9.6
pkgrel=3
pkgdesc="Daemon for Counterwallet features"
arch=('any')
depends=('cube-git' 'leveldb' 'mongodb' 'perl-image-exiftool' 'python2' 'python2-appdirs' 'python2-apsw' 'python2-boto' 'python2-cherrypy' 'python2-cube-client' 'python2-dateutil' 'python2-gevent' 'python2-gevent-socketio' 'python2-grequests' 'python2-json-rpc' 'python2-lxml' 'python2-numpy' 'python2-pillow' 'python2-prettytable' 'python2-pycoin' 'python2-pymongo' 'python2-pytest' 'python2-pyzmq' 'python2-redis' 'python2-requests' 'python2-rollbar' 'redis' 'sqlite' 'zeromq')
makedepends=('python2-sphinx')
optdepends=('counterpartyd: Counterparty protocol'
            'insight-bitcore-git: Bitcoin blockchain API')
groups=('counterparty')
url="https://github.com/xnova/counterwalletd"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/xnova/counterwalletd/tar.gz/$pkgver
        counterwallet.conf
        counterwallet.logrotate
        counterwallet.service)
sha256sums=('734304a488f33dd057d6c29b46b0ce249d1416d819cfa4fa7fa5e17b2614afb7'
            'd59e604f0f63a3bf96176e22b74a96f1b16cfd87c0af9d0c1fd94b71fd29385a'
            'b652ad3d61caee6ca83a22a03c4a750e56dd46e08dcc322bee616db560a3f94e'
            '838290fa325649b4b0551d18156b279df995c2cc75636674d08f34b7cf2dbc9c')
install=counterwallet.install

prepare() {
  cd $srcdir/$pkgname-$pkgver

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python3#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python3#/usr/bin/env python2#g'
}

build() {
  cd $srcdir/$pkgname-$pkgver

  msg 'Building man pages...'
  make man -C docs/
}

package() {
  cd $srcdir/$pkgname-$pkgver

  msg 'Installing license...'
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/counterwallet/LICENSE

  msg 'Installing user manual...'
  for _manpage in `find docs/_build/man/ -type f -name "*.1" -printf '%f\n'`; do
    install -Dm 644 docs/_build/man/$_manpage $pkgdir/usr/share/man/man1/$_manpage
  done

  msg 'Installing documentation...'
  install -Dm 644 README.md $pkgdir/usr/share/doc/counterwallet/README.md

  msg 'Installing appdirs...'
  install -dm 755 $pkgdir/usr/share/counterwallet
  install -dm 700 $pkgdir/var/log/counterwallet
  for _appdir in lib; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/counterwallet/$_appdir
  done

  msg 'Installing appfiles...'
  for _appfile in __init__.py; do
    install -Dm 644 $_appfile $pkgdir/usr/share/counterwallet/$_appfile
  done

  msg 'Installing counterwalletd executable...'
  install -Dm 755 counterwalletd.py $pkgdir/usr/share/counterwallet/counterwalletd.py

  msg 'Installing counterwalletd.conf...'
  #install -Dm 600 $srcdir/counterwallet.conf $pkgdir/etc/counterwallet/counterwallet.conf
  install -Dm 600 $srcdir/counterwallet.conf $pkgdir/etc/conf.d/counterwallet

  msg 'Installing counterwalletd.service'
  install -Dm 644 $srcdir/counterwallet.service $pkgdir/usr/lib/systemd/system/counterwallet.service

  msg 'Installing counterwalletd.logrotate...'
  install -Dm 644 $srcdir/counterwallet.logrotate $pkgdir/etc/logrotate.d/counterwallet

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
