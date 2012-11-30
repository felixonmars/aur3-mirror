# Maintainer: aldeano <aldea.diaguita at gmail.com>
pkgname=cometsound
pkgver=0.3.2
pkgrel=2
pkgdesc='Music player for GNU/Linux written in python, using pygtk and gstreamer libraries.'
arch=(any)
url=http://launchpad.net/$pkgname
license=('GPL')
depends=('gstreamer0.10-python' 'mutagen' 'python2-cerealizer' 'python2-notify' 'python2-setproctitle')
optdepends=('xfce4-notifyd: notifications in xfce4')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz
$pkgname.desktop $pkgname.sh)
#install=$pkgname.install
md5sums=('01a7b8a6e9f85b4ab0bb95015c8f9ba4'
         '6f89c0e70a242983a1ef19b7ba21ffec'
         'eff1d33fb87a654d9edb7cfb4851a402')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  python2 setup.py install --root=$pkgdir/ --optimize=1
  
  install -m644 ${startdir}/$pkgname.sh ${pkgdir}/usr/bin/$pkgname
  install -m644 ${startdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/
  
  chmod +x ${pkgdir}/usr/bin/$pkgname
  
  }
