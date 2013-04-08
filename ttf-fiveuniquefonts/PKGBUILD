# Contributor : arch@johnea.net
# 2013-04-07
pkgname=ttf-fiveuniquefonts
pkgver=1.0
pkgrel=1
pkgdesc="5 unique free Japanese fonts"
url="http://www.jay-han.com/2008/01/20/5-unique-free-japanese-fonts-download/"
# Aoyagi Kouzan
# http://musashi.or.tv/aoyagikouzanfontt.htm
# Kiroji
# http://www.ez0.net/distribution/font/kiloji/
# Anzumoji
# http://www8.plala.or.jp/p_dolce/font1.html
# Uzura font
# http://azukifont.com/font/uzura.html
#url="http://azukifont.com/font/uzurasample.gif"
# Azuki font
# http://azukifont.com/font/azuki.html
license=('custom')
arch=('any')
depends=('fontconfig')
install=ttf.install
source=(http://azukifont.com/font/uzurafont100.zip
        http://azukifont.com/font/azukifont121.zip
        http://www.ez0.net/wp-content/uploads/distribution/font/kiloji/kiloji_2.1.0.zip
        apjfont.zip::http://cgi38.plala.or.jp/p_dolce/dlcount/dlcount.cgi?f=6_1
        http://ftp.de.debian.org/debian/pool/main/f/fonts-aoyagi-kouzan-t/fonts-aoyagi-kouzan-t_20051011.orig.tar.gz)
md5sums=('90835806fe50b0f24a548fa12dd6e616'
         'e2f0013a994c5e6b30b254c0e45633fc'
         '2ac79753ad92cffb6163651f7b01f099'
         '7c0c7d1131ba01ed605fc968e4d5ac25'
         'edd221091392066a09dd642f39481206')

build() {

    # Uzura Font
    cd $srcdir/uzurafont100/
    # Install fonts
    mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
    install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
    # Install doc
    mkdir -p ${startdir}/pkg/usr/share/doc/${pkgname}/Uzura
    install -m644 *.txt ${startdir}/pkg/usr/share/doc/${pkgname}/Uzura/

    # Azuki Font
    cd $srcdir/azukifont121/
    # Install fonts
    install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
    # Install doc
    mkdir -p ${startdir}/pkg/usr/share/doc/${pkgname}/Azuki
    install -m644 *.txt ${startdir}/pkg/usr/share/doc/${pkgname}/Azuki/

    # AP Japanese Font
    cd $srcdir/apjfont/
    # Install fonts
    install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
    # Install doc
    mkdir -p ${startdir}/pkg/usr/share/doc/${pkgname}/APJapanese
    install -m644 *.txt ${startdir}/pkg/usr/share/doc/${pkgname}/APJapanese/
    # Don't know why, but when in the apjfont/ dir, the non-ascii subdir is not found
    cd $srcdir/
    find . -type f -name *.gif -exec cp -p {} ${startdir}/pkg/usr/share/doc/${pkgname}/APJapanese/ \;

    # Kiloji Font
    cd $srcdir/
    # Install fonts
    install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
    # Install license
    mkdir -p ${startdir}/pkg/usr/share/licenses/custom/${pkgname}/Kiloji
    install -m644 License.txt ${startdir}/pkg/usr/share/licenses/custom/${pkgname}/Kiloji/
    # Install doc
    mkdir -p ${startdir}/pkg/usr/share/doc/${pkgname}/Kiloji
    install -m644 Collecting.txt ${startdir}/pkg/usr/share/doc/${pkgname}/Kiloji/Collecting.txt

    # Aoyagi Kouzan Font
    cd $srcdir/ttf-aoyagikouzan-t-20051011.orig/
    # Install fonts
    install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/

}
