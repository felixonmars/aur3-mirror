# Maintainer: Stephan Wienczny <stephan@wienczny.de>

pkgname=dbeaver-ee
pkgver=3.4.1
pkgrel=1
pkgdesc="A free universal database tool for developers and database administrators. Enterprise Edition includes NoSQL database support"
arch=('i686' 'x86_64')
url="http://dbeaver.jkiss.org/"
license=("GPL")
depends=('java-runtime>=1.6' 'gtk2' 'gtk-update-icon-cache')
makedepends=('unzip')
install=dbeaver-ee.install

source=(dbeaver-ee.desktop dbeaver-ee.install)
source_i686=(http://dbeaver.jkiss.org/files/dbeaver-$pkgver-ee-linux.gtk.x86.zip)
source_x86_64=(http://dbeaver.jkiss.org/files/dbeaver-$pkgver-ee-linux.gtk.x86_64.zip)

sha256sums=('453912912ae8377b16ef74a3e7d93ea588792ee8f7054a573e9fe9b93cd9265f'
         '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_i686=('7ea7e88671b1ccd7b44db6ca90975b73cf76408330880b0101ab332602666cf4')
sha256sums_x86_64=('81559fb291609d4e06cce7aea9f5cf74a3709a0693473eb12ad54ddc60c9638c')

package() {
  cd $pkgdir
  mkdir -p opt/
  mkdir -p usr/bin
  mkdir -p usr/share/applications
  mkdir -p usr/share/icons/hicolor/48x48/apps
  
  cp -r $srcdir/dbeaver opt/dbeaver-ee
  cp opt/dbeaver-ee/icon.xpm usr/share/icons/hicolor/48x48/apps/dbeaver-ee.xpm
  ln -s /opt/dbeaver-ee/dbeaver usr/bin/dbeaver-ee
  install -m 644 $srcdir/dbeaver-ee.desktop $pkgdir/usr/share/applications/
}

