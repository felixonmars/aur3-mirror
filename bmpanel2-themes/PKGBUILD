#Contributor mathieui <mathieui@mathieui.net>

pkgname=bmpanel2-themes
pkgver=0.1
pkgrel=1
pkgdesc='Themes collection for bmpanel2'
url='http://code.google.com/p/bmpanel2/wiki/ThemeGallery'
license='GPL'
arch=('i686' 'x86_64')
depends=('bmpanel2-git')
source=("http://bmpanel2.googlecode.com/files/Cocoa%20-%20BMPanel2.tar.gz"
        "http://bmpanel2.googlecode.com/files/Knurra%20-%20BMPanel2.tar.gz"
        "http://bmpanel2.googlecode.com/files/Kupo%20-%20BMPanel2.tar.gz"
        "http://bmpanel2.googlecode.com/files/Kupo%20Finale%20-%20BMPanel2.tar.gz"
        "http://bmpanel2.googlecode.com/files/PuckoModern%20-%20BMPanel2.tar.gz"
        "http://bmpanel2.googlecode.com/files/isotop.tar.gz"
        "http://bmpanel2.googlecode.com/files/muin.tar.gz")
md5sums=('591897726cf4b28db391259bfb27f716'
         'f4c7689b8ba9734c92fc82dab590d791'
         '065d5a2bd87f42f33daff252278dda04'
         '09ddea376eb9c2e8aab66c8e36ec8b28'
         '6f772c15c921329764c6272e3c84b39f'
         '95501a35ce19edcced6262024f6b4a44'
         '53d930d2fecf222664c6ac30bec0dff0')


build() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/bmpanel2/themes/
    cp -r {Cocoa,isotop,Knurra-blue,Knurra-green,Knurra-orange,Knurra-pink,Kupo-blue,Kupo-dark-blue,Kupo-dark-green,Kupo-dark-orange,Kupo-dark-pink,Kupo-dark-red,Kupo_Finale-dark,Kupo_Finale-light,Kupo-green,Kupo-orange,Kupo-pink,Kupo-red,muin,Pucko_Modern-blue,Pucko_Modern-brown,Pucko_Modern-dark,Pucko_Modern-green,Pucko_Modern-pink} $pkgdir/usr/share/bmpanel2/themes/
}

