# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Diep Pham Van <imeo at favadi dot com>
# Contributor: Austin <doorknob60 at gmail dot com>

_gitname=pygtk-shutdown
pkgname=pygtk-shutdown-awesome-git
pkgver=r5.70b9f7c
pkgrel=1
pkgdesc="A fork of ummaintained shutdown-dialog, build for awesome wm. A simple dialog to shut down the computer."
arch=('i686' 'x86_64')
url="https://github.com/doorknob60/pygtk-shutdown"
license=('GPL')
depends=('pygtk' 'gksu')
optdepends=('pm-utils: suspend and hibernate support'\
	'consolekit: use consolekit rather than /sbin/shutdown and gksu'\
	'upower: suspend and hibernate support (if also using consolekit)')
makedepends=('git')
conflicts=('pygtk-shutdown-git' 'pygtk-shutdown-svn')
source=(git://github.com/doorknob60/pygtk-shutdown.git
	awesome.patch)
md5sums=('SKIP'
         '9709917ab2bb1bfaeab84c264d39f1c8')


pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"

  # patch logout command for awesome wm
  cp ../../awesome.patch .
  patch pygtk-shutdown awesome.patch
  # Uncomment the following line if you want to use Consolekit for shutting down rather than gksu and /sbin/shutdown
  # patch pygtk-shutdown consolekit.patch

  # Uncomment the following line if you want to use Consolekit as well as upower for suspend and hibernate suppoer
  # patch pygtk-shutdown consolekit-upower.patch

  # Uncomment the following line to add support for Suspend and Hibernate via pm-utils (no consolekit)
  # patch pygtk-shutdown pm-utils.patch
}

package() {
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$_gitname/pygtk-shutdown" "$pkgdir/usr/bin/"
}
