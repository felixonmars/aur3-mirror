# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=vim-scala-svn
pkgver=18485
pkgrel=1
pkgdesc="Vim support files for the Scala programming language"
arch=('any')
url="http://www.scala-lang.org/"
license=('unknown')
depends=('scala' 'vim')
makedepends=('subversion')

_svntrunk="http://lampsvn.epfl.ch/svn-repos/scala/scala-tool-support/trunk/src/vim"
_svnmod="vim-scala"

build() {
  cd "${srcdir}"

  if [ -d "${_svnmod}/.svn" ]; then
    (cd "${_svnmod}" && svn up -r "${pkgver}")
  else
    svn export "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  install -d -m755 "${pkgdir}/usr/share/vim/vimfiles"
  cp -r ftdetect indent plugin syntax "${pkgdir}/usr/share/vim/vimfiles" || return 1
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README" || return 1
}

# vim:set ts=2 sw=2 et:
