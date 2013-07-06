# Maintainer: Chris Fordham <chris.fordham@rightscale.com>

pkgname=collectd4.10-deb
pkgver=4.10.1
pkgrel=1
pkgdesc='Daemon which collects system performance statistics periodically'
arch=('x86_64')
url="http://collectd.org/"
license=('GPL')
makedepends=(binutils tar)
conflicts=(collectd)

_pkg_site=http://http.us.debian.org
_pkg_site_href=debian/pool/main/c/collectd
_dist_rel=squeeze
_dist_rel_rev=2
_pkg_arch=amd64

source=(
  ${_pkg_site}/${_pkg_site_href}/collectd_${pkgver}-${pkgrel}+${_dist_rel}${_dist_rel_rev}_${_pkg_arch}.deb
  ${_pkg_site}/${_pkg_site_href}/collectd-core_${pkgver}-${pkgrel}+${_dist_rel}${_dist_rel_rev}_${_pkg_arch}.deb
  collectd.service
)

md5sums=('4913ca949c7921faf6a18da4bdab271d'
         '05bdc3ea8d88a8efd74bee24f22ea161'
         '49d0d7318de8df30656fb9ef25a8e3a7')        # generate with 'makepkg -g'

prepare() {
  cd "$srcdir"
  
  msg "Extracting collectd debian binary package..."
  ar x "$srcdir/collectd_${pkgver}-${pkgrel}+${_dist_rel}${_dist_rel_rev}_${_pkg_arch}.deb"
  
  msg "Extracting data.tar.gz..."
  tar zxf "$srcdir/data.tar.gz"
  rm "$srcdir/data.tar.gz"
  
  msg "Extracting collectd debian binary package..."
  ar x "$srcdir/collectd-core_${pkgver}-${pkgrel}+${_dist_rel}${_dist_rel_rev}_${_pkg_arch}.deb"
  
  msg "Extracting data.tar.gz..."
  tar zxf "$srcdir/data.tar.gz"
  rm "$srcdir/data.tar.gz"
}

package() {
  msg 'Copying /etc into package.'
  cp -R "$srcdir/etc" "$pkgdir/"

  msg 'Copying /usr into package.'
  cp -R "$srcdir/usr" "$pkgdir/"

  msg 'Copying /var into package.'
  cp -R "$srcdir/var" "$pkgdir/"
  
  msg 'Installing collectd.service.'
  install -Dm644 ../collectd.service "${pkgdir}"/usr/lib/systemd/system/collectd.service
}

# vim:set ts=2 sw=2 et: