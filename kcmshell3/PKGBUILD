# Contributor: v01d <phreakuencies@gmail.com>
pkgname=kcmshell3
pkgver=3.5.10
pkgrel=4
pkgdesc="kcmshell3 libraries, for configuration of KDE3 apps under KDE4 environment"
arch=(i686 x86_64)
url="http://www.kde.org"
license=('GPL')
depends=(kdelibs3)

if [ $CARCH = 'x86_64' ]; then
  md5sums=('e808f5924e0a2ec0ac0c50bcbf408cac')
  _kdemod_pkgrel=1  
fi

if [ $CARCH = 'i686' ]; then
  md5sums=('2baf16296df2c208f5fd7e5152d7ebad')
  _kdemod_pkgrel=3
fi
source=(http://kdemod.iskrembilen.com/legacy/${CARCH}/kdemod3-kdebase-${pkgver}-${_kdemod_pkgrel}-${CARCH}.pkg.tar.gz)

build() {
  mkdir -p $pkgdir/opt/kde/lib/kde3 $pkgdir/opt/kde/share/applications/kde
  cp $srcdir/opt/kde/lib/kde3/kcm_{icons,colors,fonts,style,keyboard,input}* $pkgdir/opt/kde/lib/kde3
  cp $srcdir/opt/kde/share/applications/kde/{icons,colors,fonts,style,mouse,keyboard}.desktop $pkgdir/opt/kde/share/applications/kde
}
