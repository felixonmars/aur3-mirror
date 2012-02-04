# Manteiner: Diego José <diegoxter1006@gmail.com>

pkgname=neembuuuploader
pkgver=2.6
pkgrel=1
pkgdesc="Neembuu Uploader v2.3 is a free and opensource Java application that uploads files simultaneously to multiple filehosts and lets you manage the download and delete URLs."
arch=('any')
url="http://neembuuuploader.sf.net/"
depends=('java-runtime')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/neembuuuploader/NeembuuUploader.v$pkgver.zip
	http://a.fsdn.com/con/icons/ne/neembuuuploader@sf.net/NU2.2+.png
	neembuuuploader.desktop
	)
md5sums=('37c6739ba1f566518bb55e76294aac2b' 'aa26c114b2a189d043459fd3b975e8c2'
	 '80855eed728d3bc273c7329e620e2698')
license=('GPLv3')

build() {
    cd $srcdir
    install -d "$pkgdir/usr/share"
    unzip NeembuuUploader.v$pkgver.zip -d $pkgdir/usr/share 
    install -d "$pkgdir/usr/bin"
    echo "#!/bin/bash
java -jar /usr/share/NeembuuUploader\ v$pkgver/NeembuuUploader.jar" > $pkgdir/usr/bin/neembuu
    chmod +x $pkgdir/usr/bin/neembuu

    install -D -m644 "$srcdir/neembuuuploader.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -D -m644 "$srcdir/NU2.2+.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
        }
