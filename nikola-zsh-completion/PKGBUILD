# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <ivoarch@arch>
_pkgname=nikola-zsh-completion
pkgname=$_pkgname
pkgver=269cae3
pkgrel=1
pkgdesc="ZSH Completion script for Nikola (Static Site and Blog Generator)"
arch=('i686' 'x86_64')
url="https://github.com/ivoarch/nikola-zsh-completion"
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$_pkgname::git+git://github.com/ivoarch/nikola-zsh-completion.git")
md5sums=('SKIP')
noextract=()
_gitname="nikola-zsh-completion"

pkgver() {
 cd $srcdir/$_gitname
 git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  cp -R ./ "${pkgdir}/usr/share/zsh/site-functions"
}

# vim:set ts=2 sw=2 et:
