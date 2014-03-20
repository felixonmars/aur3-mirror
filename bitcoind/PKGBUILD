# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoind
pkgver=0.9.0
pkgrel=1
pkgdesc="Bitcoin core headless P2P node"
arch=('i686' 'x86_64')
url="http://bitcoin.org/"
depends=('boost' 'boost-libs' 'miniupnpc' 'openssl')
makedepends=('binutils' 'gcc' 'make' 'pkg-config')
license=('MIT')
source=(${pkgname%d}-$pkgver.tar.gz::https://codeload.github.com/bitcoin/bitcoin/tar.gz/v$pkgver
        bitcoin.conf
        bitcoin.logrotate
        bitcoin.service)
sha256sums=('229e5e13ff45f6d4302d618859aee9d36791f93bc7357d02bf2fabc683fdf2f4'
            '180c51d8e0523c87dc536389b84d174ee4a4698069b92ee7e65438266cb75251'
            '8f05207b586916d489b7d25a68eaacf6e678d7cbb5bfbac551903506b32f904f'
            '4f745a7bd50293e474ac1224012dcebce3aa1e3cbd1217fc03a7879e5926b8f4')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin-daemon')
conflicts=('bitcoin-daemon')
install=bitcoin.install

build() {
  cd $srcdir/${pkgname%d}-$pkgver

  msg 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/bitcoin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/bitcoin \
    --localstatedir=/var/lib/bitcoin \
    --enable-hardening \
    --with-gui=no \
    --disable-wallet
  make
}

package() {
  cd $srcdir/${pkgname%d}-$pkgver

  msg 'Installing license...'
  install -Dm 644 COPYING $pkgdir/usr/share/licenses/${pkgname%d}/COPYING

  msg 'Installing man pages...'
  install -Dm 644 contrib/debian/manpages/bitcoind.1 $pkgdir/usr/share/man/man1/bitcoind.1
  install -Dm 644 contrib/debian/manpages/bitcoin.conf.5 $pkgdir/usr/share/man/man5/bitcoin.conf.5

  msg 'Installing documentation...'
  install -dm 755 $pkgdir/usr/share/doc/bitcoin
  for _doc in `find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n'` release-notes; do
    mv doc/$_doc $pkgdir/usr/share/doc/bitcoin/$_doc
  done

  msg 'Installing bitcoin...'
  make DESTDIR="$pkgdir" install

  msg 'Installing bitcoin.conf...'
  install -Dm 600 $srcdir/bitcoin.conf $pkgdir/etc/bitcoin/bitcoin.conf

  msg 'Installing bitcoin.service...'
  install -Dm 644 $srcdir/bitcoin.service $pkgdir/usr/lib/systemd/system/bitcoin.service

  msg 'Installing bitcoin.logrotate...'
  install -Dm 644 $srcdir/bitcoin.logrotate $pkgdir/etc/logrotate.d/bitcoin

  msg 'Installing bash completion...'
  install -Dm 644 contrib/bitcoind.bash-completion $pkgdir/etc/bash_completion.d/bitcoind

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
