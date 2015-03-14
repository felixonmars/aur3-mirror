# Maintainer: André van Delden <andre.van.delden@uni-bremen.de>

pkgname=hets-released
pkgver=0.99.20130424
pkgrel=1
_arch=$(if [ `getconf LONG_BIT` = "64" ]; then echo "64"; else echo ""; fi)
_sha512sum=$(if [ `getconf LONG_BIT` = "64" ];
             then echo "db7b376d82df49fcb0a16c032119cb74d7ffdded5808a044853f3902db2c89086fd73d66d0ecc03ecdcd06cf42b442918d1f9e0f3353532d9155e896d6679aab";
             else echo "2d59135ed3a3a0938309e4245955e876607994205a37bc2490cda1c7bd0598c628c42b6a199e3f81ca8a812bf8a9431dcf028070b88a4dc4ca83f9a01c49a034";
             fi
            )

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages, thus providing a tool for heterogeneous specifications. Logic translations are first-class citizens."

url="http://www.informatik.uni-bremen.de/agbkb/forschung/formal_methods/CoFI/hets/index_e.htm"
license='custom:hets-license'

arch=('i686' 'x86_64')
depends=('hets-lib'
         'spass'
         'eprover'
         'minisat'
         'udrawgraph>=3.1.1'
         'gtk2'
         'libglade<3.0'
         'tcl'
         'tk>=8.4'
         'ncurses')

optdepends=('e-krhyper' 'isabelle' 'pellet')
source=("http://www.informatik.uni-bremen.de/agbkb/forschung/formal_methods/CoFI/hets/linux${_arch}/releasedhets.bz2"
        'http://www.informatik.uni-bremen.de/agbkb/forschung/formal_methods/CoFI/hets/LICENSE.txt'
        'hets-released')
sha512sums=(${_sha512sum}
            '5b322abf6a5a82894113c0dfe549725b140006197a920dfdf1a3ed615730e1de0a947cceea5ff9357cdd42334f8f53a1ab66072fca9ea966be85340a56d4649c'
            '3dc4ebe67a06686ed6ef1fd1496fe994d3a942b9a2f853e9b7524b164b284e3753176d04c1d78e57291313079ea7942832b84498099447f3db69342f20bcffcf')

package() {
  cd ${srcdir}

  # install the binary and starter script
  install -Dm755 releasedhets ${pkgdir}/usr/bin/hets-released.bin
  install -Dm755 hets-released ${pkgdir}/usr/bin/hets-released

  # install license
  install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # The libtinfo.so functionality is built into the libncurses.so shared library.
  if ! test -e /usr/lib/libtinfo.so.5; then
    install -d ${pkgdir}/usr/lib
    if test -e /usr/lib/libtinfo.so; then
      ln -s /usr/lib/libtinfo.so ${pkgdir}/usr/lib/libtinfo.so.5
    elif test -e /usr/lib/libncurses.so.5; then
      ln -s /usr/lib/libncurses.so.5 ${pkgdir}/usr/lib/libtinfo.so.5
      ln -s /usr/lib/libtinfo.so.5   ${pkgdir}/usr/lib/libtinfo.so
    else
      echo "Cannot find either of '/usr/lib/libtinfo.so.5', '/usr/lib/libtinfo.so' or '/usr/lib/libncurses.so.5'."
      return 1
    fi
  fi

  # Hets expects udrawgraph to be named uDrawGraph:
  if ! test -e /usr/bin/uDrawGraph; then
    if test -e /usr/bin/udrawgraph; then
      ln -s /usr/bin/udrawgraph ${pkgdir}/usr/bin/uDrawGraph
    else
      echo "Cannot find either of '/usr/bin/udrawgraph' or '/usr/bin/uDrawGraph'."
      return 1
    fi
  fi
  # Hets expects eprover to be named eproof:
  if ! test -e /usr/bin/eproof; then
    if test -e /usr/bin/eprover; then
      ln -s /usr/bin/eprover ${pkgdir}/usr/bin/eproof
    else
      echo "Cannot find either of '/usr/bin/eprover' or '/usr/bin/eproof'."
      return 1
    fi
  fi
}
# vim:syntax=sh
