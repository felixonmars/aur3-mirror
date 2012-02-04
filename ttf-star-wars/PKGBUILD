pkgname=ttf-star-wars
pkgver=1.1
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Fonts from the Star Wars Universe, all in one package. Source: http://www.vectorilla.com/2010/03/free-star-wars-fonts-collection/"
arch=('any')
md5sums=('903afa450909ab61d4e410f33e77c11f'
    '7c62bf9a87b9b943165c40f70f2e67de'
    'b738669c89a2473884cd82c0416700af'
    '1ccd46e93e86773067c99799bbd14a71')
license=('Freeware')
source=("http://www.vectorilla.com/wp-content/uploads/2010/03/star-wars-fonts.zip"
    "http://www.freefontsdb.com/download-framdcnttf"
    "http://www.freefontsdb.com/download-frabkttf"
    "http://www.freefontsdb.com/download-fradmitttf")
url=("https://bbs.archlinux.org/viewtopic.php?id=134639")

install=$pkgname.install
build()
{
      mkdir -p $pkgdir/usr/share/fonts/TTF
      mkdir $srcdir/$pkgname
      mv $srcdir/star-wars-fonts/fonts/* $srcdir/$pkgname
      mv $srcdir/*.ttf $srcdir/$pkgname
      cp $srcdir/$pkgname/*.ttf $srcdir/$pkgname/*.TTF $pkgdir/usr/share/fonts/TTF
}
