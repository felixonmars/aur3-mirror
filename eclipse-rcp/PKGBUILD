# Maintainer: Michael Rueegg <rueegg.michael@gmail.com>

is_64bit_arch() { [ $CARCH = 'x86_64' ]; }

is_64bit_arch && _arch=-x86_64
_eclipse_name=luna
_eclipse_release=SR2
_eclipse_timestamp=20150204-1700
pkgname=eclipse-rcp
pkgver=4.4.2
pkgrel=1
pkgdesc='Eclipse for RCP and RAP Developers including Mylyn, XML editors, Code recommenders, Git and Maven.'
arch=('i686' 'x86_64')
url='http://www.eclipse.org'
license=('EPL')
depends=('java-environment>=6' 'gtk2' 'libxtst' 'webkitgtk2' 'unzip')
optdepends=('hicolor-icon-theme')
provides=('eclipse')
install=${pkgname}.install
source=(eclipse.sh eclipse.desktop eclipse.svg eclipse.ini.patch "http://www.eclipse.org/downloads/download.php?\
file=/technology/epp/downloads/release/${_eclipse_name}/${_eclipse_release}/${pkgname}-\
${_eclipse_name}-${_eclipse_release}-linux-gtk${_arch}.tar.gz&r=1")
changelog=${pkgname}.Changelog
md5sums=('6c3b57230d9e1dbdf5db81b5da94eddd'
         '4c37bbe1cc5f8eb23dad2021b4d4b7e8'
         '5e9975a49de88815a731cbd4c77a136e'
         '2db7576d647696af173ad2b8d4baf2c8'
         'dde610dcb806b8c9dee987a3777213b7')
is_64bit_arch && md5sums[4]='23a51ef7f7f9d326cf1b9f7a6c759135'

build() {
  cd $srcdir
  patch -uNp1 -i eclipse.ini.patch || return 1
}

package() {
  local _iconpath=/usr/share/eclipse/plugins/org.eclipse.platform_${pkgver}.v${_eclipse_timestamp}
  install -m755 -d $pkgdir/usr/{bin,share/applications}
  install -m755 -d $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,256x256,scalable}/apps
  cd $srcdir
  mv eclipse $pkgdir/usr/share
  install -D -m 755 eclipse.sh $pkgdir/usr/bin/eclipse
  install -D -m 644 eclipse.desktop $pkgdir/usr/share/applications
  install -D -m 644 eclipse.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/eclipse.svg
  for i in 16 32 48 256; do
    ln -s ${_iconpath}/eclipse${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png
  done
}
