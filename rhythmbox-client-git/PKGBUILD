# Maintainer: LeCrayonVert
pkgname=rhythmbox-client-git
pkgver=20110820
pkgrel=2
pkgdesc="A complete rewrite of rhythmbox-client to use with Rhythmbox 3"
arch=('any')
url="https://github.com/Vysserk3/rhythmbox-client"
license=('GPL3')
depends=(dbus-python)
makedepends=('git')
provides=('rhythmbox-client')

_gitroot='https://github.com/Vysserk3/rhythmbox-client.git'
_gitname='rhythmbox-client'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

}

package() {
  cd $srcdir/"$_gitname"
  install -d -m755 "${pkgdir}/usr/bin/"
  cp rhythmbox-client "${pkgdir}/usr/bin/"
  
}

