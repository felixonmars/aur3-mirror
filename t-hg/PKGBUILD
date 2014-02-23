# Maintainer: Spencer Judd <spencercjudd@gmail.com>
pkgname=t-hg
pkgver=r76.1c496e933168
pkgrel=1
pkgdesc="A command-line todo list manager for people that want to finish tasks, not organize them."
arch=(any)
url="http://stevelosh.com/projects/t/"
license=('custom')
depends=('python2')
makedepends=('mercurial')
provides=('t')
source=("$pkgname::hg+https://bitbucket.org/sjl/t")
md5sums=('SKIP')

_site_pkgs=$(python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i "/\/usr\/bin\/env python/s/$/2/" t.py
  echo -e "#!/bin/bash\npython2 $_site_pkgs/t.py --task-dir ~/tasks --list tasks \$@" > t
}
  
package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m755 "$srcdir/$pkgname/t" "$pkgdir/usr/bin/t"
  install -D -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
