# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=acbfviewer
pkgver=1.03
pkgrel=1
pkgdesc="Comic book viewer for ACBF and CBZ formats."
arch=('any')
url="https://launchpad.net/acbf"
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'pygtk' 'python2-lxml' 'python2-matplotlib' 'python2-pillow' 'shared-mime-info')
optdepends=('unzip: for viewing ZIP files containing images')
install=$pkgname.install
source=(https://launchpad.net/acbf/trunk/1.0/+download/ACBFViewer-${pkgver}_linux.tar.gz
        acbfv)
md5sums=('c896ce7d612e38d5a0d127add9307ee7'
         '02b119d7c2fe15f4394e9e5e92cb230b')


package() {
  # Mime type
  install -Dm644 acbf.xml $pkgdir/usr/share/mime/packages/abcf.xml
  
  # Program files
  mkdir -p $pkgdir/usr/share/acbfv/src
  cp src/*.py $pkgdir/usr/share/acbfv/src

  # Start file
  install -Dm755 acbfv $pkgdir/usr/bin/acbfv

  # Desktop icon
  install -Dm644 acbfv.desktop $pkgdir/usr/share/applications/acbfv.desktop
  cd images
  install -Dm644 acbfv.png $pkgdir/usr/share/pixmaps/acbfv.png
  
  # Icons
  for i in 16x16 22x22 24x24 32x32 48x48 
  do
  install -Dm644 $i/application-x-acbf.png $pkgdir/usr/share/icons/hicolor/$i/mimetypes/application-x-acbf.png
  install -Dm644 $i/acbfv.png $pkgdir/usr/share/icons/hicolor/$i/apps/acbfv.png
  done
  
  mkdir -p $pkgdir/usr/share/acbfv/images
  cp acbf.svg acbfv.png $pkgdir/usr/share/acbfv/images
  install -Dm644 acbfv.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/acbfv.svg

  # Fix fonts directory
  #sed -i "s|portability.get_fonts_directory()|'/usr/share/fonts/'|" $pkgdir/usr/share/acbfv/src/constants.py
}