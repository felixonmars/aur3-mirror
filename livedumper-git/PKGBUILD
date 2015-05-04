# Maintainer: Yamashita Ren <lemaitre dot lotus at gmail dot com>

pkgname=livedumper-git
_pkgname=livedumper
pkgver=0.3.0.r44.b0f22a3
pkgrel=1
arch='any'
pkgdesc="Livestreamer stream dumper"
depends=('livestreamer' 'python-appdirs' 'python-requests')
license='Simplified BSD'
url="https://github.com/m45t3r/livedumper"
source=("git://github.com/m45t3r/livedumper.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/livedumper"

  local _ver=$(awk -F '\"' '/version/ {print $2} ' setup.py)
  printf "$_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}/"
  python3 setup.py install --root=${pkgdir} --optimize=1
}

