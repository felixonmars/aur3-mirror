# Maintainer icasdri <icasdri at gmail dot com>
_githubauthor=Tivix
_pkgname=django-rest-auth
pkgname=python-$_pkgname-git
pkgver=0.3.4.r33.g24af351
pkgrel=1
pkgdesc="Django app that makes it extremely easy to expose all registration and authentication using class based views and REST endpoints"
arch=(any)
url="https://github.com/$_githubauthor/$_pkgname"
license=('MIT')
makedepends=('git')
depends=('python-django'
         'python-django-rest-framework'
         'python-six')
optdepends=('python-django-allauth: for registration and social auth')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}/"
}
