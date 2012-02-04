# Maintainer: <padavankun@gmail.com>
pkgname="kf"
pkgver=0.5.4.1
pkgrel=1
pkgdesc="simple jabber client based gtk+"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/kf/"
license=('GPL2')
#groups=()
depends=('gtk2' 'libglade' 'loudmouth')
#makedepends=('subversion')
otpdepends=('gtkspell')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=$pkgname.install
patchname1="typedef_KfJispManager.patch"
patchname2="autoaway-null-pointer-check.patch"
source=(http://fedorahosted.org/releases/k/f/kf/$pkgname-$pkgver.tar.gz
		$patchname1
		$patchname2)

#noextract=()
md5sums=('f963f289b7a1221f192a540fbda5cd55'
         'a5bc15787e1c94ba7b6cc9ea9a61fd7e'
         '82b5025a1b72be1b65c2d2430e3bcdb9')

build() {
  cd "$srcdir"
 
  cd "$srcdir/$pkgname-$pkgver/src"
  patch -Np1 -i ${srcdir}/${patchname1}
  patch -Np1 -i ${srcdir}/${patchname2}

  msg "Starting make..."
  
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-binreloc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  cd "$pkgdir/usr/bin"
  mv kf kf-im
}
