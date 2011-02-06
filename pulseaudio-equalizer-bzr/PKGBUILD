# Contributor: Benjamin Bukowski <benjamin.bukowski@gmail.com>

pkgname=pulseaudio-equalizer-bzr
pkgver=4
pkgrel=4
pkgdesc='LADSPA based system-wide equalizer for pulseaudio'
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~psyke83/+junk/pulseaudio-equalizer"
license=('GPL3')
depends=('pulseaudio' 'bc' 'cmt' 'liblrdf' 'swh-plugins' 'pygtk' 'python2' 'gnome-icon-theme')
makedepends=('bzr')
source=('fix-pulseaudio-equalizer-icon.patch' 'python2.patch')

_bzrtrunk=lp:~psyke83/+junk/pulseaudio-equalizer
_bzrmod=pulseaudio-equalizer

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  bzr branch ${_bzrtrunk} -q -r ${pkgver}

  msg "BZR checkout done or server timeout"

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

	msg "Applying icon patch..."
	patch -Np1 -i ../fix-pulseaudio-equalizer-icon.patch

	msg "Applying python2 patch..."
	patch -Np1 -i ../python2.patch

	install -dm755 $pkgdir/usr/bin
	install -dm755 $pkgdir/usr/share/pulseaudio-equalizer/presets
	install -dm755 $pkgdir/usr/share/applications

	install -m755 usr/bin/pulseaudio-equalizer $pkgdir/usr/bin/
	install -m755 usr/bin/pulseaudio-equalizer-gtk $pkgdir/usr/bin/
	install -m644 usr/share/pulseaudio-equalizer/presets/* $pkgdir/usr/share/pulseaudio-equalizer/presets/
	install -m755 usr/share/pulseaudio-equalizer/pulseaudio-equalizer.py $pkgdir/usr/share/pulseaudio-equalizer/
	install -m644 usr/share/applications/pulseaudio-equalizer.desktop $pkgdir/usr/share/applications

}
md5sums=('64c77b2678bba9ff57273a627b353d74'
         '8d1484382ec20f790ab51a0ceb2f8053')
