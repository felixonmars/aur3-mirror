# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterpartyd-git
pkgver=20150110
pkgrel=1
pkgdesc="An open marketplace, built on Bitcoin"
arch=('any')
depends=('leveldb'
         'python'
         'python-appdirs'
         'python-apsw'
         'python-colorlog'
         'python-crypto'
         'python-dateutil'
         'python-flask'
         'python-flask-httpauth'
         'python-json-rpc'
         'python-plyvel'
         'python-prettytable'
         'python-pycoin'
         'python-pysha3'
         'python-python-bitcoinlib'
         'python-requests'
         'python-tendo'
         'python-tornado'
         'sqlite')
makedepends=('git' 'python-sphinx')
optdepends=('bitcoin-core-addrindex: Bitcoin core headless P2P node with addrindex')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterpartyd"
license=('MIT')
source=(git+https://github.com/CounterpartyXCP/counterpartyd
        counterpartyd.conf
        counterpartyd.logrotate
        counterpartyd.service
        counterpartyd-kickstart.service
        counterpartyd-reparse.service
        counterpartyd-rollback.service)
sha256sums=('SKIP'
            '40d403bca63c9f5951ec49d061c3d744a0e0c96e2f030db44c4dcb4339e007d6'
            '0977538447f05ef133f76784fb88e02410ad4f7b0e01b4525efca1cd39cc15d1'
            '2c37964d04df3556c92493a0ce5f4095ba277d6052edc72c4687a7953e542d01'
            '01cb38e2ed83b93588ce31e6a020da807e3fb6314f9a83aa41bbd0002112e70e'
            '3db732eafff5a83b905b26c7a69897ee39c1d0da5c3ee43c25b62516414f3112'
            '39049bd645e707746eab7f44e3608d5126b26b93af5027e9cdaf13de32d4b4e5')
provides=('counterpartyd')
conflicts=('counterpartyd')
install=counterpartyd.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building man pages...'
  make man -C docs/
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/counterpartyd/LICENSE"

  msg 'Installing user manual...'
  for _manpage in `find docs/_build/man/ -type f -name "*.1" -printf '%f\n'`; do
    install -Dm 644 docs/_build/man/$_manpage \
      "$pkgdir/usr/share/man/man1/$_manpage"
  done

  msg 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/counterpartyd"
  cp -dpr --no-preserve=ownership docs ChangeLog.md README.md \
    "$pkgdir/usr/share/doc/counterpartyd"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/counterpartyd"
  install -dm 700 "$pkgdir/var/log/counterpartyd"
  find . -mindepth 1 -maxdepth 1 -type d -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/counterpartyd" \;

  msg 'Installing appfiles...'
  find . -mindepth 1 -maxdepth 1 -type f -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/counterpartyd" \;

  msg 'Installing counterpartyd.conf...'
  install -Dm 600 "$srcdir/counterpartyd.conf" \
    "$pkgdir/etc/counterpartyd/counterpartyd.conf"

  msg 'Installing counterpartyd.service'
  install -Dm 644 "$srcdir/counterpartyd.service" \
    "$pkgdir/usr/lib/systemd/system/counterpartyd.service"
  install -Dm 644 "$srcdir/counterpartyd-kickstart.service" \
    "$pkgdir/usr/lib/systemd/system/counterpartyd-kickstart.service"
  install -Dm 644 "$srcdir/counterpartyd-reparse.service" \
    "$pkgdir/usr/lib/systemd/system/counterpartyd-reparse.service"
  install -Dm 644 "$srcdir/counterpartyd-rollback.service" \
    "$pkgdir/usr/lib/systemd/system/counterpartyd-rollback.service"

  msg 'Installing counterpartyd.logrotate...'
  install -Dm 644 "$srcdir/counterpartyd.logrotate" \
    "$pkgdir/etc/logrotate.d/counterpartyd"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
