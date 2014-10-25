# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Peter Baldwin <bald_pete@hotmail.com>
# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>

pkgname=python-recaptcha-client
pkgver=1.0.6
pkgrel=1
pkgdesc="Provides a CAPTCHA for Python using the reCAPTCHA service"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/recaptcha-client"
license="MIT"
depends=('python')
source=(http://pypi.python.org/packages/source/r/recaptcha-client/recaptcha-client-$pkgver.tar.gz)
md5sums=('74228180f7e1fb76c4d7089160b0d919')


package() {
  cd $srcdir/recaptcha-client-$pkgver
  python setup.py install --root=$pkgdir --prefix=/usr
}
