# Maintainer: warddr <aur@warddr.eu>
# Submitter: Frank Smit <frank/61924/nl>

pkgname=python2-flask-mail
pkgver=0.9.0
pkgrel=1
pkgdesc="A Flask extension for sending email messages."
arch=(any)
url="http://pypi.python.org/pypi/Flask-Mail"
license=("BSD")
depends=("python2" "python2-flask" "lamson")
makedepends=("setuptools")
source=("http://pypi.python.org/packages/source/F/Flask-Mail/Flask-Mail-$pkgver.tar.gz")
md5sums=("cd71f0b228341fc29d2722783ebaa8f6")

package_python2-flask-mail() {
    cd $srcdir/Flask-Mail-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
