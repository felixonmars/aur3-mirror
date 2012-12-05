# Maintainer: Your Name <anish [at] archlinux.us>
pkgname=silversearcher-git
pkgver=20121205
pkgrel=1
pkgdesc="A code-searching tool similar to ack, but faster."
arch=('i686' 'x86_64')
url="https://github.com/ggreer/the_silver_searcher"
license=('GPL')
groups=(devel)
makedepends=('git' 'ruby-ronn')
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/ggreer/the_silver_searcher.git
_gitname=the_silver_searcher
builddir=$srcdir/$_gitname-build

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # BUILD 

  ./build.sh
  pushd ./doc
  ./generate_man.sh
  popd
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -d -m755 ${pkgdir}/usr/bin
  install -m755 ${builddir}/ag ${pkgdir}/usr/bin
  install -d -m755 ${pkgdir}/usr/share/man/man1
  install -m644 ${builddir}/doc/ag.1 ${pkgdir}/usr/share/man/man1
  install -Dm644 ${builddir}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
}

# vim:set ts=2 sw=2 et:
