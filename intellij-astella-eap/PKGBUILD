# Maintainer: Alexander Koval <a88mail@gmail.com>
pkgname=intellij-astella-eap
pkgver=1
_buildver=110.246
pkgrel=1
pkgdesc="IDE for ActionScript, Flex, AIR and HTML5 development"
arch=('i686' 'x86_64')
url="http://www.jetbrains.com/astella/"
license=('unknown')
depends=('jdk')
options=(!strip)
source=(http://download-ln.jetbrains.com/astella/Astella-EAP-110.246.tar.gz \
	intellijastella.sh
        intellijastella.desktop
)

md5sums=('dddf8a5553bda736b7a5da8f92ecf6f9'
         'cd5b8b5ce9fa96ffbfec5e88f81cfa8d'
         '33efab020b1b64d5edf949d7d278bd61')

build() {
  cd "$srcdir"

  install -d -m755 $pkgdir/usr/{bin,share}
  cp -a "Astella-$_buildver" "$pkgdir/usr/share/$pkgname"
  chown -R 0:0 $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share/$pkgname -type d -exec chmod 0755 {} ';'
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 0644 {} ';'

  chmod +x $pkgdir/usr/share/$pkgname/bin/astella.sh
  chmod +x "$pkgdir"/usr/share/$pkgname/bin/fsnotifier
  chmod +x "$pkgdir"/usr/share/$pkgname/bin/fsnotifier64

  install -D -m755 $srcdir/intellijastella.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $srcdir/intellijastella.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/Astella-$_buildver/bin/astella.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -D -m644 $srcdir/Astella-$_buildver/license/Astella_license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et: