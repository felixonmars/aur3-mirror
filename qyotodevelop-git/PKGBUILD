# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=qyotodevelop-git
pkgver=20091221
pkgrel=1
pkgdesc="Qyoto (Qt) support for MonoDevelop"
url="http://wiki.github.com/codebutler/qyotodevelop"
arch=('i686' 'x86_64')
license=('BSD')
depends=('monodevelop>=2.0')
makedepends=('git')
_gitroot="git://github.com/codebutler/qyotodevelop.git"
_gitname="qyotodevelop"

build() {
  export MONO_SHARED_DIR="$srcdir/weird"
  mkdir -p "$MONO_SHARED_DIR"

  cd "$srcdir"

  msg "Connecting to github.com GIT server...."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi
  msg "GIT checkout done or server timeout"

  git clone "$_gitname" "$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Configuring..."
  ./autogen.sh || return 1
  ./configure --prefix=/usr || return 1

  msg "Building..."
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
} 

# vim:set ts=2 sw=2 et:
