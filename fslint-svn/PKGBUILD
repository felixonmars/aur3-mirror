# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fslint-svn
pkgver=294
pkgrel=1
pkgdesc="A utility to find and clean unwanted or problematic cruft in your files or file names."
arch=('any')
url="http://www.pixelbeat.org/fslint/"
license=('GPL')
depends=('pygtk')
makedepends=('subversion')
provides=('fslint')
conflicts=('fslint')
install=fslint.install
source=("fslint::svn+http://fslint.googlecode.com/svn/trunk/")
md5sums=('SKIP')
_svnmod="fslint"

pkgver() {
  cd "$srcdir/$_svnmod"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

package() {
cd "$srcdir/$_svnmod"

#install directories
  install -d "${pkgdir}"/usr/share/{man/man1,doc/${_svnmod}}
  install -d "${pkgdir}"/usr/share/${_svnmod}/${_svnmod}/{fstool,supprt/rmlint}

  sed -i -e s_^liblocation=.*_liblocation=\'/usr/share/${_svnmod}\'_ ${_svnmod}-gui

  install -D -m755 ${_svnmod}-gui "${pkgdir}"/usr/bin/${_svnmod}-gui
  install -D -m644 ${_svnmod}.glade \
	  "${pkgdir}"/usr/share/${_svnmod}/${_svnmod}.glade
  install -D -m755 -t \
	  "${pkgdir}"/usr/share/${_svnmod}/${_svnmod} \
	  ${_svnmod}/find* ${_svnmod}/zipdir ${_svnmod}/${_svnmod}
  install -D -m755 -t \
	  "${pkgdir}"/usr/share/${_svnmod}/${_svnmod}/fstool \
	  ${_svnmod}/fstool/*
  install -D -m755 -t \
	  "${pkgdir}"/usr/share/${_svnmod}/${_svnmod}/supprt \
	  ${_svnmod}/supprt/get* ${_svnmod}/supprt/fslver
  install -D -m755 -t \
	  "${pkgdir}"/usr/share/${_svnmod}/${_svnmod}/supprt/rmlint \
	  ${_svnmod}/supprt/rmlint/*

#icons
  install -D -m644 ${_svnmod}_icon.png \
	  "${pkgdir}"/usr/share/pixmaps/${_svnmod}_icon.png
  install -D -m644 ${_svnmod}_icon.png \
	  "${pkgdir}"/usr/share/${_svnmod}/${_svnmod}_icon.png

#shortcut
  install -D -m644 ${_svnmod}.desktop \
	  "${pkgdir}"/usr/share/applications/${_svnmod}.desktop

#locales
  make -C po DESTDIR="${pkgdir}"/usr DATADIR=share install

#man pages
  cp -r "${srcdir}"/${_svnmod}/man/* "${pkgdir}"/usr/share/man/man1

#doc files
  cp -r "${srcdir}"/${_svnmod}/doc/* "${pkgdir}"/usr/share/doc/${_svnmod}

#make it use Python2
  sed -i 's/env python/env python2/g' "${pkgdir}"/usr/bin/${_svnmod}-gui
  sed -i 's/env python/env python2/g' \
      "${pkgdir}"/usr/share/${_svnmod}/${_svnmod}/supprt/rmlint/merge_hardlinks
  sed -i 's/env python/env python2/g' \
      "${pkgdir}"/usr/share/${_svnmod}/${_svnmod}/supprt/rmlint/fixdup
  sed -i 's/env python/env python2/g' \
      "${pkgdir}"/usr/share/${_svnmod}/${_svnmod}/fstool/dupwaste
}
