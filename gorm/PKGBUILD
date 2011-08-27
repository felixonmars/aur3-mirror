# Contributor: Robson Cardoso dos Santos <cardoso.rcs@gmail.com>

pkgname=gorm
pkgver=1.2.12
pkgrel=2
pkgdesc="Graphical user interface builder for GNUstep"
arch=(i686)
url="http://gnustep.org/"
license=('GPL')
depends=('gcc-libs' 'gnustep-gui' 'gnustep-back')
provides=('gorm.app')
conflicts=('gorm.app-svn')
replaces=()
source=(ftp://ftp.gnustep.org/pub/gnustep/dev-apps/$pkgname-$pkgver.tar.gz)
md5sums=('7b068a369051f83d450d2a0dd464e8ee')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  msg "Starting make..."

  if ! (env | grep GNUSTEP > /dev/null); then
    msg "Sourcing GNUStep environment"
    source /etc/profile.d/GNUstep.sh
  fi 
  
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

