# Contributor: Sebastian Voecking <voeck@web.de>

pkgname=root-doc
pkgver=5.34
pkgrel=1
pkgdesc="User and Reference Guide for the ROOT Framework"
arch=(any)
url="http://root.cern.ch"
license=('LGPL2')
depends=('root>=5.34.00')
source=("ftp://root.cern.ch/root/html534.tar.gz"
        "ftp://root.cern.ch/root/doc/Users_Guide_5_26.pdf"
        "ftp://root.cern.ch/root/doc/Users_Guide_5_26_TwoInOne.pdf")
md5sums=('ce407de66e2b42a06f62e12c79578384'
         'da8a7b2ecef8af130fe71f777893e4c9'
         'bed55e3118920c81a33aee3c4f2b271f')
options=('docs')


package() {
  mkdir -p $pkgdir/usr/share/doc/root
  install -m 644 $srcdir/Users_Guide_5_26.pdf $pkgdir/usr/share/doc/root
  install -m 644 $srcdir/Users_Guide_5_26_TwoInOne.pdf $pkgdir/usr/share/doc/root
  mv -r $srcdir/htmldoc $pkgdir/usr/share/doc/root
}

# vim:set ts=2 sw=2 et:
