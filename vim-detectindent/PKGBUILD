# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgname=vim-detectindent
pkgver=20111103
pkgrel=1
pkgdesc="Vim script for automatically detecting indent setting"
arch=('any')
url="http://github.com/ciaranm/detectindent"
license=('custom:vim')
groups=('vim-plugins')
conflicts=('vim-detectindent')
depends=('vim')
makedepends=('git')
source=(license.txt)
md5sums=('9cbc86548400621ea7ad55d4386d81e2')
_gitroot="git://github.com/ciaranm/detectindent.git"
_gitname="detectindent"

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  local _installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -d "$_installpath"
  cp -R * "$_installpath"
  install -Dm644 "${srcdir}"/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
