# Contributor: Xemertix <arch88(at)katamail(dot)com>
# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>

pkgname=ddccontrol-svn
pkgver=806
pkgrel=3
pkgdesc="Control your monitor by software using the DDC/CI protocol."
url="http://ddccontrol.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2' 'gtk2' 'pciutils' 'ddccontrol-db-svn')
makedepends=('subversion' 'wget' 'intltool')
provides=('ddccontrol')
conflicts=('ddccontrol')
source=()
md5sums=()


_svntrunk=https://ddccontrol.svn.sourceforge.net/svnroot/ddccontrol/trunk/ddccontrol
_svnmod=ddccontrol

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir/ddccontrol
  mkdir -p $pkgdir/usr/{lib/ddccontrol,bin}

  ./autogen.sh

  aclocal -I m4
  autoconf

  wget 'http://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.guess'
  wget 'http://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.sub'

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  # Fix permissions
  find "$pkgdir"/usr/ -type f -exec chmod 664 {} \;
  find "$pkgdir"/usr/ -type d -exec chmod 755 {} \;
  find "$pkgdir"/usr/bin -type f -exec chmod 755 {} \;
  find "$pkgdir"/usr/lib/ddccontrol -type f -exec chmod 755 {} \;
}
