# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

_pkgname=elocation
pkgname=$_pkgname-git
pkgver=0.1.0.119.2ae2d0a
pkgrel=1
pkgdesc="EFL based library to get location information"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('unknown')
depends=('efl')
makedepends=('git')
source=("git://git.enlightenment.org/devs/stefan/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for _i in v_maj v_min v_mic; do
    local v_ver=${v_ver#.}.$(grep -m1 $_i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  v_ver=$(awk -F , -v v_ver=$v_ver '/^AC_INIT/ {gsub(/v_ver/, v_ver); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
}
