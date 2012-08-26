#Maintainer: Jimmy Christensen <dusted@dusted.dk>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=wizznic-git
pkgver=20120826
pkgrel=2
pkgdesc="Wizznic is a puzzlegame where you have to match bricks of the same kind. Freshest version, from git."
arch=(i686 x86_64)
url="https://github.com/DusteDdk/Wizznic"
license=('GPL3')
conflicts=('wizznic')

depends=('sdl_mixer' 'sdl_image' 'mesa' 'wget' )
makedepends=('git')

_gitname=Wizznic
_gitroot=git://github.com/DusteDdk/Wizznic.git

build() {
  msg "Downloading Wizznic from Github ( $_gitroot )"
  cd "$srcdir/"

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" 
    git pull origin
    msg "The local files are updated."
    cd ".."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  if [[ -d "$_gitname" ]]; then
    msg "Checked out source."
    cd "$_gitname"
    msg "Making sure build directory is clean..."
    make -f Makefile.linux clean
    msg "Starting build..."
    make -f Makefile.linux DATADIR=/usr/share/wizznic/ BINDIR=/usr/bin/
  else
    msg "Could not get the source from git."
  fi
}

package() {
  cd "$srcdir/$_gitname"

  make -f Makefile.linux DATADIR=$pkgdir/usr/share/wizznic/ BINDIR=$pkgdir/usr/bin/ install

  mkdir -p "${pkgdir}"/usr/share/{applications,pixmaps}
  install -m644 tools/releaser/data/lin/wizznic.png "${pkgdir}"/usr/share/pixmaps/wizznic.png
  install -m644 tools/releaser/data/lin/wizznic.desktop "${pkgdir}"/usr/share/applications/

}
