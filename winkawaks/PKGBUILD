# Maintainer: M4rQu1Nh0S <zonadomarquinhos@gmail.com>
pkgname=winkawaks
pkgver=1.63
pkgrel=1
pkgdesc="Kawaks, The BEST arcade game emulator for Capcom and NeoGeo games"
arch=('any')
url="http://www.winkawaks.org/"
license=('freeware')
groups=('emulators')
depends=('wine>=1.7.17')
install=$pkgname.install
source=('http://www.winkawaks.org/kawaks/WinKawaks.zip' 'winkawaks.desktop' 'winkawaks.ico' 'winkawaks' 'mfc42.dll')
sha1sums=('6a28fa0667999aad3f0ac6abaa7782ff4bdb026b'
          '75d3e115a2d89baa7d1d6ded68bb318d83e72a4c'
          '1f5bc7fb4323ccc7a4702beb669645b1bdec5b3f'
          'fcaee9a7b177f6975cd403ee4669ebc664799ff0'
          '09bc253b6744d2c6f9fad8b9958e8ad097311ca1')


package() {
 install -D $startdir/mfc42.dll $pkgdir/usr/share/$pkgname/mfc42.dll
 install -D $startdir/$pkgname $pkgdir/usr/bin/$pkgname
 install -D $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
 install -D $startdir/$pkgname.ico $pkgdir/usr/share/icons/$pkgname.ico

cd $srcdir/WinKawaks
mv * $pkgdir/usr/share/$pkgname
}

# vim:set ts=2 sw=2 et:
