# Contributor: Mario St-Gelais <mario.stg@sympatico.ca>

pkgname=adesklet-pacmansentry
_pkgname=pacmansentry
pkgver=0.0.6
pkgrel=2
pkgdesc="Displays updatable Arch Linux packages available for the current system ."
arch=('i686' 'x86_64')
url="http://adesklets.sourceforge.net/desklets.html"
license=('GPL')
depends=('adesklets')
groups=('adesklet-desklets')
backup=('usr/share/adesklets/pacmansentry/config.txt')
source=(http://downloads.sourceforge.net/adesklets/$_pkgname-$pkgver.tar.bz2)
md5sums=('e656b9f7456ea3efe49c7e3328907dcf')

build() {
  mkdir -p $startdir/pkg/usr/share/adesklets/pacmansentry
  cd $startdir/src/$_pkgname-$pkgver/
  install -m664 -g adesklets GNUmakefile README config.txt $startdir/pkg/usr/share/adesklets/pacmansentry/
  install -D -m775 -g adesklets pacmansentry.py $startdir/pkg/usr/share/adesklets/pacmansentry/pacmansentry.py
}

