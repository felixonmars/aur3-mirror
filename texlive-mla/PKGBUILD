# Original autor: rlp <mail@robert.io> 
# Maintainer: rlp <mail@robert.io>
# Last edited: 12th August 2012

pkgname=texlive-mla
pkgver=1.0
pkgrel=1
license=('LPPL')
pkgdesc="A LaTeX package by Ryan Aycock for formatting papers in the MLA style"
url="http://ctan.mirrorcatalogs.com/macros/latex/contrib/mla-paper/"
arch=('any')
install=texlive-mla.install
source=(http://ctan.mirrorcatalogs.com/macros/latex/contrib/mla-paper/mla.sty)
md5sums=('1bfb234f232546e1bfb2b7c1a9df1181')

build()
{
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/mla
  cp $srcdir/mla.sty $pkgdir/usr/share/texmf/tex/latex/mla
}

