# Contributor michalzxc <dla_www@op.pl>
pkgname=napiopensub
pkgdesc="script which download polish and english subtitles for movies, and convert them to utf"
pkgver=0.142
pkgrel=1
arch=(i686 x86_64)
url="http://tinyurl.com/275plv"
source=('napi.py' 'napi-zenity' 'pl_PL.po')
conflicts=('napi')                                                                     
provides=('napi')
license=("GPL")
depends=('python' 'p7zip' 'zenity' 'text2utf')

build() { 
    cd $startdir/src/
    msgfmt pl_PL.po -o napipl_PL.mo
    install -D -m644 $startdir/src/napipl_PL.mo $startdir/pkg/usr/share/locale/pl_PL/LC_MESSAGES/napi.mo
    install -D -m755 $startdir/src/napi.py $startdir/pkg/usr/bin/napi
    install -D -m755 $startdir/src/napi-zenity $startdir/pkg/usr/bin/napi-zenity

}

md5sums=('79b60d98d0aa51998e052b026c2ee2a6'
         '1bb47b000595858456cbc3a3f9968ddd'
         'e6280773c842b56dead37bc0b1aeac6b')