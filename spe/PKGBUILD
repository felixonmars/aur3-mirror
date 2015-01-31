# Maintainer: Simon Thorpe <simon@hivetechnology.com.au>
# Contributor: Ashok Gautham <ScriptDevil@gmail.com>
pkgname=spe
pkgver=0.8.4.h
pkgrel=2
pkgdesc="Stani's Python Editor (SPE) is a cross-platform IDE for Python."
arch=('i686' 'x86_64')
url="http://pythonide.stani.be/"
license=('GPL')
depends=('wxpython>=2.8' 'pychecker')
optdepends=('wxglade>=0.6.1' 'winpdb>=1.3.2')
source=("http://sourceforge.net/projects/python.berlios/files/spe-0.8.4.h-wx2.6.1.0.tar.gz")
md5sums=('55230b8b643b273912a1d6c3163cca27')

package() {
  cd $srcdir/$pkgname-$pkgver || return 1

  rm -rf ./_spe/plugins/winpdb
  rm -rf ./_spe/plugins/wxGlade
  rm -rf ./_spe/plugins/XRCed

  find . \( -name "*.wxg" -or -name "*.bat" \) -exec rm -f {} \;
  find . -type f -print0 | xargs -0 -n 250 chmod a-x
  find . -type f | xargs egrep -l '\#!/usr/bin/env|\#!BPY' | xargs chmod a+x
  find . -name "Child.py" -print0 | xargs -0 -n 250 chmod a-x
  find . \( -name "*.py" -or -name "*.html" -or -name "*.htm" -or -name "*.txt" -or -name "COPYING" -or -name "NEWS" \) -exec sed -i 's/\r//' {} \;

  #to get current path: python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"
  mkdir -p $pkgdir/usr/lib/python2.5/site-packages/spe/
  cp -Rp ./* $pkgdir/usr/lib/python2.5/site-packages/spe/

  mkdir -p $pkgdir/usr/bin/
  ln -s /usr/lib/python2.5/site-packages/spe/_spe/SPE.py $pkgdir/usr/bin/spe

  install -D -m644 $pkgname.desktop \
  $pkgdir/usr/share/applications/$pkgname.desktop || return 1
  install -D -m644 _spe/skins/default/blenpy.png \
  $pkgdir/usr/share/icons/spe.png || return 1
  
  # force python2
  sed -i 's/#!\/usr\/bin\/env python$/#!\/usr\/bin\/env python2/' $pkgdir/usr/lib/python2.5/site-packages/spe/_spe/SPE.py
}
