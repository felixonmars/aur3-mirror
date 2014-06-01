# Maintainer: Jordan Brown <mrhmouse@gmail.com>
pkgname=xresources2putty-git
pkgver=20140531
pkgrel=1
pkgdesc="Import colors from Xresources files to PuTTY sessions"
arch=('i686' 'x86_64')
url="https://github.com/mrhmouse/xresources2putty"
license=('custom:BEER-WARE')
md5sums=()
depends=()
makedepends=('git' 'perl' 'gcc' 'pkg-config')
provides=('xresources2putty')
conflicts=()
_gitroot='git://github.com/mrhmouse/xresources2putty'
_gitname='xresources2putty'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname"
    git pull origin || exit 1
    msg "The local files are updated."
  else
    msg "Cloning project..."
    git clone "$_gitroot" "$_gitname" || exit 1
    cd "$_gitname"
  fi

  msg "Starting build..."

  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
