# Maintainer: ilikenwf <parwok@gmail.com>
# Contributor: Noel Maersk <veox at wemakethings dot net>
# Contributor: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=cpuminer-quarkcoin
_gitname=cpuminer
pkgver=312.25ab5aa
pkgrel=1
pkgdesc="Multi-threaded CPU miner for Quarkcoin, Bitcoin and Litecoin (git version)"
arch=('i686' 'x86_64')
url="https://github.com/uncle-bob/quarkcoin-cpuminer"
license=('GPLv2')
depends=('curl' 'jansson')
conflicts=('cpuminer' 'cpuminer-git')
makedepends=('git' 'yasm' 'autoconf' 'automake' 'sed')
source=('cpuminer::git+https://github.com/uncle-bob/quarkcoin-cpuminer'
        'libcurl.m4'
        'rc-script.cpuminer'
        'cpuminer.conf')
md5sums=('SKIP'
         '5e22a13d29fa628c83c267cf9b4f3218'
         'b50db28641e7dd4554096639f19215b8'
         '96ee832cea2ff946bb890669cc7d34a0')
backup=(etc/conf.d/cpuminer.conf etc/cpuminer.json)

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

# comment out this function if /usr/share/aclocal/libcurl.m4 is present
prepare() {
  cd "$srcdir/${_gitname}"
  sed -i 's/aclocal/aclocal -I m4/' autogen.sh
  mkdir m4
  cp "$srcdir/libcurl.m4" "m4/libcurl.m4"
}

build() {
  cd "$srcdir/${_gitname}"

  # Use in-tree jansson
  # sed -e 's/^AC_CHECK_LIB(jansson, json_loads, request_jansson=false, request_jansson=true)$/request_jansson=true/' -i configure.ac

  ./autogen.sh
  #autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_gitname}"

  make DESTDIR="$pkgdir/" install
  install -Dm600 "example-cfg.json" "$pkgdir/etc/cpuminer.json"
  install -Dm644 "$srcdir/cpuminer.conf" "$pkgdir/etc/conf.d/cpuminer.conf"
  install -Dm755 "$srcdir/rc-script.cpuminer" "$pkgdir/etc/rc.d/cpuminer"

  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
