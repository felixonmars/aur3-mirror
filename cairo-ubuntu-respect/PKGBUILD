# Maintainer:  Todd Partridge <toddrpartridge@gmail.com>
# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Biru Ionut <biru.ionut at gmail.com>

# Installation order:  freetype2-ubuntu fontconfig-ubuntu libxft-ubuntu cairo-ubuntu

pkgname=cairo-ubuntu-respect
pkgver=1.8.8
_pkgver=2ubuntu1
pkgrel=1
pkgdesc="Cairo vector graphics w/ Ubuntus' LCD patchs (respect global fontconfig)"
arch=(i686 x86_64)
url="http://packages.ubuntu.com/jaunty/libcairo2"
license=('LGPL' 'MPL')
depends=('fontconfig-ubuntu>=2.6.0' 'libpng' 'libxft-ubuntu' 'libxrender' 'pixman>=0.12.0' 'xcb-util>=0.3.2')
makedepends=('pkgconfig')
provides=("cairo=$pkgver")
conflicts=('cairo' 'cairo-cleartype' 'cairo-lcd' 'cairo-xeffects' 'cairo-ubuntu')
options=('!libtool')
source=(http://cairographics.org/releases/cairo-${pkgver}.tar.gz
        http://archive.ubuntu.com/ubuntu/pool/main/c/cairo/cairo_${pkgver}-${_pkgver}.diff.gz
        cairo-respect-fontconfig.patch)
md5sums=('d3e1a1035ae563812d4dd44a74fb0dd0'
         'f6f1ff76133abe521a4f4ed373af66df'
         '7fda6231bf40f87fa7ca6a97e4244ede')


build() {
  cd ${srcdir}/cairo-${pkgver}

  # Ubuntu patch
  patch -Np1 -i ../cairo_${pkgver}-${_pkgver}.diff || return 1

  for _f in $(cat debian/patches/00list) ; do
    patch -Np1 -i debian/patches/${_f} || return 1
  done

  # Respect global font configuration
  patch -Np1 -i ../cairo-respect-fontconfig.patch || return 1

  # Redirect to the new png library
  sed -i -e 's/libpng13/libpng14/g' configure || return 1

  ./configure --prefix=/usr --sysconfdir=/etc \
	--localstatedir=/var --enable-xcb --disable-static || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Docs
  # Excluding debian/changelog temporarily
  install -d ${pkgdir}/usr/share/doc/cairo/ || return 1
  install -m644 -t ${pkgdir}/usr/share/doc/cairo/ NEWS README || return 1
}
