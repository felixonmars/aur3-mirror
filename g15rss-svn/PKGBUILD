#Maintainer: Dean Birch <dean.birch0@gmail.com>
pkgname=g15rss-svn 
pkgver=0.3
pkgrel=1
pkgdesc="Displays RSS feeds on the LCD screen of a G15 keyboard."
arch=('i686') #Probably all work - but not tested
url=('https://github.com/dean36963/g15rss')
license=('Unknown')
depends=('libxml2' 'g15daemon-svn' 'libg15render-svn' 'libg15-svn')
#or try below if you havent got svn version!
#depends=('libxml2' 'g15daemon' 'libg15render' 'libg15')
source=(https://github.com/downloads/dean36963/g15rss/g15rss-svn-0.3-1.tar.gz)
md5sums=('865ad11abdbe73dcdb8f3f8ae9c8e19e')

build() {
 cd "$srcdir"
 make
}

package() {
 mkdir -p "$pkgdir/usr/bin/"
 cp "$srcdir/g15rss" "$pkgdir/usr/bin/"
}

