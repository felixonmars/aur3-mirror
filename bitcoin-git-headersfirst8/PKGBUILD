# Maintainer: Adlai Chandrasekhar <munchking@gmail.com>

pkgname=bitcoin-git-headersfirst8
pkgver=0.9.99.0-ge0e14e4
pkgrel=1
epoch=1
pkgdesc="Bitcoin development version with headers-first blockchain sync"
arch=('i686' 'x86_64')
url="https://github.com/bitcoin/bitcoin/pull/4468"
depends=('qt4>=4.6' 'libpng>=1.4' 'expat' 'gcc-libs' 'boost-libs>=1.46' 'miniupnpc>=1.5' 'openssl' 'db4.8' 'protobuf' 'bash-completion')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
conflicts=('bitcoin-bin' 'bitcoin' 'bitcoind' 'bitcoin-daemon' 'bitcoin-qt')
provides=('bitcoin')
license=('MIT')
source=(git://github.com/sipa/bitcoin.git)
sha512sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname%%-*}"
  git describe | sed "s/^v//; s/-/./g"
}

build() {
  cd "$srcdir/${pkgname%%-*}"

  git checkout headersfirst8

  ./autogen.sh

  ./configure --prefix=/usr

  make -j3 # $MAKEFLAGS
}

package() {
  cd "$srcdir/${pkgname%%-*}"

  make DESTDIR="${pkgdir}" install

  # Copy mans
  cat contrib/debian/*.manpages | sed -e 's@^\(debian\)@contrib/\1@' | install_man

  # Copy examples
  mkdir -p "$pkgdir/usr/share/bitcoin"
  cat contrib/debian/*.examples | sed -e 's@^\(debian\)@contrib/\1@' | xargs -I{} install -Dm0644 {} "$pkgdir/usr/share/bitcoin/"

  # Install bash completion
  mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm0644 contrib/bitcoind.bash-completion "$pkgdir/etc/bash_completion.d/bitcoind"
}

# guess correct /usr/share/man's subdirectory for man every file
# FIXME Uber-fat crunch. It should another, simple way...
install_man() {
  while read man; do
    local man_d="$pkgdir/usr/share/man/man${man#${man%?}}/"
    mkdir -p "$man_d"
    install -Dm0644 "$man" "$man_d"
  done
}
