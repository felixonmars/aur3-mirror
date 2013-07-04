# Contributors: Osman Alperen Elhan <alperen@elhan.org>
#               Ahmet Yasin Uslu <yasin@nepjua.org>

pkgname=yacreader-bin
pkgver=6.5.3
pkgrel=1
pkgdesc="Yet Another Comic Reader!"
arch=('x86_64')
url="http://www.yacreader.com/"
license=('GPL')
depends=('qt4' 'poppler-qt')
source=("yacreader-${pkgver}.tar.gz::http://cdn.bitbucket.org/luisangelsm/yacreader/downloads/YACReader-${pkgver}-X11-x64-qt4.tar.gz"
        "yacreaderlibrary.desktop"
        "yacreader.desktop")
INTEGRITY_CHECK=('sha512')
sha512sums=('bec019f938ca9233d4ea999e6917b5e5064446166b1166097f717fed337e5bdb25eca24b287ba9b0acb7ba21af177dcc2e220153f6916683741eef6dc5801367'
            'e2b047878b86ab1d30a4ba905c87f5fc9a7d6860932d7eda07982d4fbc34557541ac5719f6b16b5ebc0095f27ab30c49a8d375e0bc3e225d592ffe5a3900a69c'
            'ff2045a2cde7fbf876405142a7fcc8794a7178c11643943a154f5be24e3401e44d8d273ceb15badf4a17f28caf04acfda2b3a28bb3a6075c7231c73ad26d102c')

build() {
    # Get binary sources.
    tar -xzf yacreader-$pkgver.tar.gz
    mv "YACReader-$pkgver X11-x64-qt4" "YACReader"
}
package() {
    install -d $pkgdir/{opt,usr/bin,usr/lib}
    # Install files.
    cd $srcdir
    cp -R $srcdir/YACReader $pkgdir/opt
    chmod 777 -R $pkgdir/opt/YACReader
    # Make YACReader binaries executable.
    chmod 755 $pkgdir/opt/YACReader/YACReader{,Library}
    # Install desktop files
    install -D -m644 yacreader.desktop $pkgdir/usr/share/applications/yacreader.desktop
    install -D -m644 yacreaderlibrary.desktop $pkgdir/usr/share/applications/yacreaderlibrary.desktop

    # Create symlinks
    ln -s /opt/YACReader/YACReader{,Library} $pkgdir/usr/bin/
    ln -s /usr/lib/libpoppler-qt4.so $pkgdir/usr/lib/libpoppler-qt4.so.3
}