# Contributor: robb_force <robb_force@holybuffalo.net> and fana-m
# edited by tcleval

pkgname=raine-emulator
pkgver=0.51.9
pkgrel=1
pkgdesc="A multiple arcade emulator mainly focused on Taito and Jaleco games."
url="http://rainemu.swishparty.co.uk/html/download/latest.html"
license=('unknown')
arch=('i686')
depends=('sdl_ttf' 'sdl_image' 'muparser' 'sdl_sound')
makedepends=('nasm')
source=(raine.sh)
#install=raine.install
md5sums=('c64f64ffbbcc732822ad1e540dde327a')


_source ()
{
    local dlfile=http://rainemu.swishparty.co.uk/html/archive/raines-${pkgver}.tar.bz2
    local file=raines-${pkgver}.tar.bz2
    if [[ ! -f "${startdir}/src/$file" ]]; then
	cd ${startdir}/src/
	wget "$dlfile" --referer="$url" 
    fi

    local md5=`md5sum $file | cut -d " " -f1`
    if [ $md5 != 43e08bacbc5eea481d1304fb519dab37 ]; then
	echo MD5 error on file $file
	exit 1
    fi
   
    tar xvfj $file

}

build()
{
  _source
  cd ${startdir}/src/raine-${pkgver}
  
  # The makefile seems to have the cpu detection out of sequence, so
  # do it first.
  sh ./detect-cpu

  # Fix share directory for Arch and install the binary to /usr/share/raine
  sed -e 's/\$(prefix)\/games/\$(prefix)\/bin/' \
    -e 's|/share/games|/share|' \
    -e 's|/usr/bin/install|/bin/install|' \
    -e 's|$(RAINE_EXE) $(bindir)|$(RAINE_EXE) $(rainedata)|' \
    -e 's|NEO=1|#NEO=1|' \
    -i makefile
  make || return 1
  make DESTDIR=${startdir}/pkg install

  # Install the raine script to get around problems finding the fonts
  cd ${startdir}/src
  install -m755 raine.sh ${startdir}/pkg/usr/bin/raine
}



