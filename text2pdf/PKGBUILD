# $Id: PKGBUILD 70823 2010-03-01 22:22:18Z dgriffiths $
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: juergen <juergen@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=text2pdf
pkgver=1.1
pkgrel=1
pkgdesc="Convert text files to PDF"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.eprg.org/pdfcorner/text2pdf/"
source=(http://www.eprg.org/pdfcorner/text2pdf/text2pdf.c http://www.eprg.org/pdfcorner/text2pdf/Makefile http://www.eprg.org/pdfcorner/text2pdf/text2pdf.1)

build() {
  cd ${srcdir}/
  make || return 1
  mkdir -p ${pkgdir}/usr/bin
  make BINDIR=${pkgdir}/usr/bin install
  mkdir -p ${pkgdir}/usr/share/man/man1/
  install ${pkgname}.1 ${pkgdir}/usr/share/man/man1/
#  install -Dm644 ${pkgdir}/usr/share/ratpoison/ratpoison.el \
#n       ${pkgdir}/usr/share/emacs/site-lisp/ratpoison.el || return 1
}

# vim: ts=2 sw=2 et ft=sh
md5sums=('c57f93808682957a30b3179de535ade5'
         '30ece65faac108c5c252ae1c317ca00e'
         '791559dd4270d878aabf3f4b8fbde7f0')
