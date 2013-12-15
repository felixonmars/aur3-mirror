# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=leselys-git
pkgver=0.2.5.1.57d35d1
pkgrel=1
pkgdesc='Web based elegant RSS reader'
arch=('any')
url='https://github.com/socketubs/leselys'
license=('AGPL3')
depends=('python2-docopt' 'python2-celery' 'python2-werkzeug' 'python2-jinja'
         'mongodb' 'python2-lxml' 'python2-itsdangerous' 'python2-flask'
         'python2-pymongo' 'python2-py-bcrypt' 'python2-feedparser'
         'python2-requests')
source=("${pkgname}::git+https://github.com/socketubs/${pkgname/-/.}")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo -n $(grep version leselys/__init__.py | awk '{ print $3 }' | sed "s|'||g")
  echo .$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd ${pkgname}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
