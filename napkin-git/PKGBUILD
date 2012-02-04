# Maintainer: Splex
pkgname=napkin-git
pkgver=20111221
pkgrel=1
pkgdesc="Sleeptracker PRO watch support utility."
arch=('i686' 'x86_64')
url="http://kin.klever.net/napkin/"
license=('MIT')
groups=()
depends=('gtkmm')
makedepends=('git')
provides=('napkin')
conflicts=('napkin')
replaces=()
backup=()
options=()
install=napkin.install
source=("timezone_fix.diff"
        "50-sleeptracker.rules")
noextract=()
md5sums=('e65dc5259f1c164631cadb0859c18834'
         '4466166c24a4c50c8bbad1056c6fafbc')

_gitroot="git://git.klever.net/kin/napkin.git"
_gitname="napkin"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
#  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch -p1 < $srcdir/timezone_fix.diff

  sh autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$srcdir/$_gitname-build/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "$srcdir/50-sleeptracker.rules" "$pkgdir/etc/udev/rules.d/50-sleeptracker.rules"
} 

