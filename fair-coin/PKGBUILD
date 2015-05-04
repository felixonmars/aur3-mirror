# $Id$
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: shahid <helllamer@gmail.com>

pkgbase=fair-coin
pkgname=('faircoin-daemon' 'faircoin-qt')
pkgver=1.5.1
pkgrel=3
arch=('i686' 'x86_64')
url="http://fair-coin.org/"
makedepends=('boost<1.59' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf')
license=('custom:MIT')
source=(https://github.com/FairCoinTeam/fair-coin/archive/v${pkgver}.tar.gz
        https://raw.githubusercontent.com/FairCoinTeam/fair-coin/v1.2.0/contrib/debian/examples/novacoin.conf
        https://raw.githubusercontent.com/FairCoinTeam/fair-coin/v1.2.0/contrib/debian/manpages/novacoin.conf.5
        https://raw.githubusercontent.com/FairCoinTeam/fair-coin/v1.2.0/contrib/debian/manpages/novacoind.1
        https://raw.githubusercontent.com/FairCoinTeam/fair-coin/v1.2.0/contrib/debian/novacoin-qt.desktop)
md5sums=('bc6d8a71bcae3d4b2ae5a42ba494d6c5'
         '9723b6420548b651316cacf36d760074'
         'a40ed2c3a72a6adfef312e255a50d85d'
         'aae79bab068decaa0288c3c7859404b9'
         'd28e6e9094215dcca33555e3b0876356')

prepare() {
  cd "${srcdir}"
  sed -e "s/Nova/Fair/g" -e "s/nova/fair/g" \
      -e "s/bitcoin/faircoin/g" \
      -i novacoin-qt.desktop novacoin.conf \
         novacoind.1 novacoin.conf.5

  cd "$srcdir/$pkgbase-$pkgver"
  ./autogen.sh
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  ./configure --prefix=/usr --disable-maintainer-mode --disable-tests --with-incompatible-bdb --with-gui=qt4

  # fix error with missing DSO by adding -lrt
  # https://github.com/bitcoin/bitcoin/issues/879
  sed -i -e "s/^LIBS = .*$/& -lrt/" src/Makefile
  make
}

package_faircoin-qt() {
  pkgdesc="faircoin is a peer-to-peer network based digital currency - Qt"
  depends=("boost-libs<1.59" qt4 miniupnpc qrencode protobuf)
  install=faircoin-qt.install

  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 src/qt/FairCoin-qt "$pkgdir"/usr/bin/faircoin-qt
  install -Dm644 "${srcdir}/novacoin-qt.desktop" "${pkgdir}"/usr/share/applications/faircoin-qt.desktop
  install -Dm644 share/pixmaps/faircoin80.xpm "${pkgdir}"/usr/share/pixmaps/faircoin80.xpm
  install -Dm644 share/pixmaps/faircoin32.xpm "${pkgdir}"/usr/share/pixmaps/faircoin32.xpm
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_faircoin-daemon() {
  pkgdesc="faircoin is a peer-to-peer network based digital currency - daemon"
  depends=("boost-libs<1.59" miniupnpc openssl)

  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 src/FairCoind "$pkgdir"/usr/bin/faircoind
  install -Dm644 "${srcdir}"/novacoin.conf "${pkgdir}"/etc/faircoin.conf
  install -Dm644 "${srcdir}"/novacoin.conf.5 "${pkgdir}"/usr/share/man/man5/faircoin.conf.5
  install -Dm644 "${srcdir}"/novacoind.1 "${pkgdir}"/usr/share/man/man1/faircoind.1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
