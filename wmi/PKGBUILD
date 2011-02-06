# Contributor: Fabio Scotoni <fabio@esse.ch>
pkgname=wmi
pkgver=10
pkgrel=1
pkgdesc="The predecessor of wmii."
arch=('i686' 'x86_64') # x86_64 hasn't been tested! It may segfault,
                       # Eliminate your data and what not.
                       # You have been warned!
url="http://www.suckless.org"
# But you won't find any page to wmi
license=('custom:MIT')
depends=() # And an X-Server of course, but we don't want to force anything.
makedepends=('sed' 'awk' 'findutils' 'make')
options=('docs')
# You really shouldn't disable this option, as you probably need
# this only form of documentation to wmi, but the source.
source=("http://code.suckless.org/dl/misc/$pkgname-$pkgver.tar.gz" \
"wmi-10-compile-fixes.patch")
md5sums=('6728ae28aaa172db3df1e3c2bc483b23'
         'f4035f1495f8bdbb13f2dc9e9b538161')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  patch -p1 -i../wmi-10-compile-fixes.patch
  # All thanks for this patch please go to Sergey Dolgov.
  # I found it on the mailing list.
  # By the way: Thank you, Sergey Dolgov!
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
