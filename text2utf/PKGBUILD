# Contributor michalzxc <dla_www@op.pl>
pkgname=text2utf
pkgdesc="script which converting text files to utf with support for zenity"
pkgver=0.143
pkgrel=1
arch=(i686 x86_64)
url="http://tinyurl.com/24h8xs"
source=('text2utf.py' 'text2utf-zenity' 'pl_PL.po')
license=("GPL")
depends=('psiconv' 'hd2u')

build() {
    cd $startdir/src/
    msgfmt pl_PL.po -o text2utfpl_PL.mo
    install -D -m644 $startdir/src/text2utfpl_PL.mo $startdir/pkg/usr/share/locale/pl_PL/LC_MESSAGES/text2utf.mo 
    install -D -m755 $startdir/src/text2utf.py $startdir/pkg/usr/bin/text2utf
    install -D -m755 $startdir/src/text2utf-zenity $startdir/pkg/usr/bin/text2utf-zenity

}

md5sums=('905ace184cca92d86da24cebf25167b4'
         '2d08dabd4f1c0ff0b40f85e9fa4b5a26'
         '43585410737af80a3b59cb869c225bb8')
