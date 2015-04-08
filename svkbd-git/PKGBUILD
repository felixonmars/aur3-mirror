# Contributor: Army

# If you want to create custom layouts, place your languages here, e.g.
#_layouts=(de)
# In this case, you have to place a file called layout.de.h into your $startdir, which is where the PKGBUILD file is stored

_gitname=svkbd
pkgname=$_gitname-git
pkgver=20140130.49
pkgrel=1
pkgdesc="A simple virtual keyboard, intended to be used in environments, where no keyboard is available"
arch=('i686' 'x86_64')
url="http://tools.suckless.org/svkbd"
license=('MIT')
depends=('libxtst')
makedepends=('git')
provides=("$_gitname")
conflicts=("$_gitname")
source=("$_gitname::git+http://git.suckless.org/svkbd")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

prepare() {
  cd "$srcdir/$_gitname"
  # custom config
  if [ -e $SRCDEST/config.h ]; then msg "using custom config.h";cp $SRCDEST/config.h .; fi
}

build() {
  cd "$srcdir/$_gitname"
  make
  for i in "${_layouts[@]}"; do make svkbd-$i; done
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
