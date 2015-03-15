# Maintainer Cayman Nava <caymannava at gmail dot com>
# created using npm2arch
_npmname=dnschain
_npmver=0.5.2
pkgname=dnschain
pkgver=0.5.2
pkgrel=1
pkgdesc="A blockchain-based DNS + HTTP server that fixes HTTPS security, and more!"
arch=(any)
url="https://github.com/okTurtles/dnschain"
license=('MPL')
depends=('coffee-script' 'git' 'nodejs' 'namecoin-core')
optdepends=('bitshares: bdns support' 'go-ethereum: ethereum support')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('31de61107f4c7a7ef8c936be9fb2e88155d42c01')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  cd $_npmdir/dnschain/scripts
  mv namecoin.service namecoin-dnschain.service
  sed -i 's#/usr/local/bin#/usr/bin#g' dnschain.service
  sed -i 's#/usr/local/bin/namecoind#/usr/bin/namecoin-qt#g' namecoin-dnschain.service
  mkdir -p $pkgdir/usr/lib/systemd/system
  mv {dnschain,namecoin-dnschain}.service $pkgdir/usr/lib/systemd/system
}
# vim:set ts=2 sw=2 et:
