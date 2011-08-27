pkgname=ttf-papercuts
pkgver=2
pkgrel=1
pkgdesc="A font created by Daniel Werneck."
arch=('any')
license=('GPL')
url="http://www.dafont.com/paper_cuts.font"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install

source=(papercuts.zip::'http://img.dafont.com/dl/?f=paper_cuts')


package()
{
        install -d $pkgdir/usr/share/fonts/TTF/ 
        install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ 
}

md5sums=('9b30f5a1e6f375052a7c0f4748c2cecb')
