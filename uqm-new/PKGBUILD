# Quick note: Nearly all of the stuff in here is from the official uqm package.
#             The things changed is the version, the conflicts/provides, the
#             package name and adding a menu icon.

# uqm package
# Maintainer : Daenyth <Daenyth+Arch _AT_ gmail _DOT_ com>
# Contributor : wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: tochiro@no.spam.mail.berlios.de
# Contributor: sh__

# uqm-new
# Maintainer : Jookia <166291@gmail.com.spam>

pkgname=uqm-new
pkgver=0.7.0
pkgrel=1
pkgdesc="The Ur-Quan Masters is a port of Star Control 2"
arch=(i686 x86_64)
url="http://sc2.sf.net/"
license=('GPL')
depends=('libmikmod' 'libvorbis' 'sdl_image' 'libgl')
makedepends=('imagemagick')
optdepends=('uqm-sound: For extra music and conversation audio')
conflicts=('uqm')
provides=('uqm')
source=(http://downloads.sourceforge.net/sourceforge/sc2/uqm-${pkgver}-source.tgz
        http://downloads.sourceforge.net/sourceforge/sc2/uqm-0.7.0-content.uqm
        config.state uqm uqm.desktop uqm.png)
md5sums=('f9018ea0493d7dac6a9e1006b00af7df' '2f36dcb15274dbbcb5e266f2ed84d5b2'
         '07f0a0e74a0b1c706940cc43d5a4160c' '07e64632fce6323a14ab558d0214b885'
         '771272cd2e4073db593f4dff14aea582' '57b7d8f10a05431eb7aa3d75724b43b9')

build() {
  cd $srcdir/uqm-$pkgver
  
  cp $srcdir/config.state .
  sed -e "/INPUT_install_prefix/ s|replaceme|$pkgdir/usr|" \
      -i config.state

  echo | ./build.sh uqm config || return 1

  ./build.sh uqm || return 1
  ./build.sh uqm install

  install -Dm644 $srcdir/uqm-0.7.0-content.uqm \
     $pkgdir/usr/share/uqm/content/packages/uqm-0.7.0-content.uqm

  rm $pkgdir/usr/bin/uqm
  install -Dm755 $srcdir/uqm $pkgdir/usr/bin/uqm
  
  # Desktop launcher with icon
  install -D -m644 "${srcdir}/uqm.desktop" "${pkgdir}/usr/share/applications/uqm.desktop"
  install -D -m644 "${srcdir}/uqm.png"     "${pkgdir}/usr/share/pixmaps/uqm.png"
}

# vim:set ts=2 sw=2 et:
