# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>
# Contributor: Apkawa <apkawa@gmail.com>
pkgname=django-cms
pkgver=3.0.10
pkgrel=1
pkgdesc="CMS framework based on Django"
arch=('any')
url="http://www.django-cms.org/"
license=('BSD')
changelog='CHANGELOG.txt'
depends=('python' 'python-django' 'python-south' 'python-imaging' 'django-mptt' 'python-html5lib' 'django-classy-tags' 'django-sekizai')
makedepends=('python-setuptools')
source=("https://github.com/divio/django-cms/archive/${pkgver}.tar.gz")
sha256sums=('86a6c75107fb8918bffaefb10972e3f0221043620b468a6c9c124eecd7302f09')

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --install-data=/usr/share/$pkgname --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

