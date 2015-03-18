# Submitter: Germán L. Osella Massa <gosella at gmail doc com>

#
#  This does not set up the editors
#

pkgname=dcd
pkgver=0.5.1
pkgrel=1
pkgdesc="The D Completion Daemon is an auto-complete program for the D programming language"
arch=('i686' 'x86_64')
url="https://github.com/Hackerpilot/DCD"
license=('GPL')
depends=('glibc')
makedepends=('dmd' 'git' 'libphobos-devel')
provides=('dcd')
conflicts=('dcd-git')
options=('!strip') # Because it's small anyway and symbols are useful as it is still in development

# Adding all the submodules are not 100% needed but it lets the user see what else is being used
source=("$pkgname"::"git+https://github.com/Hackerpilot/DCD.git#tag=v$pkgver"
  "containers"::'git+https://github.com/economicmodeling/containers'
  "libdparse"::'git+https://github.com/Hackerpilot/libdparse'
  "msgpack-d"::'git+https://github.com/msgpack/msgpack-d')

md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP') # Only skip because sources are not static

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.containers.url "$srcdir/containers"
  git config submodule.libdparse.url "$srcdir/libdparse"
  git config submodule.msgpack-d.url "$srcdir/msgpack-d"
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname/"
  install -Dm755 bin/dcd-client "$pkgdir/usr/bin/dcd-client"
  install -Dm755 bin/dcd-server "$pkgdir/usr/bin/dcd-server"

  # Installing man pages
  mkdir -p "$pkgdir/usr/share/man/man1/"
  install -m 644 man1/dcd-server.1 "$pkgdir/usr/share/man/man1/dcd-server.1"
  install -m 644 man1/dcd-client.1 "$pkgdir/usr/share/man/man1/dcd-client.1"
}
