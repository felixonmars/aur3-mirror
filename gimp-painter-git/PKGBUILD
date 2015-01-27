# Maintainer: maz-1 <loveayawaka at gmail dot com>

pkgname=gimp-painter-git
pkgver=20150126.b5b143f
pkgrel=1
pkgdesc="Fork of GIMP aiming to add drawing and painting features to GIMP. Git version"
arch=('i686' 'x86_64')
url="http://www.gimp.org"
license=('GPL' 'LGPL')
groups=()
depends=('lcms2>=2.2' 'libwmf>=0.2.8' 'webkitgtk2>=1.6.1' \
         'libgexiv2' 'librsvg>=2.16.1' 'libpng>=1.2.27' \
         'fontconfig>=2.2.0' 'desktop-file-utils' \
         'libexif>=0.6.15' 'libart-lgpl>=2.3.19' 'pygtk' 'dbus-glib' 'gtk-doc' \
          'openexr>=1.6.1' 'cairo>=1.12.2' 'hicolor-icon-theme') #'gegl'
makedepends=('gutenprint>=5.0.0' 'intltool>=0.40.1' \
  'gnome-python>=2.16.2' 'poppler>=0.12.4' 'pkgconfig>=0.21' \
  'alsa-lib>=1.0.0' 'libtool>=2.2' 'autoconf>=2.54' 'automake>=1.10' \
  'libxslt' 'pango>=1.29.4' 'curl>=7.15.1' 'gettext' 'git')
optdepends=('gimp-paint-studio: Extra brushes and accompanying tool presets'
			'gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'poppler-glib: for pdf support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support'
            )
options=('!libtool' '!makeflags')
conflicts=('gimp' 'gimp-painter')
replaces=()
backup=()
install='gimp-painter.install'
source=(git://github.com/seagetch/gimp-painter.git
		linux.gpl)
md5sums=('SKIP'
         'bb27bc214261d36484093e857f015f38')

# Set to 1 to auto-rebase gimp-painter-git onto official gimp repository
# Set to 0 if you just want to use the raw gimp-painter-git, which doesn't
# get rebased all that often.
# Attention : branch is set to gimp-2-8 by default.
# If you enabled auto-rebase and set branch to master,you must have gegl-git and babl-git .
_rebase=0
_branch=gimp-2-8

if [ $_rebase -eq 1 ]; then
    source[${#source[@]}]='git://github.com/GNOME/gimp.git'
    md5sums[${#md5sums[@]}]='SKIP'
	
	if [ $_branch = "master" ]; then
		depends[${#depends[@]}]='gegl-git'
		provides=('gimp=2.9')
	else
		provides=('gimp=2.8')
		depends[${#depends[@]}]='gegl'
	fi
	
else
	provides=('gimp=2.8')
	depends[${#depends[@]}]='gegl'
fi

noextract=()

_gitname=gimp-painter

pkgver() {
	cd $_gitname
	GITREV=$(git describe --always|awk -F"-" '{print $NF}')
	echo `date +%Y%m%d`.${GITREV}
}

build() {
#	if [ "$_rebase" -eq 1 ]; then
#		cd "$srcdir/gimp"
#		git checkout $_branch
#	fi
	
  cd "$srcdir/$_gitname"

  # Try to rebase onto upstream, skipping patches that fail
  if [ "$_rebase" -eq 1 ]; then
      local failed=0
      local needreconf
      msg2 "Attempting to auto-rebase onto latest upstream. Set _rebase to 0 to disable this."
      git remote add upstream "$srcdir"/gimp || true
      git fetch upstream
      local ret=0
      # Set a  throwaway name (local to just this build repo)
      git config user.email "gimp-painter-git@rebasing.patches.localhost"
      git config user.name "gimp-painter-git auto-rebase"
      git rebase upstream/$_branch || ret=1
      while [ $ret -ne 0 ]; do
        ret=0
        warning "SKIPPING patch that no longer applies: $(cat .git/rebase-apply/msg-clean)"
        ret=0
        (( ++failed ))
        git rebase --skip || ret=1
      done
      [ "$failed" -eq 0 ] || warning "$failed gimp-painter patches failed to rebase on upstream and were dropped"
  fi





#  sed -i -e 's/automake-1.11/automake-1.14/g' \
#    -e 's/aclocal-1.11/aclocal-1.14/g' autogen.sh

  PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr --sysconfdir=/etc \
    --enable-mp --enable-gimp-console --enable-gimp-remote \
    --enable-python --with-gif-compression=lzw --with-libcurl \
    --without-aa --without-hal --without-gvfs --without-gnomevfs
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' "${pkgdir}"/usr/lib/gimp/2.0/plug-ins/*.py
  install -D -m644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/2.0/palettes/Linux.gpl"
	
	GIMPBIN=` ls ${pkgdir}/usr/bin | grep -e 'gimp-2' `
	GIMPCLIBIN=` ls ${pkgdir}/usr/bin | grep -e 'gimp-console-2' `
  [ -f ${pkgdir}/usr/bin/gimp ] || ln -s $GIMPBIN ${pkgdir}/usr/bin/gimp
  [ -f ${pkgdir}/usr/bin/gimp-console ] || ln -s GIMPCLIBIN ${pkgdir}/usr/bin/gimp-console
}

