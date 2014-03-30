#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python-aur
pkgver=2014
pkgrel=1
pkgdesc='AUR-related modules and helper utilities (aurploader, aurquery, aurtomatic).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-aur"
depends=(python python-xdg)
optdepends=('curl: Aurploader support')
replaces=(aurploader)
conflicts=(aurploader)
provides=(aurploader)
source=(
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2014.tar.xz
  http://xyne.archlinux.ca/projects/python3-aur/src/python3-aur-2014.tar.xz.sig
)
sha512sums=(
  746f70fa233d06ba4d407dfd5b784759a1809b5a93633cd5f293b5e4fc447fac0affbe6eacea30988c6476ebfd7eefc3fd03770307395716244a804f84c38bcb
  75c2c879b3045f57a723d406bf2254bf57f81729bff2904504c2fccefefd433a44d3b41f64bc3cf1844dc18cf347d24ee73a3f85ef9f9e1e1229c51f18b1c177
)
md5sums=(
  62578ebe79e919ed20bb47bcdb061719
  c91eedcd097a9e3806d9d3328717c7b6
)

package ()
{
  cd "$srcdir/python3-aur-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  for aurfoo in aur*
  do
    if [[ -x "$aurfoo" ]]
    then
      install -Dm755 "$aurfoo" "$pkgdir/usr/bin/$aurfoo"
    fi
  done
}


# vim: set ts=2 sw=2 et:
