# Mainteiner: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: twa022 <twa022@gmail.com>

pkgname=xfwm-theme-newwave

pkgver=0.8.0
pkgrel=1
pkgdesc="New Wave theme ported to Xfwm"
arch=('any')
url="http://xfce-look.org/content/show.php/New+Wave+XFWM+Theme?content=104935"
license=('CreativeCommons')
depends=('xfwm4')
optdepends=('gtk2-theme-newwave: Matching gtk2 theme')
noextract=('104935-New%20Wave%20Xfwm.tar.gz')
source=("http://xfce-look.org/CONTENT/content-files/104935-New%20Wave%20Xfwm.tar.gz")
md5sums=('ce7a663a4769b6b8156879ad8f50f2d9')

package() {
  cd $srcdir
  tar -zxf 104935-New%20Wave%20Xfwm.tar.gz
  mkdir -p "$pkgdir/usr/share/themes/New Wave"
  cp -r "$srcdir/New Wave/xfwm4" "$pkgdir/usr/share/themes/New Wave/"
}
