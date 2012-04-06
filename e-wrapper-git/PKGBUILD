# Maintainer: Kyrylo Silin <kyrylosilin@gmail.com>

pkgname="e-wrapper-git"
pkgver=9999
pkgrel=2
pkgdesc='e is a smart wrapper for EDITOR environment variable written in Bourne shell. It enhances any editor with some user friendly features.'
url="https://github.com/knu/e"
arch=('any')
license=('Simplified BSD License')
depends=('bash')
makedepends=('git')

_gitroot="https://github.com/knu/e.git"
_gitrepo="e"

build()
{
  cd "$srcdir"
  msg "Connecting to Git server..."

  if [ -d $_gitrepo ]; then
    cd $_gitrepo
    git pull origin || return 1
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitrepo || return 1
  fi

  msg "Git checkout done or server timeout."
}

package()
{
  cd "$srcdir/$_gitrepo"
  install -D -m644 LICENSE.txt         "${pkgdir}/usr/share/licenses/${_gitrepo}/LICENSE"
  install -D -m644 "man/${_gitrepo}.1" "${pkgdir}/usr/share/man/man1/${_gitrepo}.1"
  install -D -m755 "bin/${_gitrepo}"   "${pkgdir}/usr/bin/${_gitrepo}"
}
