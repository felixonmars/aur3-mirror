# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Xemertix <arch88@katamail.com>

pkgname=eikazo
pkgver=0.5.2
pkgrel=2
pkgdesc="A graphical frontend for Sane intended mainly for usage with ADF scanners"
arch=('i686' 'x86_64')
url="http://eikazo.berlios.de/"
license=('GPL')
depends=('python2' 'pygtk' 'python-imaging' 'python2-gtkhtml2' 'sane')
source=(http://download.berlios.de/$pkgname/Eikazo-$pkgver.tar.gz)
md5sums=(4fcfd8ee838ff32fc71ecfa7e49bffea)

build() {  
  cd Eikazo-$pkgver
  python2 setup.py build
  python2 setup.py install --root=${pkgdir}
}
