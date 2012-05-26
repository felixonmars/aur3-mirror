# Contributor: Défossez Alexandre <alexandre.defossez at google mailing service>

pkgname=django-simple-captcha
pkgver=0.3.4
pkgrel=1
pkgdesc="Django Simple Captcha is an extremely simple, yet highly customizable Django application to add captcha images to any Django form."
arch=(any)
url="https://github.com/mbi/django-simple-captcha"
license=("MIT")
depends=('python2' 'django' 'python-imaging>=1.1.6')
makedepends=('python2-distribute')
optdepends=("flite: required for text-to-speech (audio) output")
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/d/django-simple-captcha/$pkgname-$pkgver.tar.gz")
sha1sums=('d4514602fbcde42d57d159e5194661e7800518dc')
noextract=()


build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1

  # Remember to install licenses if the license is not a common license!
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


