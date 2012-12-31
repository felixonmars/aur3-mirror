# Contributor: Maxime Wack <maximewack(a)free(dot)fr>
pkgname=compiz-plugin-earth-git
pkgver=20121231
pkgrel=1
pkgdesc="A Compiz plugin that shows a realtime lit earth inside the cube"
arch=('i686' 'x86_64')
url="https://www.youtube.com/watch?v=Vk6xk5_XNAs"
license=('GPL')
depends=('compiz-core<0.9' 'glew')
makedepends=('git' 'compiz-bcop')
_gitroot='git://anongit.compiz.org/users/satamaxx/earth'
_gitname='earth'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
    cd ..
  else
    git clone "$_gitroot" "$_gitname" --depth 1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "$_gitname"

  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/$HOME/.compiz/plugins" XMLDIR="$pkgdir/$HOME/.compiz/metadata" IMAGEDIR="$pkgdir/$HOME/.compiz/images" DATADIR="$pkgdir/$HOME/.compiz/data" install
  cd "$pkgdir/$HOME/"
  chown $USER:users .compiz/ -R
  chmod 700 "$pkgdir/$HOME"
}

# vim:set ts=2 sw=2 et:

