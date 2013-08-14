# Maintainer: Nick Markwell <nick@duckinator.net>
pkgname=wildfox-git
_gitname=WildFox
pkgver=21.e6202c2
pkgrel=1
pkgdesc="Webkit-based, multi-platform, Firefox-compatible browser"
arch=('i686' 'x86_64')
url="http://mayaposch.com/wildfox.php"
license=('BSD')
depends=('qt5-base' 'qt5-webkit' 'qt5-tools' )
makedepends=('git' )
provides=()
conflicts=()
source=('git://github.com/MayaPosch/WildFox.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

# $_orig_executable should soon become WildFox
_orig_executable=WildFox
_executable=wildfox

build() {
#  cd "$srcdir"
#  msg "Connecting to GIT server...."
#
#  if [[ -d "$_gitname" ]]; then
#    cd "$_gitname" && git pull origin
#    msg "The local files are updated."
#  else
#    git clone --depth=1 "$_gitroot" "$_gitname"
#  fi
#
#  msg "GIT checkout done or server timeout"
#  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname" && ls -A | grep -v .git | xargs -d '\n' cp -r -t "$srcdir/$_gitname-build" # do not copy over the .git folder
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  qmake-qt5 && make
}

package() {
  cd $pkgdir
  mkdir -p usr/bin
  mkdir -p usr/share/licenses/$pkgname
  
  install -m755 "$srcdir/$_gitname-build/$_orig_executable" "usr/bin/$_executable"
  install -m644 "$srcdir/$_gitname/LICENSE" "usr/share/licenses/$pkgname/LICENSE"
  #cd "$srcdir/$_gitname-build"
  #make DESTDIR="$pkgdir/" install
}
