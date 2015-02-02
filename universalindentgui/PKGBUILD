# Maintainer: Sébastien Dumont <sdumont@masteri2l.org>
# Contributor: Kevin MacMartin <prurigro@gmail.com>

pkgname=universalindentgui
pkgver=1.2.0
pkgrel=3
pkgdesc="A GUI for GNU Indent, Uncrustify, Artistic Styler, PHP Stylist, Ruby Beautify, HTML Tidy and many other"
url="http://universalindent.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qscintilla' 'gawk' 'ruby' 'python2')
optdepends=(
    'astyle: a free, fast and small automatic formatter for C, C++, C sharp and Java'
    'tidyhtml: a tool to tidy down your HTML code'
    'uncrustify: source code beautifier for C-like languages')
source=(
    "http://download.sourceforge.net/sourceforge/universalindent/${pkgname}-${pkgver}.tar.gz"
    "${pkgname}.png"
    "${pkgname}.desktop"
    'no-strip.patch'
    'noupdatecheck.patch'
    'fix_about_dialog.patch')
sha512sums=(
    '73535e2a199f3b0396d2d33cdf6cdf051cc4f01da4907c03ba9fd9fa86033921ff7fc448078ca2d34ae88a421f6ac51ef4c0f98daaceff40d128f55d790e197e'
    'ddbe62cd6367b0a4c5e671ee64b5f77132cb2da1f84bf7890c06c609350b7af4ed1284454e4fd8119ba8f5166ef1fbb3f2507685d91a31a3c11d4507bbe2b4fe'
    '6565a58e284a0e3deaa1becbc542df83483b11acedba6d8cda3763016d07b23867cd0ec42c36ad0824ceedbf4bffe8e3998f28dfc49e0844ffe662d4a07d3b50'
    '8c4972664ae541022d3cfcf3c50b80a7a7bbb7b511808a929d169de2e1dbead054afc7a73fa970b7182488bfdaec8cdf6259eacd6b2bd3cfee67a6d1c5b2b1c0'
    '3141e815f2227bb0e7df90982c3b67b4c4e82026d212300bd5401a76c4e725ba2e7dd88cbbf94efe212938f1ba7c7c0c457b777e7100ddecfe83d7c1af6c6c46'
    '770fae77cea711a6b177b0ce37b84fb2b763b9d311eeaebc41b3966456c7e7e7f58e6f3d775c7e8caa0dc84c958b8833ab7a74d6e7cbdc2226e7123760c24d0b')

prepare() {
    cd ${pkgname}-${pkgver}
    patch -Np1 -i ../no-strip.patch src/UniversalIndentGUI.pro
    patch -p1 < ../noupdatecheck.patch
    patch -p1 < ../fix_about_dialog.patch
    sed -i 's|#! /usr/bin/python|#!/usr/bin/env python2|' indenters/pindent.py
}

build() {
    cd ${pkgname}-${pkgver}
    qmake-qt4 UniversalIndentGUI.pro
    make
}

package() {
    install -Dm644 ${pkgname}.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png
    install -Dm644 ${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
    cd ${pkgname}-${pkgver}
    make INSTALL_ROOT="$pkgdir" install
}
# vim:syntax=sh
