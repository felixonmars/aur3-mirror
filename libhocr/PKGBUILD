# Maintainer: Yoel Lion <yoel3ster at gmail dot com>

pkgname=libhocr
pkgver=0.10.17
pkgrel=15
pkgdesc="HOCR is a Hebrew character recognition library. libhocr comes with sane-pygtk"
depends=('swig' 'pygtk' 'hspell' 'fftw' 'tesseract' 'python-imaging')
arch=('i686' 'x86_64')
url="http://hocr.berlios.de/"
license=('GPLv3')
source=(http://download.berlios.de/hocr/$pkgname-$pkgver.tar.gz configure.patch)
md5sums=('6148b9e175cc633a1d2deaa559abc4b8' '6aa5880c82b198fba7529466fc197c50')

build() {
cd $srcdir/$pkgname-$pkgver
patch -Np0 -i $srcdir/configure.patch
cd $srcdir/$pkgname-$pkgver/examples/hocr-gtk
sed -i '1c#!/usr/bin/env python2' hocr-gtk sane-pygtk
cd $srcdir/$pkgname-$pkgver
./configure --prefix=/usr
make
make DESTDIR=$pkgdir install
}

