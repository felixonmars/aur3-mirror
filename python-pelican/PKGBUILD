# Maintainer: Jashandeep Sohi <jashandeep.s.sohi@gmail.com>

pkgname='python-pelican'
pkgver=git
pkgrel=1
pkgdesc='A static site generator, written in Python.'
url='http://blog.getpelican.com/'
license=('AGPL3')
source=($pkgname'::git+https://github.com/getpelican/pelican.git')
md5sums=('SKIP')
arch=('any')
depends=(
 'python-feedgenerator'
 'python-jinja'
 'python-pygments'
 'python-docutils'
 'python-pytz'
 'python-blinker'
 'python-unidecode'
 'python-six'
 'python-markupsafe'
 'python')
makedepends=('git' 'python')
optdepends=(
 'python-markdown: for supporting Markdown as an input format.'
 'python-typogrify: for typographical enhancements.'
)

pkgver() {
  cd "$srcdir/$pkgname"
  echo -n git_$(
    git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
  )
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root=$pkgdir
}

#vim: tabstop=1 expandtab
