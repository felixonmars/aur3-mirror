# Maintainer: Dreieck
# Contributors: Charles Ghislain, Guillaume ALAUX, Daniel J Griffiths, Jason Chu, Geoffroy Carrier, Army, kfgz, Thomas Dziedzic, Dan Serban, Det

pkgname=jre7-compat
pkgver=7u3
_build=b04
pkgrel=2
pkgdesc="Java 7 Runtime Environment, designed to be installed in parallel with another java installation."
url=http://www.oracle.com/technetwork/java/javase/downloads/index.html
arch=('i686' 'x86_64')
license=('custom')
depends=('desktop-file-utils' 'libxtst' 'shared-mime-info' 'xdg-utils')
# provides=('java-runtime=7' "jre=$pkgver-$pkgrel")
install=jre.install

_arch=i386; [ "$CARCH" == 'x86_64' ] && _arch=amd64

source=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/jre-$pkgver-linux-i586.tar.gz"
        'java-policy-settings.desktop'
        'jre.sh'
        'jre.csh'
        'javaws-launcher')
md5sums=('cfce10a05f8d152d39aef892f2cd4011'
         '6614b04176b9b7dfe26f22e9ce846801'
         '7cd3dc10e7a37468cad4053a067dcd01'
         'cc90df2df6fe80fab885a80036d420a1'
         '45c15a6b4767288f2f745598455ea2bf')

[ "$CARCH" == 'x86_64' ] && {
  source[0]="http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/jre-$pkgver-linux-x64.tar.gz"
  md5sums[0]='3d3e206cea84129f1daa8e62bf656a28'
}

package() {
  # Create required dirs
  cd $(ls -1d jre1.7.0_*/ | tail -1)
  mkdir -p "$pkgdir"/{opt/java7/jre,usr/share/licenses/jre7-compat}

  # # Re-order folders a bit
  # mv lib/desktop/{applications,icons,mime} "$pkgdir"/usr/share/

  # # Remove empty and redundant dirs
  # rm -r plugin
  # rmdir lib/{applet,desktop}

  # Move stuff in place
  mv * "$pkgdir"/opt/java7/jre

  cd "$srcdir"

  # # Symlink the plugin
  # ln -s /opt/java7/jre/lib/$_arch/libnpjp2.so "$pkgdir"/usr/lib/mozilla/plugins/libnpjp2.so

  # Install scripts, .desktop file and licenses
  install -m755 javaws-launcher "$pkgdir"/opt/java7/jre/bin/
  # install -Dm644 java-policy-settings.desktop "$pkgdir"/usr/share/applications/java-policy-settings.desktop
  # install -m755 jre.{c,}sh "$pkgdir"/etc/profile.d/
  cp "$pkgdir"/opt/java7/jre/{COPYRIGHT,LICENSE,THIRDPARTYLICENSEREADME.txt} "$pkgdir"/usr/share/licenses/jre7-compat/

  # # Tweak the javaws .desktop file
  # sed -e 's/Exec=javaws/&-launcher %f/' -e '/NoDisplay=true/d' -i "$pkgdir"/usr/share/applications/sun-javaws.desktop
}