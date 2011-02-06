# Maintainer: Mathias Rohnstock <linksoft@gmx.de>
# Contributed by: f0x <f0x@f0x.ru>

pkgname=google-desktop
pkgver=1.2.0.0088
pkgrel=5
pkgdesc="Google Desktop for Linux"
url="http://desktop.google.com/linux"
license=('custom')
arch=('i686' 'x86_64')
makedepends=('rpmextract')
depends=('gtk2>=2.2.0' 'glibc>=2.3.2')
if [ ${CARCH} = 'x86_64' ]; then
  source=(http://dl.google.com/linux/rpm/stable/x86_64/${pkgname}-linux-current.rpm)
  md5sums=('dac43d2ea9d4f1069a0bed0e754cffb1')
else
  source=(http://dl.google.com/linux/rpm/stable/i386/${pkgname}-linux-current.rpm)
  md5sums=('165d313c8592a007d7a0e42ca3af0dfb')
fi

build() {
  rpmextract.sh ${pkgname}-linux-current.rpm
  cp -R ${srcdir}/{etc,opt,usr,var} ${pkgdir}/
  mkdir -p ${pkgdir}/usr/share/applications

  cd ${pkgdir}/usr/share/applications
  ln -s ../../../opt/google/desktop/xdg/google-gdl.desktop
  ln -s ../../../opt/google/desktop/xdg/google-gdl.directory
  ln -s ../../../opt/google/desktop/xdg/google-gdl-preferences.desktop
}

