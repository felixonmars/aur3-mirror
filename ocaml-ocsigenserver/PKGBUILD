# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='ocsigenserver'
pkgname="ocaml-${srcname}"
pkgver='2.1'
pkgrel=1
pkgdesc='An extensible Web server written in OCaml'
arch=('i686' 'x86_64')
url='http://ocsigen.org/'
license=('LGPL')
depends=('ocaml' 'ocaml-ssl' 'ocamlnet' 'ocaml-react' 'ocaml-lwt' 'ocaml-cryptokit' 'ocaml-sqlite3' 'ocaml-tyxml>=2.1')
makedepends=('ocaml-findlib')
provides="ocaml-${srcname}"
conflicts="ocaml-${srcname}"
backup=("etc/${srcname}/${srcname}.conf")
options=('!strip')
install="${pkgname}.install"
source=("http://ocsigen.org/download/${srcname}-${pkgver}.tar.gz"
        'etc_rc.d_ocsigenserver')
md5sums=('d0cccecbfac701eeeee0ad48d743f3d0'
         '05f58d659568d953266f4b838c1b00ed')

build() {
  cd "$srcdir/${srcname}-${pkgver%a}"
  chmod +x configure
  ./configure --prefix /usr \
              --temproot "$pkgdir" \
              --ocsigen-user root \
              --ocsigen-group root \
              --staticpagesdir "/srv/${srcname}" \
              --with-sqlite --without-dbm

  make
  make doc
}


package() {
  mkdir -p "${pkgdir}/$(ocamlfind printconf destdir)"

  cd "$srcdir/${srcname}-${pkgver%a}"
  make install || true
  make install.doc

  mkdir -p "${pkgdir}/etc/rc.d"
  cp "${startdir}/etc_rc.d_ocsigenserver" "${pkgdir}/etc/rc.d/ocsigenserver"
}
