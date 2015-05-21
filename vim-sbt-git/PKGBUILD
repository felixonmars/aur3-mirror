# Maintainer: Chris Chapman <chris@pentandra.com>
pkgname=vim-sbt-git
pkgver=20150519
pkgrel=1
pkgdesc="Vim support files for sbt configuration files"
arch=('any')
url="https://github.com/derekwyatt/vim-sbt/tree/master"
license=('unknown')
depends=('vim-runtime' 'vim-scala-git')
makedepends=('git')

_gitroot="https://github.com/derekwyatt/vim-sbt.git"
_gitname=vim-sbt

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
}

package() {
  cd "$srcdir/$_gitname"
  install -d -m755 "${pkgdir}/usr/share/vim/vimfiles"
  cp -r ftdetect syntax "${pkgdir}/usr/share/vim/vimfiles" || return 1
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README" || return 1
}

# vim:set ts=2 sw=2 et:
