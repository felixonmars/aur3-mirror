# Contributor: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=mkv2mp4-svn
pkgver=11
pkgrel=3
pkgdesc="Remux mkv files to mp4 files compatible with various standalone players"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://mkv2mp4.googlecode.com"
depends=('python2' 'mkvtoolnix' 'ffmpeg' 'gpac')
makedepends=('subversion')
source=()
md5sums=()
_svntrunk=http://mkv2mp4.googlecode.com/svn/trunk 
_svnmod=mkv2mp4-read-only

build() {
  cd $srcdir
  msg "Updating mkv2mp4 SVN..."
  svn co $_svntrunk -r $pkgver $svnmod
  msg "SVN checkout done or server timeout"
  msg "Python2 fix..."
  sed -i 's_#!/usr/bin/python_#!/usr/bin/env python2_' $srcdir/trunk/mkv2mp4.py
  msg "Instalation..."
  install -D -m755 $srcdir/trunk/mkv2mp4.py $pkgdir/usr/bin/mkv2mp4 || return 1
  install -D -m644 $srcdir/trunk/COPYING $pkgdir/usr/share/licenses/$pkgname || return 1
  }
