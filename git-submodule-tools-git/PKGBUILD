# Contributor: Sebastien Binet <binet@cern.ch>
pkgname=git-submodule-tools-git
pkgver=20121218
pkgrel=1
pkgdesc="git submodule scripts"
arch=(any)
url="https://github.com/mana-fwk/git-submodule-tools"
license=('GPL2')
depends=('git')
makedepends=('git')
provides=('git-submodule-tools')
conflicts=('git-submodule-tools')

_gitroot="git://github.com/mana-fwk"
_gitname="git-submodule-tools"

build() {
  cd $startdir/src/

  msg "Connecting to GIT server..."
  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg2 "Finished updating the local repository!"
  else
    git clone ${_gitroot}/${_gitname}.git "${srcdir}/${_gitname}" || return 1
    msg2 "Initial pull complete!"
  fi

  cd $startdir/src/$_gitname
  msg "generating man pages..."
  PATH=`pwd`:$PATH ./gen-man.sh

}

package()
{
  cd "$srcdir/$_gitname"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share"
  for bin in git-*; do
    install -m755 $bin $pkgdir/usr/bin/$(basename $bin)
  done
  mv man "$pkgdir/usr/share/."
}
# vim:set ts=2 sw=2 et:


