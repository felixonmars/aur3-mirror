# Maintainer: Austin <doorknob60 at gmail dot com>
pkgname=pygtk-shutdown-git
pkgver=20120608
pkgrel=1
pkgdesc="A fork of ummaintained shutdown-dialog. A simple dialog to shut down the computer. Optional patches inside, see PKGBUILD"
arch=('any')
url="https://github.com/doorknob60/pygtk-shutdown"
license=('GPL')
depends=('python2' 'pygtk' 'gksu')
optdepends=('pm-utils: suspend and hibernate support'\
	'consolekit: use consolekit rather than /sbin/shutdown and gksu'\
	'upower: suspend and hibernate support (if also using consolekit)')
makedepends=('git')
source=()

_gitroot="git://github.com/doorknob60/pygtk-shutdown.git"
_gitname="pygtk-shutdown"

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

  # Uncomment the following line if you want to use Consolekit for shutting down rather than gksu and /sbin/shutdown. If you use this patch, you no longer need gksu, and it can be removed from the dependencies.
  # patch pygtk-shutdown consolekit.patch

  # Uncomment the following line if you want to use Consolekit as well as upower for suspend and hibernate suppoer. If you use this patch, you no longer need gksu, and it can be removed from the dependencies.
  # patch pygtk-shutdown consolekit-upower.patch

  # Uncomment the following line to add support for Suspend and Hibernate via pm-utils (no consolekit)
  # patch pygtk-shutdown pm-utils.patch
  
  
}

package() {
install -d "$pkgdir/usr/bin"
install -Dm755 "$_gitname-build/pygtk-shutdown" "$pkgdir/usr/bin/"
}
