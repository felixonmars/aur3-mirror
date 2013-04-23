#!/bin/bash

pkgname=iup-all-bin
pkgver=3.7
pkgrel=1
pkgdesc="Cross platform GUI toolkit. This package includes dependencies (cd and im) + links them to Lua (5.1 and 5.2) libraries folders."
arch=('x86_64' 'i686')
url="http://www.tecgraf.puc-rio.br/iup/"
license=('custom:tecgraf_library')
makedepnds=('sed')
depends=('gtk2' 'lua51' 'freetype2' 'fontconfig' 'mesa' 'ftgl')

sf_name(){
  local url
  for url in "$@"
  do
    basename "${url///download}"
  done
}

sf_names(){
  local url
  for url in "$@"
  do
    echo "`sf_name "$url"`::$url"
  done
}

if [ $CARCH = "x86_64" ]
then
  source=($(
    sf_names \
    "http://sourceforge.net/projects/imtoolkit/files/3.8.1/Linux%20Libraries/im-3.8.1_Linux32_64_lib.tar.gz/download" \
    "http://sourceforge.net/projects/canvasdraw/files/5.6/Linux%20Libraries/cd-5.6_Linux32_64_lib.tar.gz/download" \
    "http://sourceforge.net/projects/iup/files/3.7/Linux%20Libraries/iup-3.7_Linux32_64_lib.tar.gz/download"
  ))

  md5sums=('d28c103aa52c3be3d780da7a1c697ef2'
           '136a30e86f3e0cc51a4571f11e87a416'
            '62760d35409877b9c250876a5a5cfba0')
else
  source=($(
    sf_names \
    "http://sourceforge.net/projects/imtoolkit/files/3.8.1/Linux%20Libraries/im-3.8.1_Linux32_lib.tar.gz/download" \
    "http://sourceforge.net/projects/canvasdraw/files/5.6/Linux%20Libraries/cd-5.6_Linux32_lib.tar.gz/download" \
    "http://sourceforge.net/projects/iup/files/3.7/Linux%20Libraries/iup-3.7_Linux32_lib.tar.gz/download"
  ))

  md5sums=('9521c9a728e5ec4f6cd5cb85a21a85ed'
           '0f929b4d47525f23d7473814018cce85'
           '6af0f368dda8ee0abf49139dbd4e4215')
fi

noextract=( `sf_name "${source[@]}"` )
exclude_files='lib(z|ftgl|freetype)\.(so|a)'

build(){
    local file

    cd "$srcdir"

    for file in "${noextract[@]}"
    do
      local dir="${file//_Linux*}"
      mkdir -p $dir
      tar -C "$dir" -zxf "$file"
    done
}

package(){
  local libname
  local lua_lib
  local mode

  cd "$srcdir"

  mkdir -p "$pkgdir/usr/"{lib/lua/{5.1,5.2},include}

  for dir in *
  do
    [ -d "$dir" ] || continue

    cp -r --no-preserve=ownership,mode "$dir/include" "$pkgdir/usr/include/$dir"

    find "$dir" -type f \( -name \*.a -or -name \*.so \) -print | \
    egrep -wv "$exclude_files" | \
    while read libname
    do
      if [ "${libname:${#libname}-2}" = ".a" ]
      then
        mode="644"
      else
        mode="755"
      fi

      install -m "$mode" "$libname" "$pkgdir/usr/lib"

      lua_lib="`echo "$libname" | sed -e 's#.*/lib\(.*\)5\([12]\)\.\(so\|a\)$#usr/lib/lua/5.\2/\1.\3#;tq;d;:q'`"
      [ -z "$lua_lib" ] || ln -s ../../"`basename "$libname"`" "$pkgdir/$lua_lib"
     done
  done
}
