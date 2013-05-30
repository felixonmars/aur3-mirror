# Maintainer: mychris <just dot mychris funnychar googlemail dot com>

pkgname=go-ncurses-hg
pkgver=123.3504b4336611
pkgrel=1
pkgdesc='native bindings for the ncurses library'
arch=('i686' 'x86_64')
url='http://code.google.com/p/goncurses/'
license=('BSD')
depends=('go' 'ncurses')
makedepends=('mercurial')
options=('!strip' '!emptydirs')
source=('hg+https://code.google.com/p/goncurses/')
md5sums=('SKIP')
_gourl='code.google.com/p/goncurses'

pkgver() {
  cd "$srcdir/goncurses"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -v -x ${_gourl}
}

package() {
  source /etc/profile.d/go.sh
  mkdir -p $srcdir/{pkg,src}
  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps "$srcdir"/{src,pkg} "$pkgdir/$GOPATH"
  find "$pkgdir" -depth -type d -name .git -exec rm -r {} \;

  install -Dm644 "$srcdir/src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et:
