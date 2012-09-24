pkgname=lpc-whispersofwisdom-git
pkgver=20120802
pkgrel=1
pkgdesc="RPG lpc contribution (also called Unsealed) by Nushio"
arch=('any')
url="https://github.com/Nushio/Unsealed"
license=('GPL')
groups=()
depends=('java-environment')
makedepends=('git' 'apache-ant')
provides=(lpc-whispersofwisdom)
install=
source=(startscript)
md5sums=('9419b89296b8d3c8a9d432be321f3fba')

_gitroot=git://github.com/Nushio/Unsealed.git
_gitname=whispersofwisdom

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

  #
  # BUILD HERE
  #
  cd Unsealed
  sh compile.sh
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D Unsealed/Unsealed.jar $pkgdir/usr/share/whispersofwisdom/Unsealed.jar
  install -D $srcdir/startscript $pkgdir/usr/bin/whispersofwisdom
}

# vim:set ts=2 sw=2 et:
