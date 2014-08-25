# Contributor: Valentin-Costel Haloiu <vially.ichb+aur@gmail.com>

pkgname=komanda
pkgver=1.0.0.beta.r285.g3955f47
pkgrel=1
pkgdesc="The IRC Client For Developers"
arch=('i686' 'x86_64')
url="http://komanda.io/"
options=('!strip')
license=(MIT)
depends=('gtk2' 'nss')
makedepends=('git' 'nodejs')
source=('git://github.com/mephux/komanda.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  npm install
  npm install grunt-cli
  if test "$CARCH" == i686; then
    ./node_modules/.bin/grunt build --platforms linux32
  else
    ./node_modules/.bin/grunt build --platforms linux64
  fi
}

package() {
  if test "$CARCH" == i686; then
    builddir="$srcdir/$pkgname/build/Komanda/linux32"
  else
    builddir="$srcdir/$pkgname/build/Komanda/linux64"
  fi

  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib/$pkgname

  install -Dm755 "$builddir/Komanda" ${pkgdir}/usr/bin/$pkgname
  cp "$builddir/libffmpegsumo.so" ${pkgdir}/usr/lib/$pkgname/
  cp "$builddir/nw.pak" ${pkgdir}/usr/lib/$pkgname/
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
