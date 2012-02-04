pkgname=sidesms
pkgver=1.0
pkgrel=1
pkgdesc="GTK app to send SMS through Italian gateways"
url="http://www.sideralis.org/sidesms"
license="GPL"
depends=('librsvg' 'pygtk')
source=("http://www.sideralis.org/download/$pkgname-$pkgver.tar.bz2")
md5sums=('52a66ef99a9239ac4d4b88b5e42c1218')

build() {
  mkdir -p $startdir/pkg/usr/bin #,share/applications}

  cd $startdir/src/$pkgname-$pkgver
  sed -i "s|/usr/share/sidesms|$startdir/pkg/usr/share/$pkgname|" setup.py
  python setup.py install

  ln -sf /usr/share/sidesms/sidesms.py $startdir/pkg/usr/bin/sidesms
  ln -sf /usr/share/sidesms/sidesms_gui.py $startdir/pkg/usr/bin/sidesms_gui
}
