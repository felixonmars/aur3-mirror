# Maintainer icasdri <icasdri at gmail dot com>
_githubauthor=jleclanche
_pkgname=django-push-notifications
pkgname=python-$_pkgname-git
pkgver=1.2.1.r1.gf21a4d4
pkgrel=3
pkgdesc="Send push notifications to mobile devices through GCM or APNS in Django"
arch=(any)
url="https://github.com/$_githubauthor/$_pkgname"
license=('MIT')
makedepends=('git')
depends=('python-django')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}/"
}
