#Contributor: Fung Wing Kit <wengee@gmail.com>
pkgname=python-formalchemy
pkgver=1.3.3
pkgrel=1
pkgdesc="Auto-generated, customizable HTML input form fields from your SQLAlchemy mapped classes."
arch=(any)
url="http://code.google.com/p/formalchemy/"
depends=('python>=2.5')
source=(http://formalchemy.googlecode.com/files/FormAlchemy-${pkgver}.tar.gz)
license=('MIT License')

build()
{
  cd $startdir/src/FormAlchemy-$pkgver
  python setup.py install --root=$startdir/pkg
}

md5sums=('84a29720ec8d141e3e06cbb78fad5119')
