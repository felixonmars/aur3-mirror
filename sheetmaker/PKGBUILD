pkgname=sheetmaker
pkgver=1.29
pkgrel=2
pkgdesc="sheetmaker."
arch=('any')
url="http://bunyipawonga.org/sheetmaker/index.php?SN=&US="
license=('EPL')
source=("http://www.bunyipawonga.org/files/sheetmaker_${pkgver//./_}_1.zip"
        "SheetMaker.conf")
md5sums=('bbfe14f62af65be74b03c57156cbaebc'
         '0593763f92db38c888b75366e59b3537')

depends=('gtk2-perl' 'mediainfo'  'perl-libwww'  'perl-file-finder'  'perl-xml-rpc' 'perl-xml-tokeparser' 'perl-xml-bare' 'perl-json-parse')



package()
{
    cd "$srcdir"
    install -Dm644 LICENSE "${pkgdir}/usr/share/sheetmaker/LICENSE"
    install -Dm644 SheetMaker.conf "${pkgdir}/usr/share/sheetmaker/SheetMaker.conf"
    install -Dm644 SheetMaker.data "${pkgdir}/usr/share/sheetmaker/SheetMaker.data"
    install -Dm644 SheetMaker.ini "${pkgdir}/usr/share/sheetmaker/SheetMaker.ini"
    install -Dm755 SheetMaker.pl "${pkgdir}/usr/share/sheetmaker/SheetMaker.pl"
    install -Dm644 collectors.pl "${pkgdir}/usr/share/sheetmaker/collectors.pl"
    install -Dm644 editgui.pl "${pkgdir}/usr/share/sheetmaker/editgui.pl"
    install -Dm644 optionsgui.pl "${pkgdir}/usr/share/sheetmaker/optionsgui.pl"
    install -Dm644 settingsgui.pl "${pkgdir}/usr/share/sheetmaker/settingsgui.pl"
    install -Dm644 viewgraphics.pl "${pkgdir}/usr/share/sheetmaker/viewgraphics.pl"
    
    cp -R images "${pkgdir}/usr/share/sheetmaker/"
    
    cd "${pkgdir}"
    mkdir usr/bin/
    echo '#!/bin/sh' > usr/bin/sheetmaker
    echo 'cd /usr/share/sheetmaker/' >> usr/bin/sheetmaker
    echo './SheetMaker.pl $@' >> usr/bin/sheetmaker
    chmod +x usr/bin/sheetmaker
}
