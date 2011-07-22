# Mainteiner:      juliano.bn <juliano.bn@gmail.com>
# Old mainteiners: nlight     <alexander.dzhoganov@gmail.com>
#                  Gladstone  <h2oz7v@gmail.com>


pkgname=emergent-svn
pkgver=4968
pkgrel=1
pkgdesc="Comprehensive, full-featured neural network simulator that allows for the creation and analysis of complex, sophisticated models of the brain in the world"
arch=('i686' 'x86_64')
url="http://grey.colorado.edu/emergent"
license=('GPL')
depends=('libjpeg' 'libpng' 'qt' 'coin' 'quarter' 'gsl' 'ode' 'termcap')
makedepends=('cmake')
provides=('emergent')

build()
{
  cd $srcdir
  msg "Connecting to $pkgname SVN server..."

  if [ -d $pkgname-$pkgver/.svn ]; then
    cd "$pkgname-$pkgver"
	svn update
  else
  svn checkout --username anonymous --password emergent \
      http://grey.colorado.edu/svn/emergent/emergent/trunk $pkgname-$pkgver
  fi

  msg "SVN checkout done"
  msg "Starting make..."
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr/
  make
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir/" install
}
