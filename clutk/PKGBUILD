pkgname=clutk
pkgver=0.3.60
pkgrel=1
pkgdesc="clutk"
arch=('i686' 'x86_64')
url="https://launchpad.net/clutk"
license=('LGPL')
depends=('gtk2' 'clutter' 'clutter-gtk2' 'gtk-doc' 'gobject-introspection' 'libindicate' 'ido' 'glew1.5' 'libpng12')
#options=('!libtool')
source=(
"http://mirrors.us.kernel.org/ubuntu//pool/universe/c/clutk/libclutk-0.3-0_0.3.60-0ubuntu1_amd64.deb"
"http://mirrors.us.kernel.org/ubuntu//pool/universe/c/clutk/libclutk-0.3-0_0.3.60-0ubuntu1_i386.deb"
"http://mirrors.us.kernel.org/ubuntu//pool/universe/c/clutk/libclutk-dev_0.3.60-0ubuntu1_amd64.deb"
"http://mirrors.us.kernel.org/ubuntu//pool/universe/c/clutk/libclutk-dev_0.3.60-0ubuntu1_i386.deb"
"http://mirrors.us.kernel.org/ubuntu//pool/universe/c/clutk/libclutk-doc_0.3.60-0ubuntu1_all.deb"
)
sha512sums=(
'758c49293ee840950dd6e13abb018b47063f7d1991534bb5f2aed2a71ee52d15dff4eacf878099b47186a404245a271e4dfc78da131095e7ebd70a545e69f747'
'faab3d8199034dca0f50a9377ec25c33f56276da4cae276fa2897da87ffcc7204a15b9705de9122a578376159e3993ff4630f01bd126e4b8d8b297a843640263'
'59beafb2fef83514baeec612ee2c5b4ffab8b5b7bb8305ffb91a87706c7dc0cdc00fb934a2fddd1ab3e9381d20030b75540a5efac1f29f7db854dbc624f181cb'
'482d3fabe5d41c535ae65f110463fd29a42c5d948bafce2666370de612c425a41616ee96c3388f9bc3697b3430c556fb8d35ce96cc9a37fee50fc337e331c69c'
'058a3219c28474a73529393ace60fd3468ee4d49c66b882ba115bba1bcc5ccbfdf721542a374e1e24192575408e78ff87a436246bb1ead81b5926e8d1ed7c16a'
)

package() {
  cd "${srcdir}"
  case $(uname -m) in
    i686)
      msg "Extracting x86 debian packages..."
      for i in *i386*deb; do
        cd "${pkgdir}"
        ar x "${srcdir}/${i}"
        rm debian-binary control.tar.gz
        tar zxvf data.tar.gz
        rm data.tar.gz
      done
      ;;
    x86_64)
      msg "Extracting x64 debian packages..."
      for i in *amd64*deb; do
        cd "${pkgdir}"
        ar x "${srcdir}/${i}"
        rm debian-binary control.tar.gz
        tar zxvf data.tar.gz
        rm data.tar.gz
      done
      ;;
  esac

  msg "Extracting architecture independent debian packages..."
  cd "${pkgdir}"
  ar x "${srcdir}"/*all*deb
  rm debian-binary control.tar.gz
  tar zxvf data.tar.gz
  rm data.tar.gz
}

