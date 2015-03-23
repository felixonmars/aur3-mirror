_pkgname=dmenu2
pkgname=$_pkgname-hg
pkgver=r28.36cb94a16edf
pkgrel=1
pkgdesc="The latest hg pull of dmenu2."
arch=('i686' 'x86_64')
url="https://bitbucket.org/melek/dmenu2"
license=('MIT')
depends=('libxinerama' 'sh' 'freetype2')
makedepends=('mercurial')
provides=("$_pkgname" "dmenu")
conflicts=("$_pkgname" "dmenu")
source=("$_pkgname::hg+https://hg@bitbucket.org/melek/dmenu2")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
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
