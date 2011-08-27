# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=tudor-volumed-git
pkgver=20110516
pkgrel=1
pkgdesc="ALSA Volume media key daemon. Binds XF86_Volume_* keys."
arch=('i386' 'x86_64')
url="https://github.com/darvid/tudor-volumed"
license=('BSD')
depends=('glibmm' 'gtkmm' 'gtk2' 'glib2')
makedepends=('git')
install=tudor-volumed.install

_gitroot="https://github.com/darvid/tudor-volumed"
_gitname="tudor-volumed"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {

  cd "$srcdir/$_gitname-build"
  install -D -m755 "tudor-volumed" "$pkgdir/usr/bin/tudor-volumed"
}

