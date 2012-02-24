# Maintainer: Christopher O'Neill <milkytracker at chrisoneill co uk>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=milkytracker
pkgver=0.90.85
pkgrel=2
pkgdesc="Fast Tracker II inspired music tracker"
arch=('x86_64' 'i686')
url="http://www.milkytracker.org/"
license=('GPL3')
depends=('sdl>=1.2.0' 'alsa-lib' 'zlib')
optdepends=('jack-audio-connection-kit: JACK audio support')
options=('docs')
source=("http://milkytracker.org/files/$pkgname-$pkgver.tar.bz2"
        'milkytracker.desktop'
        '64bit_freebsd_fix.patch'
        'doc_fix.patch'
        'jack_autoconnect.patch'
        'no_zziplib_dep.patch'
        'gzip.patch')
sha256sums=('59a0d294d63752be74b157e07b0c70252c9198c312d9b1ad0ca460129fe5bd80'
            'c947a7b0689900c8ebfa29113553be87b7b151714c24f84f286ff81cd5e69063'
            '23fed6208f57aa6eebce0688e4c8015c53e2588c48696e799eb234125f39c7a9'
            '8219ce3f6053a6d1049135fb9de918e9d1ec526a133c6b0f19d3e1facf0740a2'
            '2ed764f8d80932e32e4ca26e1afcad9bc7a50b8924a74d626af6d91ce5df34e9'
            '2923bf00d339c1b71c0347707913d65a356732221ed404afc4b29c7aa02f55d4'
            '0726de7f42e469e2861ef7abf0bd8ec85114fd3c6d8452fbc2791e0b15eb2bfa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  patch -p1 -i ../64bit_freebsd_fix.patch 
  patch -p1 -i ../doc_fix.patch 
  patch -p1 -i ../jack_autoconnect.patch 
  patch -p1 -i ../no_zziplib_dep.patch
  patch -p1 -i ../gzip.patch

  ./configure --prefix=/usr --with-alsa
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/doc/milkytracker"
  install -Dm644 resources/pictures/carton.png \
    "$pkgdir/usr/share/pixmaps/milkytracker.png"
  install -m644 "$srcdir/milkytracker.desktop" "$pkgdir/usr/share/applications"
  install -m644 docs/ChangeLog.html "$pkgdir/usr/share/doc/milkytracker"
  install -m644 docs/MilkyTracker.html "$pkgdir/usr/share/doc/milkytracker"
  install -m644 docs/readme_unix "$pkgdir/usr/share/doc/milkytracker"
  install -m644 docs/FAQ.html "$pkgdir/usr/share/doc/milkytracker"
}

# vim:set ts=2 sw=2 et:
