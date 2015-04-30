_pkgname=maelstrom
pkgname=$_pkgname-git
pkgver=0.0.99.776.b6850c1
pkgrel=1
pkgdesc="A whirling maelstrom of network libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1' 'BSD' 'GPL3')
depends=('efl')
makedepends=('git' 're2c' 'elementary' 'efx-git')
optdepends=('elementary: Shotgun GUI'
            'efx-git: Shotgun GUI')
source=('git://git.enlightenment.org/devs/discomfitor/maelstrom.git')
sha256sums=('SKIP')
 
pkgver()
{
  cd $_pkgname
 
  for _i in v_maj v_min v_mic; do
    local v_ver=${v_ver#.}.$(grep -m1 $_i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done
 
  v_ver=$(awk -F , -v v_ver=$v_ver '/^AC_INIT/ {gsub(/v_ver/, v_ver); gsub(/[\[\] -]/, ""); print $2}' configure.ac)
 
  printf "$v_ver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
 
build()
{
  cd $_pkgname
 
  ./autogen.sh --prefix=/usr
  make
}
 
package()
{
  cd $_pkgname
 
  make -j1 DESTDIR="$pkgdir" install
 
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING-AZY COPYING-EMAIL COPYING-SHOTGUN COPYING-SHOTGUN-ICONS
}
