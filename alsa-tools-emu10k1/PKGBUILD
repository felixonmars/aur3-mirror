# Contributor: 3ED <krzysztof1987@gmail.com>
pkgname=alsa-tools-emu10k1
pkgver=1.0.26.1
pkgrel=1
pkgdesc="ALSA tools package for emu10k1 sound card"
backup=(etc/rc.d/alsa-emu10k1d etc/conf.d/alsa-emu10k1d)
url="http://alsa-project.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('alsa-lib' 'alsa-utils')
optdepends=("alsa-tools-emu10k1-gui: dsp editor with gui in qt3")
sha256sums=('553338693707fe6ddfc430b9edc4cd2677390e200c9e38de82ede3394e733841'
            '4db2b08b8391b60bc4306977090562ba226761e7fcd3932d5780dbf8b34480ff'
            '7f6c82a038ed891fe706552baf401eec65b5b396634d217d8e6a9f1f37d45dfe')

source=("ftp://ftp.alsa-project.org/pub/tools/alsa-tools-$pkgver.tar.bz2"
        "alsa-emu10k1d"
        "alsa-emu10k1d.conf")

install=alsa-tools-emu10k1.install

[ -n "$alsa_tools_mods" ] || \
  alsa_tools_mods=(ac3dec as10k1 ld10k1 seq)

build() {
  cd "$srcdir/alsa-tools-$pkgver"

  local -i modmax=0 modcount=0
  local nmod imod 

  # ARCHWAY ARRAY (hack for disabled positions)
  for imod in ${!alsa_tools_mods[*]}
  do
    [ "${alsa_tools_mods[$imod]:0:1}" = '!' ] || modmax=$[modmax + 1]
  done

  # COMPILING LOOP
  for imod in ${!alsa_tools_mods[*]}
  do
    nmod="${alsa_tools_mods[$imod]}"

    # checking: if mod has been disabled (archway) then do nothing..
    [ "${nmod:0:1}" = '!' ] && continue || modcount=$[modcount + 1]

    msg2 "Compiling: ${nmod} ($modcount/$modmax).."

    # exceptions, entering to dir
    case $nmod in
      "seq") cd "$nmod/sbiload/";;
      *)     cd "$nmod/";;
    esac

    # compiling..
    ./configure --prefix=/usr
    make

    cd -
  done
}

package() {
  cd "$srcdir/alsa-tools-$pkgver"

  local -i modmax=0 modcount=0
  local nmod imod 

  # ARCHWAY ARRAY (hack for disabled positions)
  for imod in ${!alsa_tools_mods[*]}
  do
    [ "${alsa_tools_mods[$imod]:0:1}" = '!' ] || modmax=$[modmax + 1]
  done

  # INSTALLING LOOP
  for imod in ${!alsa_tools_mods[*]}
  do
    nmod="${alsa_tools_mods[$imod]}"

    # checking: if mod has been disabled (archway) then do nothing..
    [ "${nmod:0:1}" = '!' ] && continue || modcount=$[modcount + 1]

    msg2 "Packaging: ${nmod} ($modcount/$modmax).."

    # exceptions, entering to dir
    case $nmod in
      "seq") cd "$nmod/sbiload/";;
      *)     cd "$nmod/";;
    esac

    # installing files..
    make DESTDIR="$pkgdir/" install

    cd -
  done

  # INSTALLING extra files
  msg2 "Copying: daemon, conf.."
  install -v -dm755 "$pkgdir/etc/"{rc.d,conf.d}
	install -v  -m755 "$srcdir/alsa-emu10k1d" "$pkgdir/etc/rc.d/alsa-emu10k1d"
	install -v  -m644 "$srcdir/alsa-emu10k1d.conf" "$pkgdir/etc/conf.d/alsa-emu10k1d"

  find "$pkgdir/" -name '*.la' -type f -delete
}

