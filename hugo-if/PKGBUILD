# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=hugo-if
pkgver=3.1.03
pkgrel=2
pkgdesc="A system for developing and playing sophisticated computer adventure games (interactive fictions)."
arch=(i686 x86_64)
url="http://www.generalcoffee.com/hugo/gethugo.html"
license=('freeware')
depends=('ncurses')
optdepends=('gtk2')
makedepends=('gzip')
#groups=()
source=(http://mirror.ifarchive.org/if-archive/programming/hugo/source/hugov31_wxwin_source.tar.gz http://mirror.ifarchive.org/if-archive/programming/hugo/executables/hugov31_wxwin_linux.tar.gz http://www.ifarchive.org/if-archive/programming/hugo/library/hugolib.zip http://www.ifarchive.org/if-archive/programming/hugo/manuals/hugo_book.pdf)
md5sums=('656d0af7492d8e4937636dc246c87ae7' 'f5778914e9e70659060c0b647ca58100' '85ec331cc523c6a9921a02f6fdf1251c' '62a00df88414b71d0f68400623444107')


build() {
  mkdir -p $pkgdir/usr/share/hugo/lib
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/hugov3.1.03
  make console
  cp -fr $srcdir/hugov3.1.03/he $pkgdir/usr/share/hugo/
  cp -fr $srcdir/hugov3.1.03/hd $pkgdir/usr/share/hugo/
  cp -fr $srcdir/hugov3.1.03/hc $pkgdir/usr/share/hugo/
  cp -fr $srcdir/hugov3.1.03/gtk2-static/hewx $pkgdir/usr/share/hugo/
  ln -s /usr/share/hugo/he $pkgdir/usr/bin/hugo-if-e
  ln -s /usr/share/hugo/hc $pkgdir/usr/bin/hugo-if-c
  ln -s /usr/share/hugo/hd $pkgdir/usr/bin/hugo-if-d
  ln -s /usr/share/hugo/hewx $pkgdir/usr/bin/hugo-if-ex
  
  unzip $srcdir/hugolib.zip -d $pkgdir/usr/share/hugo/lib
  cp -fr $srcdir/../hugo_book.pdf $pkgdir/usr/share/hugo/  
 
}
