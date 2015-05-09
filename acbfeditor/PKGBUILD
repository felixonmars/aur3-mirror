# Maintainer: Marius Nestor <marius[at]matamare[dot]ro>

pkgname=acbfeditor
pkgver=0.4
pkgrel=1
pkgdesc="Comic book editor for ACBF and CBZ formats."
url="https://launchpad.net/acbf"
arch=('any')
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'pygtk>=2.12' 'python2-lxml' 'python2-pillow>=1.1.5' 'shared-mime-info')
optdepends=('unzip: for viewing ZIP files containing images')
source=("https://launchpad.net/acbf/trunk/1.0/+download/ACBFEditor-${pkgver}_linux.tar.gz"
	acbfe)
md5sums=('adf9293c9e248d59ad322e42b38890cc' '22eca9865f682cefd793b06cb896f272')

package() {
  # Mime type
  #install -Dm644 acbf.xml $pkgdir/usr/share/mime/packages/acbf.xml
  
  # Program files
  mkdir -p $pkgdir/usr/share/acbfe/src
  cp src/*.py $pkgdir/usr/share/acbfe/src

  # Start file
  install -Dm755 acbfe $pkgdir/usr/bin/acbfe

  # Desktop icon
  install -Dm644 acbfe.desktop $pkgdir/usr/share/applications/acbfe.desktop
  cd images
  install -Dm644 acbfe.png $pkgdir/usr/share/pixmaps/acbfe.png
  
  mkdir -p $pkgdir/usr/share/acbfe/images
  cp acbf.svg acbfe.png $pkgdir/usr/share/acbfe/images
  install -Dm644 acbfe.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/acbfe.svg

  # Fix fonts directory
  sed -i "s|portability.get_fonts_directory()|'/usr/share/fonts/'|" $pkgdir/usr/share/acbfe/src/constants.py
  
  # Fix Python2-pillow
  sed -i "s|Image|PIL.Image|" $pkgdir/usr/share/acbfe/src/acbfe.py
}
