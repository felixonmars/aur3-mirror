# Contributor: Peter Baldwin <bald_pete@hotmail.com>
# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>

pkgname=python2-recaptcha-client
pkgver=1.0.6
pkgrel=1
pkgdesc="Provides a CAPTCHA for Python using the reCAPTCHA service"
license="MIT"
url="http://pypi.python.org/pypi/recaptcha-client"
source=(http://pypi.python.org/packages/source/r/recaptcha-client/recaptcha-client-$pkgver.tar.gz)
md5sums=('74228180f7e1fb76c4d7089160b0d919')
arch=('i686' 'x86_64')
depends=('python2' 'python2-distribute')

build() 
{
  cd $startdir/src/recaptcha-client-$pkgver
  python2 setup.py install --root=$startdir/pkg
}

