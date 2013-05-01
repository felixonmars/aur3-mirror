# Contributor: helq <linuxero789@gmail.com>
# Based: vim-scala-git by: sumito3478 <sumito3478@gmail.com>
pkgname=vim-scala
pkgver=20130501
pkgrel=1
pkgdesc="Vim support files for the Scala programming language, from raw GitHub, download only config files not all git-repo"
arch=('any')
url="https://github.com/scala/scala-dist/tree/master/tool-support/src/vim"
license=('unknown')
depends=('vim-runtime')
makedepends=()
provides=('vim-scala-svn' 'vim-scala-git')
conflicts=('vim-scala-svn' 'vim-scala-git')

build() {
  cd "$srcdir"

  raw="https://raw.github.com/scala/scala-dist/master/tool-support/src/vim"
  for i in {syntax,indent,ftdetect}; do
    curl --create-dirs -Sso $i/scala.vim $raw/$i/scala.vim
  done
  curl --create-dirs -Sso plugin/31-create-scala.vim $raw/plugin/31-create-scala.vim
  curl -Sso README $raw/README
}

package() {
  cd "$srcdir"
  install -d -m755 ${pkgdir}/usr/share/vim/vimfiles/{ftdetect,indent,plugin,syntax}
  cp -nr ftdetect indent plugin syntax "${pkgdir}/usr/share/vim/vimfiles" || return 1
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README" || return 1
}

# vim:set ts=2 sw=2 et:
