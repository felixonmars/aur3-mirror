pkgname=libcap-git
_pkgname=libcap
pkgver=2.24.4.g0ee9421
pkgrel=1
pkgdesc="Library for getting and setting POSIX.1e capabilities"
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=linux/kernel/git/morgan/libcap.git;a=summary"
license=('LGPL2.1')
depends=('attr' 'pam')
makedepends=('git')
provides=("libcap=${pkgver%.*.*}")
conflicts=('libcap')
options=('!staticlibs')
backup=('etc/security/capability.conf')
source=('git://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo "$(git describe | cut -f3- -d - | sed 's/-/./g')"
}

build() {
  cd "$_pkgname"

  export CC="${CC:-gcc}"

  sed -i "/SBINDIR/s#sbin#bin#" Make.Rules

  for flags in {C,CXX,LD}FLAGS; do
    [[ ${!flags} ]] && printf '%s += %s\n' "$flags" "${!flags}"
  done >> Make.Rules

  make -j1 CC="${CC}" LD="${CC} -shared" DYNAMIC=yes
}

package() {
  cd "$_pkgname"
  make prefix=/usr lib=/lib DESTDIR="$pkgdir" RAISE_SETFCAP=no install
  install -Dm0444 'pam_cap/capability.conf' "$pkgdir/etc/security/capability.conf"
}

# vim:set ts=2 sw=2 et:
