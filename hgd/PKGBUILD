# Maintainer: Robert Bronsdon <reashlin at gmail.com>
pkgname=hgd
pkgver=0.5.3
pkgrel=1
epoch=
pkgdesc="A music system suitable for hackathons, internet cafes, LAN parties etc."
arch=('i686' 'x86_64')
url="https://github.com/vext01/hgd/"
license=('custom:ISC')
groups=()
depends=('mplayer')
makedepends=('libbsd' 'sqlite3' 'openssl' 'libconfig')
checkdepends=()
optdepends=('taglib: ID3Tag Support'
            'python>=2.6: Scripting Support')
provides=('hgd')
conflicts=()
replaces=()
backup=('var/hgd/hgd.db')
options=()
install=
changelog=
source=(https://github.com/downloads/vext01/hgd/$pkgname-$pkgver.tar.gz        \
        LICENSE                                                                \
        hgd-playd                                                              \
        hgd-netd
       )
md5sums=('1ad8333de684762124f8ffbc2c6e3aaa'
  '107e73d9db24c718f5c5c4b1d57961b3'
  '859d347dfa1995b6dafdc8f52b830944'
  '26fce6a6d54f1d6a01fcb4363c9db083')
sha1sums=('b4d14e1feafdba9a86a8ababf4fa99338502ef1e'
  'a694d958e7def2f75f51ae062e3fb998b201ce00'
  'c3a8932c90177f90fba55066b2963e5bc3994ef3'
  '15bd672f32b1056966201b439d2eec7ae6eea213')
sha256sums=('bd1d3988c933bef546a9cecc1ee2bb07c95811d854d67a1d294f8e31b4d58906'
  'a91e28c79670a02c9cb042268374d172bd003782ec87c47447654d9767ddaecf'
  '0d38f9b69aaa03ae78339d8989d8afdde4c1d7281acdceb152956ea80fe3059c'
  '8bcdca0a9e0cf4498aec90f8009c5bae285b3e61d79b2c5b9778244beedc6acc')
sha384sums=('7e1847f225a71eb430f84da7d7d71298a46a833dcc07ee55e9296508173da2a15fb0c22b8e222aad9c1fad22c554efdc'
  '8fe1c958dce0fba9c5c85d0a26ff0e58542fe322384e8904acd4f0579ade1870d9293da7eead774f09b7c7a30af6f3e1'
  '09c43c85d8db2598ba6eac47a2c43aea457b56b11cb8fca769312df363c448a55e78195c6f539999be2ae3f18b44f8c9'
  'dcc00926f307ef50b2063b113ea6c41840ef8c978c9abbb308de6289b9a3634486cd12806b6d3b9336e4b1801493bb1e')
sha512sums=('0323cf6d0036635089cb3a38520439b9b846766839f7a07752f25ce641b68cb0b51f8fdaaf5bf9f05fa5eb45ec1b26bad75cd402fef355ca3caaa27ceaa17796'
  '8bc9166d8a67f95c118263ec6eeaae7540cedb9794631846f9d4e8cca16593554a1b3ab00eb02a698ee3c50e634adea2ec2a84f6b82c951139b8b69a80771c9b'
  'c74c033eb759d0e172b83fe7520ca0f9da7fbb7775b5d27c39ad028be78ece2362d1c0dc24f15e237947d9fbf1720bc650f28346069c9965fa99d4f4b309ca96'
  '05c4f215c85493ce478fbf97ad6209d6664249e64980f81c46731e88c6e2967101997bcba73e160d9e1edf5fe4b78d5dd5e798ef915a25b701e9fc8c15ad409c')
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR=$pkgdir install

  install -Dm755 -d "$pkgdir/etc/hgd"

  install -Dm644 plugins/* "$pkgdir/etc/hgd/"
  install -Dm700 -d "$pkgdir/var/hgd"

  install -Dm755 ../hgd-playd "$pkgdir/etc/rc.d/hgd-playd"
  install -Dm755 ../hgd-netd "$pkgdir/etc/rc.d/hgd-netd"
}

# vim:set ts=2 sw=2 et:
