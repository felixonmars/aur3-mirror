# Contributor: 3ED <krzysztof1987@gmail.com>
pkgname=alsa-tools-emu10k1
pkgver=1.0.23
pkgrel=1
pkgdesc="ALSA tools package for emu10k1 sound card"
backup=(etc/rc.d/alsa-emu10k1d etc/conf.d/alsa-emu10k1d)
url="http://alsa-project.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('alsa-lib' 'alsa-utils')
optdepends=("alsa-tools-emu10k1-gui: dsp editor with gui in qt3")
sha256sums=('5e048633f0324c11998cdbc283ced30d72887f9bed1f2aeb85b9ee5e9e907099'
            '44bb7451ca9b89b7c4bebe2d8b7a726cfbb700397b92c77373886e9a5bc03edd'
            '5c6a85d43e03c5d556143ec10359398e722bcef0e9bc09ee6eb82ae4aa519e2b')
source=("ftp://ftp.alsa-project.org/pub/tools/alsa-tools-$pkgver.tar.bz2"
        "alsa-emu10k1d"
        "alsa-emu10k1d.conf")
install=alsa-tools-emu10k1.install

alsa_tools_mods=(ac3dec as10k1 ld10k1 seq)

build() {
  cd "$startdir/src/alsa-tools-$pkgver"

  for imod in ${!alsa_tools_mods[*]}
  do
    nmod="${alsa_tools_mods[$imod]}"
    msg "Compiling: ${nmod} ($[imod+1]/${#alsa_tools_mods[*]}).."
    case $nmod in
      "seq") cd $nmod/sbiload;;
      *)     cd $nmod;;
    esac
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR="$startdir/pkg" install || return 1
    cd -
  done

  msg "Copying: daemon, conf.."
  mkdir -vp  "$startdir/pkg/etc/rc.d"
	install -v -m 755 "$startdir/src/alsa-emu10k1d" \
	"$startdir/pkg/etc/rc.d/alsa-emu10k1d" || return 1
	mkdir -vp  "$startdir/pkg/etc/conf.d"
	install -v -m 644 "$startdir/src/alsa-emu10k1d.conf" \
	"$startdir/pkg/etc/conf.d/alsa-emu10k1d" || return 1

  find "$startdir/pkg" -name '*.la' -exec rm {} \;
}
#$cat=multimedia
