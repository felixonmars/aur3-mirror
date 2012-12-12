# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=acbfviewer
pkgver=0.94
pkgrel=1
pkgdesc="Comic book viewer for ACBF and CBZ formats."
arch=('any')
url="https://launchpad.net/acbf"
license=('GPL2')
depends=('pygtk>=2.12' 'python2' 'python2-imaging>=1.1.5' 'python2-lxml')
source=(https://launchpad.net/acbf/trunk/1.0/+download/ACBFViewer-${pkgver}_linux.tar.gz
        acbfv)
md5sums=('053876253cb3963933f54df38339d1c1'
         '02b119d7c2fe15f4394e9e5e92cb230b')

build() {
  cd $srcdir

  install -Dm644 acbf.xml $pkgdir/usr/share/mime/packages/abcf.xml
  
  mkdir -p $pkgdir/usr/share/acbfv/src
  cp src/*.py $pkgdir/usr/share/acbfv/src

  # Desktop icon
  install -Dm644 acbfv.desktop $pkgdir/usr/share/applications/acbfv.desktop

  # Executable in path
  install -Dm755 $startdir/acbfv $pkgdir/usr/bin/acbfv
  
  cd images
  for i in 16x16 22x22 24x24 32x32 48x48 
  do
  install -Dm644 $i/application-x-acbf.png $pkgdir/usr/share/icons/hicolor/$i/mimetypes/application-x-acbf.png
  install -Dm644 $i/acbfv.png $pkgdir/usr/share/icons/hicolor/$i/apps/acbfv.png
  done
  
  mkdir -p $pkgdir/usr/share/acbfv/images
  cp acbf.svg acbfv.png $pkgdir/usr/share/acbfv/images
  install -Dm644 acbfv.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/acbfv.svg

  # Fix fonts path
  sed -i "s|portability.get_fonts_directory()|'/usr/share/fonts/'|" $pkgdir/usr/share/acbfv/src/constants.py
}