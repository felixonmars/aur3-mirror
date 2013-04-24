# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=sinthgunt
pkgver=2.1.0
pkgrel=1
pkgdesc="Sinthgunt is an easy to use GUI for ffmpeg with more than 100 pre-configured conversion settings."
arch=('i686' 'x86_64')
url="http://code.google.com/p/sinthgunt/"
license=('GPL3')
depends=('ffmpeg' 'pygtk') # 'youtube-dl'
source=(https://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('a7f18b5d490dad16d99eb24ee8ba22d7')


package() {
   cd $srcdir/$pkgname-$pkgver

   python2 ./setup.py install --root=$pkgdir
   
   # Remove youtube-dl(is in community repository)
   #rm -f ./bin/youtube-dl
   # Not included, because sinthgung provides now it's own youtube-dl version (youtube-dl-sinthgunt)
}
