# Contributor: KsenZ <aksenzov@gmail.com>

pkgname=netbeans-php_ru
pkgver=6.9.1
pkgrel=1
pkgdesc="Netbeans IDE - PHP version with russian translation"
arch=('i686' 'x86_64')
url="http://www.netbeans.org"
license=('CDDL')
depends=('java-runtime' 'desktop-file-utils')
conflicts=('netbeans')
install=netbeans.install
source=('http://bits.netbeans.org/netbeans/6.9.1/community/final/zip/netbeans-6.9.1-201011281701-ml-php.zip' 'netbeans.desktop')
md5sums=('fd17ee660ede01cbe5daa9e9c379725a'
         '35404c88fa36241e00016f31069136c6')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/netbeans

  rm $startdir/src/netbeans/bin/netbeans.exe

  cp -r $startdir/src/netbeans/* $startdir/pkg/usr/share/netbeans/

  install -D -m644 $startdir/src/netbeans.desktop $startdir/pkg/usr/share/applications/netbeans.desktop
  mkdir -p $startdir/pkg/usr/bin
  ln -s /usr/share/netbeans/bin/netbeans $startdir/pkg/usr/bin/netbeans
}
