# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=castersoundboard-git
pkgver=0.1
pkgrel=1
pkgdesc="Lets you hot-key and playback sound effects."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/castersb"
license=('LGPL3')
depends=('qt5-multimedia')
makedepends=('git')
provides=(castersoundboard)
conflicts=(castersoundboard)
#replaces=()
#backup=()
#options=()
#install="$pkgname".install
source=('castersoundboard.png')
md5sums=('7561fbb18db853049bae710918ca9f8a')
_gitroot='git://git.code.sf.net/p/castersb/code'
_gitname='castersb-code'
_capname='CasterSoundboard'

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
  cd "$srcdir/$_gitname-build/$_capname"
  # Make the .desktop entry
cat > castersoundboard.desktop <<EOF 
[Desktop Entry]
Name=CasterSoundboard
Comment=CasterSoundboard
Exec='/usr/bin/castersoundboard'
Icon='castersoundboard.png'
Terminal=false
Type=Application
Categories=Media;
StartupNotify=true
EOF
  #
  # BUILD HERE
  #
qmake
make
}

package() {
  cd "$srcdir/$_gitname-build/$_capname"
  install -D $_capname $pkgdir/usr/bin/$_capname
  install -D "$srcdir/castersoundboard.png" "$pkgdir/usr/share/pixmaps/castersoundboard.png"
  install -D "castersoundboard.desktop" "$pkgdir/usr/share/applications/castersoundboard.desktop"
}

# vim:set ts=2 sw=2 et:

