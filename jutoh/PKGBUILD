# contrib: kevku <kevku@gmx.com>
pkgname=jutoh
pkgver=2.28
pkgrel=1
pkgdesc="An ebook creation tool"
arch=('x86_64' 'i686')
url="http://www.jutoh.com"
license=('custom')
depends=('desktop-file-utils' 'libsm' 'gtk2' 'hicolor-icon-theme' 'libpng12')
optdepends=('libjpeg6: jpg support'
            'java-runtime: epubcheck support')
install='jutoh.install'
source=("http://www.jutoh.com/Jutoh-$pkgver-x86_64.tar.gz"
        "jutoh.sh"
	"mime.patch")
md5sums=('03c9b8069f4772d337e9d2377f594ade'
         '69a45ae0f576e06ac6df6074df0eec64'
         '46f4ac6f25ff486dad5cfc01e7448fd1')
if [[ $CARCH == 'i686' ]]; then
source[0]="http://www.jutoh.com/Jutoh-$pkgver-i386.tar.gz"
md5sums[0]=5933fba69ce1add08cfabb80aac26184
fi



package() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    tar -xzf "$srcdir/JutohData.tar.gz"
    patch -Np1 -i $srcdir/mime.patch


    install -dm755 $pkgdir/usr/share/jutoh	
    cp -R * $pkgdir/usr/share/jutoh

    install -Dm755 $srcdir/jutoh.sh $pkgdir/usr/bin/jutoh
    install -Dm755 $srcdir/jutoh.sh $pkgdir/usr/bin/jutoh2
    install -Dm755 jutoh2.desktop $pkgdir/usr/share/applications/jutoh2.desktop
    install -Dm644 license.txt $pkgdir/usr/share/licenses/jutoh/LICENCE
    install -Dm644 jutoh2.xml $pkgdir/usr/share/mime/packages/jutoh2.xml
    install -Dm644 jutoh2.mime $pkgdir/usr/share/mime-info/jutoh2.mime
    install -Dm644 jutoh2.keys $pkgdir/usr/share/mime-info/jutoh2.keys
    install -Dm644 appicons/jutoh128x128.png $pkgdir/usr/share/pixmaps/jutoh.png
    
    install -Dm644 appicons/jutoh128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/jutoh.png
    install -Dm644 appicons/jutoh16x16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/jutoh.png
    install -Dm644 appicons/jutoh22x22.png $pkgdir/usr/share/icons/hicolor/22x22/apps/jutoh.png
    install -Dm644 appicons/jutoh32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/jutoh.png
    install -Dm644 appicons/jutoh48x48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/jutoh.png

    install -Dm644 appicons/jutoh_document128x128.png $pkgdir/usr/share/icons/hicolor/128x128/mimetypes/jutoh-document.png
    install -Dm644 appicons/jutoh_document16x16.png $pkgdir/usr/share/icons/hicolor/16x16/mimetypes/jutoh-document.png
    install -Dm644 appicons/jutoh_document24x24.png $pkgdir/usr/share/icons/hicolor/24x24/mimetypes/jutoh-document.png
    install -Dm644 appicons/jutoh_document32x32.png $pkgdir/usr/share/icons/hicolor/32x32/mimetypes/jutoh-document.png
    install -Dm644 appicons/jutoh_document48x48.png $pkgdir/usr/share/icons/hicolor/128x128/mimetypes/jutoh-document.png

    install -Dm644 appicons/jutoh_document_script128x128.png $pkgdir/usr/share/icons/hicolor/128x128/mimetypes/jutoh-document-script.png
    install -Dm644 appicons/jutoh_document_script16x16.png $pkgdir/usr/share/icons/hicolor/16x16/mimetypes/jutoh-document-script.png
    install -Dm644 appicons/jutoh_document_script24x24.png $pkgdir/usr/share/icons/hicolor/24x24/mimetypes/jutoh-document-script.png
    install -Dm644 appicons/jutoh_document_script32x32.png $pkgdir/usr/share/icons/hicolor/32x32/mimetypes/jutoh-document-script.png
    install -Dm644 appicons/jutoh_document_script48x48.png $pkgdir/usr/share/icons/hicolor/128x128/mimetypes/jutoh-document-script.png


    rm -r $pkgdir/usr/share/jutoh/{jutoh2.applications,jutoh2.desktop,jutoh2.keys,jutoh2.mime,jutoh2.xml,jutoh_eeepc.xml,x-jutoh2.desktop,appicons}

}
