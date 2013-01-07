# Maintainer: OmeGa <omega at mailoo dot org>

pkgname=git-credential-gnomekeyring
pkgver=20130104
pkgrel=1
pkgdesc="Git credential helper for GNOME keyring."
arch=('i686' 'x86_64')
url="https://github.com/shugo/git-credential-gnomekeyring"
license=('MIT')
depends=('git' 'libgnome-keyring')
install=$pkgname.install

_gitroot="git://github.com/shugo/git-credential-gnomekeyring.git"
_gitname="git-credential-gnomekeyring"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout."
  msg "Starting make..."

  [[ -d $_gitname-build ]] && \
    rm -rf $_gitname-build
  cp -R $_gitname $_gitname-build
  cd $_gitname-build   

  make
  sed -n '/Copyright/,/ THE SOFTWARE./p' README.md > LICENSE && \
    sed -i 's/^[ \t]*//' LICENSE
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
