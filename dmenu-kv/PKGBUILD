# Maintainer: Tim Radvan <blob8108@gmail.com>
_pkgname=dmenu
pkgname=$_pkgname-kv
pkgver=0.495.434bc88
pkgrel=1
pkgdesc="Dmenu patch to add alternating key-value pairs"
arch=('i686' 'x86_64')
url="http://github.com/blob8108/dmenu-kv"
license=('MIT')
depends=('libxinerama' 'sh')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://github.com/blob8108/dmenu-kv.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # applying patches
  if ls $SRCDEST/*\.diff 2> /dev/null;then for i in $SRCDEST/*\.diff;do msg "applying $i";git apply $i;done;fi
  # custom config
  if [ -e $SRCDEST/config.h ];then msg "using custom config.h";cp $SRCDEST/config.h .;fi
}

build() {
  cd "$srcdir/$_pkgname"
  make 
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" PREFIX="usr/" install
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
