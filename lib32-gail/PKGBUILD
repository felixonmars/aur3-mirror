# Contributor: Antti Oja <antti.bofh(AT)gmail.com>

_pkgsourcename=gail
pkgname=lib32-gail
pkgver=1.22.3
pkgrel=1
pkgdesc="The GNOME Accessibility Project"
arch=(x86_64)
license=('GPL')
depends=('lib32-gtk2>=2.12.9')
url="http://www.gnome.org"
groups=lib32
source=(ftp://ftp.ibiblio.org/pub/linux/distributions/archlinux/extra/os/i686/${_pkgsourcename}-${pkgver}-${pkgrel}-i686.pkg.tar.gz)
md5sums=('296a4d7a88721276c889cca883823b14')

build() {
  mkdir -p $startdir/pkg/opt/lib32/usr/
  cp -rPf $startdir/src/usr/lib $startdir/pkg/opt/lib32/usr/lib  
}
