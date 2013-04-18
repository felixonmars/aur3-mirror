# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Maintainer: Leslie P. Polzer <polzer@gnu.org>

pkgname=paktahn
pkgver=0.9.9.2
libver=0.9.3
pkgrel=1
pkgdesc="The kick-ass package manager for Arch Linux!"
arch=('i686' 'x86_64')
depends=('pacman' 'readline' 'sudo' 'subversion')
makedepends=('sbcl')
license=('GPL')
url="http://github.com/skypher/paktahn"
options=(!strip)
install="paktahn.install"
source=("http://paktahn.port-zero.com/src/paktahn-makedeps-$libver.tbz2"
        "http://paktahn.port-zero.com/src/paktahn-${pkgver}.tar.bz2")

build() {
  cd "$srcdir"

  # compile
  SBCL=sbcl

  $SBCL \
       --noinform --lose-on-corruption --end-runtime-options \
       --no-userinit --no-sysinit \
       --eval "(pushnew :paktahn-deploy *features*)" \
       --eval "(require :asdf)" \
       --eval "(setf asdf:*central-registry*
                    '(\"$srcdir/\" \"$srcdir/clbuild.paktahn/systems/\"))" \
       --eval "(asdf:oos 'asdf:load-op 'paktahn)" \
       --eval "(pak::build-core :forkp nil)"
}

package () {
  # install binary
  mkdir -p $pkgdir/usr/bin
  install -m755 paktahn $pkgdir/usr/bin

  # install helper scripts
  mkdir -p $pkgdir/usr/lib/paktahn
  for helper in pkgbuild-helper.sh makepkg-helper.sh; do
    install -m755 "$helper" $pkgdir/usr/lib/paktahn
  done

  # create convenience symlink
  cd $pkgdir/usr/bin
  ln -s paktahn pak
}

md5sums=('aa71c5e639e86bee3afe7d4e27653649'
         'c724ddca867cac0bbf7fce248e1c2748')
sha1sums=('1fb3e04732d00c68e7b8aa7ae0a18e9f98359e5f'
          '946fc5dbadb28373d793c976742b91bff02ff210')
