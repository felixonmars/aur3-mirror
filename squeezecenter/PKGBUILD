# Maintainer:  Tom Killian <tom at archlinux dot org>
# Contributor in-part: Paul Mattal <paul at archlinux dot org>
# Contributor: 7.4.1 version Johannes Kingma <johannes.kingma at gmail dot com>

pkgname=squeezecenter
# For the time being publish this package under its old name
_pkgname=squeezeboxserver

pkgrel=7
pkgver=7.4.1

# Squeezecenter tarballs have an internal buildnumber
_pkgvertgz=7.4.1-28947

pkgdesc="Powerful streaming audio server from Logitech (former Slimdevices)"
depends=('perl')
source=(http://www.slimdevices.com/downloads/SqueezeboxServer_v${pkgver}/${_pkgname}-${pkgver}.tgz 
        ${_pkgname}.rc
        ${_pkgname}.conf.d
        )
md5sums=('fa65636e7df75ae7af884a2efa184639'
         '354e109a1ad9d1ea35ff71c80289b6c5'
         '3c2b29c60e939f064c354ad0f8cd9a9d')

url="http://www.logitechsqueezebox.com/products/overview.html"
license=('GPL')
arch=('i686' 'x86_64')
backup=('etc/conf.d/${_pkgname}' 'etc/rc.d/${_pkgname}')
install=${_pkgname}.install
replaces=(squeezecenter)

build() {
  cd $srcdir/${_pkgname}-${_pkgvertgz} || return 1

  mkdir -p $pkgdir/opt/${_pkgname} || return 1
  cp -a * $pkgdir/opt/${_pkgname} || return 1
  install -D -m755 ../${_pkgname}.rc $pkgdir/etc/rc.d/${_pkgname} || return 1
  install -D -m644 ../${_pkgname}.conf.d $pkgdir/etc/conf.d/${_pkgname} || return 1
  mkdir $pkgdir/opt/${_pkgname}/prefs
}

