# Maintainer: Jason Kölker <jason@koelker.net>
pkgname=xdm-git
pkgver=20130922
pkgrel=1
pkgdesc="XDM: eXtendable Download Manager. Plugin based media collection manager."
arch=(any)
url="https://github.com/lad1337/XDM"
license=('GPL3')
depends=('python2')
makedepends=('git')
backup=('etc/conf.d/xdm')
install='xdm.install'
source=('xdm.service' 'xdm.conf')
md5sums=('05484cebebfd0bfce8e24e5bebf1fb18'
         'b8a2d0882f1628597ff44761081fc525')

_gitroot=git://github.com/lad1337/XDM.git
_gitname=XDM

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."
}

package() {
  install -d ${pkgdir}/opt/
  cp -r ${srcdir}/${_gitname} ${pkgdir}/opt/xdm

  install -D -m644 "${srcdir}/xdm.conf" "${pkgdir}/etc/conf.d/xdm"
  install -D -m644 "${srcdir}/xdm.service" "${pkgdir}/usr/lib/systemd/system/xdm.service"
}

# vim:set ts=2 sw=2 et:
