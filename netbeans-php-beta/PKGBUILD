# Maintainer: Krzysztof Raczkowski <raczkow@gnu-tech.pl>

pkgname=netbeans-php-beta
pkgver=7.3
pkgrel=2
pkgdesc="Netbeans IDE - PHP version"
arch=('i686' 'x86_64')
url="http://www.netbeans.org"
license=('CDDL')
depends=('java-runtime' 'desktop-file-utils')
provides=('netbeans-php')
conflicts=('netbeans' 'netbeans-php')
options=('!strip')
install=netbeans-php.install
source=('http://dlc.sun.com.edgesuite.net/netbeans/7.3/beta2/zip/netbeans-7.3beta2-201211062253-php.zip'
        'netbeans.desktop')
md5sums=('6ea7ebeaf859333cb309bec9842d4e2f'
         '4365b0af18717c031c38f422d0ad5466')
build() {
  cd $srcdir/netbeans/

  rm bin/netbeans.exe

  find . -type f -exec install -D -m644 {,$pkgdir/usr/share/netbeans/}{} \;

  chmod a+x $pkgdir/usr/share/netbeans/bin/netbeans

  install -D -m644 $srcdir/netbeans.desktop $pkgdir/usr/share/applications/netbeans.desktop

  mkdir -p $pkgdir/usr/bin

  ln -s /usr/share/netbeans/bin/netbeans $pkgdir/usr/bin/netbeans
}
