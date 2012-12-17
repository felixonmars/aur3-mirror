# Maintainer: Steven Allen <steven@stebalien.com>

pkgname='reviewboard-django-pipeline'
_orig_pkg_name='django-pipeline'
pkgver=1.2.22
_git_commit_id=68fd6b7
pkgrel=1
pkgdesc="An asset packaging library for Django, providing both CSS and JavaScript concatenation and compression, built-in JavaScript template support, and optional data-URI image embedding."
arch=('any')
url="https://github.com/cyberdelia/django-pipeline"
license=('MIT')
depends=('python2' 'django')
makedepends=('python2-sphinx')
optdepends=('yuicompressor: for css and js compression')
replaces=("$_orig_pkg_name")
source=("${_orig_pkg_name}-${pkgver}.tar.gz::https://github.com/cyberdelia/${_orig_pkg_name}/tarball/${pkgver}")
md5sums=('38fb54a1b14d8f8eae20b459489a535e')

build() {
  cd "$srcdir/cyberdelia-$_orig_pkg_name-$_git_commit_id"
  python2 setup.py build_sphinx -b man

  # Compress the man pages without generating .gz.gz... on rebuild
  find build/sphinx/man/ -name '*.[0-8n]' -exec gzip -f '{}' \;
}

package() {
  cd "$srcdir/cyberdelia-$_orig_pkg_name-$_git_commit_id"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  # Remove test cases
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests/

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_orig_pkg_name/LICENSE"

  # Slightly more complicated but flexable.
  find build/sphinx/man/ -name '*.[0-8n].gz' | while read doc; do
      install -D -m 644 "$doc" $pkgdir/usr/share/man/man"$(echo $doc|sed 's/.*\.\([0-8n]\)\.gz/\1/')"/"$(basename $doc)"
  done
}
