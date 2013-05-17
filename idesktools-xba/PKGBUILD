pkgname=idesktools-xba
pkgver=0.3.5
pkgrel=4
pkgdesc="Tools for iDesk written in Python"
arch=(any)
url='http://icecc.sourceforge.net/idesktools.html'
license=('custom')
depends=('pyqt3' 'idesk')
source=(http://sourceforge.net/projects/icecc/files/icecc/2.6.2/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c8c4a3c2cadffb8fc08ba8ccfa2f350e')

package() {
  cd $pkgname-$pkgver
  # Python 2 is expected by the scripts, but "python" defaults to Python 3.x.
  sed -i 's#/usr/bin/env python#/usr/bin/env python2#' imklnk.py ideskcfg.py

  # This installs the GUI tool for generating icons.
  install -Dm755 imklnk.py $pkgdir/usr/bin/imklnk

  # Uncomment the following line to install a GUI tool for editing the main configuration file. It seems to break iDesk<0.3.5.
  # install -Dm755 ideskcfg.py $pkgdir/usr/bin/ideskcfg
}
