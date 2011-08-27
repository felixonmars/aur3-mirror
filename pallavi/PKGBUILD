# Contributor: Dusty Phillips <dusty@buchuki.com>
pkgname=pallavi
pkgver=0.6b3
pkgrel=2
pkgdesc="Extensible Text Editor"
arch=(i686 x86_64)
license=('custom:MIT')
url="http://pallavi.sf.net/"
depends=('python' 'wxpython')
source=("http://downloads.sourceforge.net/sourceforge/pallavi/Pallavi-$pkgver.tar.gz" menubar.patch pallavi.desktop LICENSE)
md5sums=('95b5906994f7c68ac743ac9957e40b8a'
         'ffb8947bab37db024cb30561984988c7'
         '99f6f8377472b406172e4d83b07719b0'
	 '20588a9062201296c00be9f25371948d')

build() {
  cd $startdir/src/Pallavi-$pkgver
  patch -Np0 < ../menubar.patch
  python setup.py install --root=$startdir/pkg
  cd $startdir/pkg/usr/bin
  ln -s run-pallavi pallavi
  # Install .desktop file
  mkdir -p $startdir/pkg/usr/share/applications
  install -m 644 $startdir/$pkgname.desktop $startdir/pkg/usr/share/applications/

  install -D -m 644 $startdir/LICENSE $startdir/pkg/usr/share/licenses/pallavi/LICENSE
}
