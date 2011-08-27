# Contributor: Jeremy Sands cto@jeremysands.com
pkgname=levelator
pkgver=1.3.0
pkgrel=3
pkgdesc="Levelator normalizes and levels volume and noise volumes in WAV and AIFF files."
arch=('i686' 'x86_64')
url="http://www.conversationsnetwork.org/levelator"
license=('custom')
depends=('python>=2.5' 'wxpython')
source=(http://cdn.conversationsnetwork.org/Levelator-$pkgver-Python2.5.tar.bz2
        http://www.jeremysands.com/archlinux/levelator-path-fix.patch)
md5sums=('3aa5fa5cb1f02b4cbea29f8d838e6806'
         '1e6434d93c8581d9a5907e78c3f8716e')

build() {
  cd "$startdir"/pkg/
  mkdir -p opt/$pkgname usr/bin usr/share/licenses/$pkgname

  cd "$startdir"/src/Levelator-$pkgver-Python2.5
  patch -p0 < "$startdir"/src/levelator-path-fix.patch || return 1
  install -m644 license.txt "$startdir"/pkg/usr/share/licenses/$pkgname/
  install -m755 levelator "$startdir"/pkg/usr/bin/
  cp -r .levelator/* "$startdir"/pkg/opt/$pkgname/
  chmod 755 "$startdir"/pkg/opt/$pkgname/linux/level
}

# vim:set ts=2 sw=2 et:
