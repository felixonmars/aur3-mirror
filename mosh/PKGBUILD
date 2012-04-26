# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit.com>
pkgname=mosh
pkgver=1.2
pkgrel=1
pkgdesc='mobile shell (mosh) surviving disconnects with local echo and line editing'
arch=('x86_64' 'i686')
url="http://mosh.mit.edu"
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty')
optdepends=('libutempter: record of session in {u,t}wmp (recompile mosh afterwards)')
conflicts=('mosh-git')
source=("${pkgname}-${pkgver}::https://github.com/keithw/mosh/tarball/mosh-${pkgver}")
sha1sums=('ee995febb8ad7870e486b068272149bc43269988')

build() {
  cd $(ls -1dt ${srcdir}/keithw-mosh-* | head -n 1)
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $(ls -1dt ${srcdir}/keithw-mosh-* | head -n 1)
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
