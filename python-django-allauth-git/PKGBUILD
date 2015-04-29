# Maintainer icasdri <icasdri at gmail dot com>
_githubauthor=pennersr
_pkgname=django-allauth
pkgname=python-$_pkgname-git
pkgver=0.19.1.r141.gd0fd635
pkgrel=2
pkgdesc="Integrated set of Django applications addressing authentication, registration, account management as well as 3rd party (social) account authentication"
arch=(any)
url="https://github.com/$_githubauthor/$_pkgname"
license=('MIT')
makedepends=('git')
depends=('python-django'
         'python-openid'
         'python-requests' 
         'python-requests-oauthlib')
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
