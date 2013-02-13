# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=pdfeditor
pkgver=1.8.13
pkgrel=1
pkgdesc="Master PDF Editor is a complete solution for creation and editing PDF and XPS files (free version)"
url="http://code-industry.net/pdfeditor.php"
arch=('i686' 'x86_64')
license=('commercial')
depends=('gcc-libs' 'libxext' 'libsm')
source=("http://code-industry.net/public/MasterPDFEditor-${pkgver}.i386.tar.gz" "pdfeditor.desktop")
md5sums=('db5c8631fcbc0879078ac9d8ff5f4c46'
         'a523f9d6fef9803695fd422300b0026b')

# no static version for x86_64 available as of 1.7.90/1.7.91 :-(
[ "$CARCH" = "x86_64" ] && {
  source=("http://code-industry.net/public/MasterPDFEditor-${pkgver}.x86_64.tar.gz" "pdfeditor.desktop")
  md5sums=('b58bde50554705e3d1769edf19156222' 'a523f9d6fef9803695fd422300b0026b')
 }

build() {
true
}

package() {
mkdir -p ${pkgdir}/usr/{share/pdfeditor,bin}
cd $srcdir/MasterPDFEditor
/bin/tar cf - * | ( cd ../../pkg/usr/share/pdfeditor; tar xfp - )
ln -s /usr/share/pdfeditor/pdfeditor $pkgdir/usr/bin/pdfeditor
install -D -m644 $srcdir/MasterPDFEditor/pdfeditor.png $pkgdir/usr/share/pixmaps/pdfeditor.png
install -D -m644 $srcdir/pdfeditor.desktop $pkgdir/usr/share/applications/pdfeditor.desktop
}
