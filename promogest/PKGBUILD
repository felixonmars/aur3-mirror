# Contributor DaNiMoTh <jjdanimoth@gmail.com>
pkgname=promogest
pkgver=3893
pkgrel=1
pkgdesc="Italian ERP Software"
url="http://promogest.promotux.it"
license="GPL"
arch=('i686' 'x86_64')
depends=('python' 'postgresql' 'pygtk' 'scrollkeeper' 'glade' \
'gnome-python-extras' 'pyxml' 'python-reportlab' \
'python-psycopg2' 'pil' 'python-elementtree' \
'python-celementtree')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=promogest.install
_svntrunk=http://promogest.googlecode.com/svn/trunk/
_svnmod=pg2

source=(promogest.desktop )
md5sums=('e1b62857f6c1b5d8e4520e56e3816cd8')

         
build() {
  cd $srcdir
   
  svn checkout $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
}

package() {
  cd $srcdir/$_svnmod
  
  mkdir -p $pkgdir/usr/{bin,share/{applications,icons,promogest}}
  mkdir -p $pkgdir/$HOME
  install -D -m644 $srcdir/promogest.desktop $pkgdir/usr/share/applications
  cp core/gui/promogest.png $pkgdir/usr/share/icons/
  sed -i 's|/opt/promogest/python/gui|/usr/share/icons|g' $pkgdir/usr/share/applications/promogest.desktop
  cp core/desktop/promoGest2 $pkgdir/usr/bin/
  sed -i 's/python/python2/g' $pkgdir/usr/bin/promoGest2
  cp -r $srcdir/$_svnmod $pkgdir/$HOME
  rm -rf $pkgdir/usr/share/promogest
  

}
