# Maintainer: Giulio Fidente <gfidente at gmail dot com>
# Contributor: Guillaume Chanaud <gehasia at gmail dot com>

pkgname=python-devassistant
pkgver=0.11.x
pkgrel=1
pkgdesc="Helps with creating and setting up the development environment for projects in various languages."
arch=('any')
url="http://devassistant.org"
license=('GPL2')
depends=('python-pygithub' 'python-gobject' 'python-setuptools' 'python-jinja' 'python-progress' 'python-six' 'python-yaml' 'python-requests' 'python-dapp' 'python-cairo')
makedepends=('desktop-file-utils' 'python-setuptools' 'python-jinja' 'python-progress' 'python-six' 'python-yaml')
source=(https://github.com/devassistant/devassistant/archive/$pkgver.zip)
sha256sums=('054865f609d2be19a94e10af98271142fa5a4b50421cb4a6f4a00e4d5e02a3fb')
package() {
  cd $srcdir/devassistant-$pkgver
  python setup.py install --prefix=/usr --root=$pkgdir

  cd $srcdir/devassistant-$pkgver/distribution/manpages/
  ./generate_man.py
  mkdir -p $pkgdir/usr/share/man/man1/
  cp $srcdir/devassistant-$pkgver/distribution/manpages/*.1 $pkgdir/usr/share/man/man1/

  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/devassistant-$pkgver/distribution/devassistant.desktop $pkgdir/usr/share/applications/
  size=( "16x16" "22x22" "24x24" "32x32" "48x48" "256x256" )
  for i in "${size[@]}"
  do
	mkdir -p $pkgdir/usr/share/icons/hicolor/$i/apps
	cp $srcdir/devassistant-$pkgver/distribution/icons/hicolor/$i/devassistant.png $pkgdir/usr/share/icons/hicolor/$i/apps/
  done
  mkdir -p $pkgdir/usr/share/icons/hicolor/symbolic/apps
  cp $srcdir/devassistant-$pkgver/distribution/icons/hicolor/symbolic/devassistant-symbolic.svg $pkgdir/usr/share/icons/hicolor/symbolic/apps/

  mkdir -p $pkgdir/usr/share/appdata
  cp $srcdir/devassistant-$pkgver/distribution/appdata/devassistant.appdata.xml $pkgdir/usr/share/appdata

  mkdir -p $pkgdir/usr/share/polkit-1/actions
  cp $srcdir/devassistant-$pkgver/distribution/polkit/devassistant_auth.policy $pkgdir/usr/share/polkit-1/actions/

  mkdir -p $pkgdir/usr/libexec
  cp $srcdir/devassistant-$pkgver/distribution/polkit/da_auth $pkgdir/usr/libexec/ 
}

