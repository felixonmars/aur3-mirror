pkgname="spdd"
pkgver=0.1alpha
pkgrel=1
pkgdesc="Springerlink Download Dude is a gui ebook-downloader for springerlink.com"
arch=('i686' 'x86_64')
url="http://rubyforge.org/projects/spdd/"
license=('GPL')
depends=('ruby' 'ruby-libglade')
_svntrunk=("http://spdd.rubyforge.org/svn/trunk")

build() {
  cd $startdir/src
  msg "Connecting to SVN server...."
  svn co $_svntrunk
  mkdir -p $pkgdir/usr/share/spdd
  mkdir -p $pkgdir/usr/bin/
  cp -r $startdir/src/trunk/spdd $pkgdir/usr/share/spdd/
  cp -r $startdir/src/trunk/bin/ $pkgdir/usr/share/spdd/
  install -D -m755 $startdir/spdd $pkgdir/usr/bin/ || return 1
}
