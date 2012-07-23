# Contributor: Košava <kosava@archlinux.us>

pkgname=smf
pkgver=2.0.2
_pkgver=2-0-2
pkgrel=1
pkgdesc="Freeware internet forum engine"
arch=('i686' 'x86_64')
url="http://www.simplemachines.org"
license=('custom')
depends=('mysql' 'php')
source=("http://download.simplemachines.org/index.php/smf_${_pkgver}_install.tar.bz2")
md5sums=('2d03fc36be366a757a216055b84d3213')

build() {
  #
  # ###
  local _wwwroot=`grep ^DocumentRoot /etc/httpd/conf/httpd.conf | sed 's|DocumentRoot ||' | sed 's|"||g'`
  if [ -z $_wwwroot ] ; then
    _wwwroot="/srv/http"
  fi
  # ###
  #

  mkdir -p $pkgdir/$_wwwroot/smf
  mkdir -p $pkgdir/usr/share/licenses/smf
  cp -r $srcdir/* $pkgdir/$_wwwroot/smf && \
  rm -f \
	$pkgdir/$_wwwroot/smf/smf_${_pkgver}_install.tar.bz2 \
	$pkgdir/$_wwwroot/smf/news_readme.html \
	$pkgdir/$_wwwroot/smf/readme.html \
	$pkgdir/$_wwwroot/smf/changelog.txt && \
  mv -f $pkgdir/$_wwwroot/smf/license.txt $startdir/pkg/usr/share/licenses/smf/
}
