# Maintainer: David Knott <david.knott@mail.utoronto.ca>
pkgname=blackle-backgrounder
pkgver=1.0
pkgrel=1
pkgdesc="A simple python and GTK3 background manager"
arch=('any')
url="https://github.com/davidknott/blackle_backgrounder"
license=('GPL')
depends=('python2' 'python2-gobject' 'feh')
makedepends=('git')

_gitroot=git://github.com/davidknott/blackle_backgrounder.git
_gitname=blackle_backgrounder

build() {
  cd $srcdir

  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "${pkgdir}/usr/bin"
  cp ./blackle_background "${pkgdir}/usr/bin/blackle-background"
  chmod +111 "${pkgdir}/usr/bin/blackle-background"
}
