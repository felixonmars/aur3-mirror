# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=vim-scala-syntax-svn
pkgver=18485
pkgrel=2
pkgdesc="Vim syntax files for the Scala programming language without the evil indent that echoes"
arch=('any')
url="http://www.scala-lang.org/"
license=('unknown')
depends=('vim')
optdepends=('scala: needed to run scala programs')
makedepends=('subversion')
conflicts=('vim-scala-svn' 'vim-scala' 'vim-scala-git')

_svntrunk="http://lampsvn.epfl.ch/svn-repos/scala/scala-tool-support/trunk/src/vim"
_svnmod="vim-scala"


build () {
  cd "$srcdir"

  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver") 
  else
    svn export "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod" --force
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
}

package () {

  cd $srcdir/$_svnmod-build
  for places in ftdetect syntax ;\
  do \
      install -d "$pkgdir/usr/share/vim/vimfiles/$places" ;\
      for files in $places/scala.vim ;\
      do \
	  install -m 644 -t "$pkgdir/usr/share/vim/vimfiles/$places" $files ;\
      done ;\
  done 

  install -D -m 644 README "$pkgdir/usr/share/doc/$pkgname/README"

  rm -rf $srcdir

}
