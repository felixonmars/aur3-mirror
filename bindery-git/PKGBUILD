# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Nikita Nikishin <nnikishi@emich.edu>

pkgname=bindery-git
pkgver=20110904
pkgrel=1
pkgdesc="Interactive document binding tool for post-processed scanned images"
arch=('any')
url="http://blender3d.github.com/Bindery/"
license=('GPL')
depends=('python2' 'qt' 'python2-qt' 'python2-sip' 'python-imaging' 'djvulibre')
makedepends=()
optdepends=('tesseract: Word Detection')
conflicts=()

_gitroot="git://github.com/Blender3D/Bindery.git"
_gitname="Bindery"

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
}

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/bindery/
  install -d $pkgdir/usr/bin/
  mv $_gitname-build/* $pkgdir/usr/share/bindery
  
  echo \#\!\/bin\/bash > $pkgdir/usr/bin/bindery
  echo cd \/usr\/share\/bindery\/ >> $pkgdir/usr/bin/bindery
  echo python2 main.py >> $pkgdir/usr/bin/bindery
  chmod +x $pkgdir/usr/bin/bindery

  sed "s/.\/djvu_backup\//\/tmp\/djvu_backup\//g" -i $pkgdir/usr/share/bindery/thumbnailer.py

  rm -rf $(find "$pkgdir" -type d -name ".git")
}
