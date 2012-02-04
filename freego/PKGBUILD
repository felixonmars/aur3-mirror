# Contributor: graigue <gregori.couzard@gmail.com>

pkgname=freego
pkgver=4.5
pkgrel=1
pkgdesc="FreeGo makes it easier to access your personal data on the french ISP Free."
arch=('i686' 'x86_64')
url="http://www.freego.fr/"
license=('GPL')
noextract=('FreeGo4.5.zip')
depends=('vlc')
makedepends=('qt>=4.4.0' 'unzip')
source=(ftp://rpmfind.net/linux/Mandriva/devel/cooker/SRPMS/contrib/release/freego-4.5-1mdv2011.0.src.rpm) 


build() {
  cd $srcdir/
  unzip  FreeGo4.5.zip -d freego
  cd "$srcdir/freego"
  patch -Np0 -i $srcdir/freego-4-prefix.patch
  patch -Np0 -i $srcdir/freego-4-desktopfile.patch
  patch -Np0 -i $srcdir/freego-4-gcc45.patch
  qmake
  make || return 1
  install -p -m 755 -D FreeGo "${pkgdir}/usr/bin/FreeGo"
  install -p -m 644 -D setups/unix_settings/FreeGo.desktop  "${pkgdir}/usr/share/applications/FreeGo.desktop"
  install -p -m 644 -D setups/unix_settings/FreeGo.png      "${pkgdir}/usr/share/pixmaps/FreeGo.png"
}
md5sums=('6f06d4eb9cdbb5a65dd9f2798aa7784e')
