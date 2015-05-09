pkgname=buildhck-git
pkgver=r90.6465a39
pkgrel=1
pkgdesc="Micro build automation client/server framework"
arch=('any')
url="https://github.com/Cloudef/buildhck"
license=('AGPLv3')

depends=('python-bottle-git' 'python-yaml' 'python-xdg' 'uwsgi' 'uwsgi-plugin-python')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest')

provides=('buildhck')
conflicts=('buildhck')
backup=('etc/xdg/buildhck/config.yaml' 'etc/uwsgi/buildhck.ini')

source=("$pkgname::git+https://github.com/Cloudef/buildhck.git"
        'buildhck.ini'
        'buildhck.service')
md5sums=('SKIP'
         '26b36a3d1eee9ba019e8bb0f8daa882c'
         '1dff8684fcf743376795272c4dff0731')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname

  python setup.py build
}

check() {
  cd $pkgname

  python setup.py test
}

package() {
  cd $pkgname

  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname"
  install -D -m644 config.yaml.example "${pkgdir}/etc/xdg/buildhck/config.yaml"
  install -D -m644 ../buildhck.ini "${pkgdir}/etc/uwsgi/buildhck.ini"
  install -D -m644 ../buildhck.service "${pkgdir}/usr/lib/systemd/system/buildhck.service"
}
