
# Contributor: Tom Richards <tom@tomrichards.net>
# Contributor: Ebubekir KARUL <ebubekirkarul@yandex.com>
# Contributor: Krzysztof Raczkowski <raczkow@gnu-tech.pl>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>
# Contributor: LinuxUser <theo@nordlogix.com>

pkgname=netbeans-php
pkgver=8.0.2
pkgrel=2
pkgdesc="Netbeans IDE - PHP version"
arch=('any')
url="https://netbeans.org"
license=('CDDL')
depends=('java-environment' 'desktop-file-utils')
optdepends=('php: php execution support'
            'xdebug: php debugging support'
            'python: ant target support'
            'php-composer: dependency manager for php projects')

conflicts=('netbeans')
install=netbeans-php.install
source=('http://dlc.sun.com.edgesuite.net/netbeans/8.0.2/final/zip/netbeans-8.0.2-201411181905-php.zip'
        'netbeans.desktop')
sha256sums=('04f96c8711c0a765a2fb55a3b7824ff056095449557b33109a7dddf4f4ece75f'
            'a2172e4ab1d73a6d5b6cd0d44a329472ecffbfb1b69a1144737929f3ed0d307c')
options=('!strip')

prepare() {
  cd $srcdir/netbeans/
  rm -r $(find -name '*\.exe' -or -name '*\.bat' -or -name 'MacOSX*' -or -name 'Windows*' -or -name 'SunOS*')
}

package() {
  find . -type f -exec install -D -m644 {,$pkgdir/usr/share/}{} \;
  chmod a+x $pkgdir/usr/share/netbeans/bin/netbeans
  install -Dm644 $srcdir/netbeans.desktop $pkgdir/usr/share/applications/netbeans.desktop
  mkdir -p $pkgdir/usr/bin
  ln -s /usr/share/netbeans/bin/netbeans $pkgdir/usr/bin/netbeans
}
