# Maintainer: György Balló <ballogy@freestart.hu>
_pkgname=clutter-sharp
pkgname=$_pkgname-git
pkgver=20111114
pkgrel=1
pkgdesc="C Sharp/Mono language bindings for clutter"
arch=('any')
url="http://www.clutter-project.org/"
license=('GPL')
depends=('gtk-sharp-2' 'clutter-gtk2')
makedepends=('git')
provides=('clutter-sharp')
conflicts=('clutter-sharp')
source=(clutter-sharp-dllmap
        actorbox-4.0
        color-cs0188
        fix-enable-docs.patch
        dont-bundle-mdb.patch
        dedup-pc-bundlefiles.patch
        dont-sign.patch
        use-unversioned-ilasm
        Fix-bashism-in-Makefile.patch
        dll-fix.patch)
md5sums=('2f7ffe75e341754f7d41739a7a1bf03a'
         'f22737739e04c5ee45041d776d21d73f'
         'b65bf44c8f36e42f1e4197551bd56d18'
         '62d8eb9d38fd3b3ac4f7dcfcb4b1b7f3'
         '0c1cbd47466c07de247f4360454dd9d0'
         'ad46fd80ed9cf02a88dc1db99fb1012b'
         'dc4f6c54565c8c4fa1105338046c5b58'
         '67124fb7ff623cce19563ab7112f98ae'
         'a3868aeb8c7fffd4599c5d866815bbf9'
         '694dbd4bf41f8f03ec944f3af0104390')

_gitroot="git://git.clutter-project.org/bindings/clutter-sharp.git"
_gitname="clutter-sharp"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  patch -Np1 -i "$srcdir/clutter-sharp-dllmap"
  patch -Np1 -i "$srcdir/actorbox-4.0"
  patch -Np1 -i "$srcdir/color-cs0188"
  patch -Np1 -i "$srcdir/fix-enable-docs.patch"
  patch -Np1 -i "$srcdir/dont-bundle-mdb.patch"
  patch -Np1 -i "$srcdir/dedup-pc-bundlefiles.patch"
  patch -Np1 -i "$srcdir/dont-sign.patch"
  patch -Np1 -i "$srcdir/use-unversioned-ilasm"
  patch -Np1 -i "$srcdir/Fix-bashism-in-Makefile.patch"
  patch -Np1 -i "$srcdir/dll-fix.patch"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
               --disable-static
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
}
