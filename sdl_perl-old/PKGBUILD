# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=sdl_perl-old
_realname=SDL_Perl
pkgver=2.2.6
pkgrel=1
pkgdesc="A Perl wrapper for SDL (old version)"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://sdl.perl.org"
depends=('perl>=5.10.1' 'sdl_net' 'sdl_ttf' 'sdl_image>=1.2.8' 'sdl_mixer>=1.2.10'
         'mesa' 'sdl_gfx>=2.0.20' 'smpeg')
makedepends=('perl-yaml')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/K/KT/KTHAKORE/${_realname}-v${pkgver}.tar.gz)
md5sums=('445950ca7b9991f34ec792bbac8386b6')

build() {
  cd "${srcdir}/${_realname}-v${pkgver}"
  # install module in vendor directories
  perl Build.PL installdirs=vendor destdir="${pkgdir}" \
                --config man1ext=1p --config man3ext=3pm
  perl Build
}

package() {
  cd "${srcdir}/${_realname}-v${pkgver}"

  perl Build install

  rm -r "$pkgdir/usr/share"
  install -dm755 "$pkgdir/opt"
  mv "$pkgdir/usr/lib/perl5/vendor_perl" "$pkgdir/opt/sdl_perl"
}
