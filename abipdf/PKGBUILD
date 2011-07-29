# Maintainer: Dan Serban

pkgname=abipdf
pkgver=0.1
pkgrel=1
pkgdesc="Convert .txt to .pdf"
arch=(any)
url=http://127.0.0.1/
license=(CC-BY-SA)
depends=(abiword ghostscript)

build()
{
  mkdir -p "$pkgdir/usr/bin"
  USRBINFILE="$pkgdir/usr/bin/abipdf"
  echo '#!/bin/bash' > "$USRBINFILE"
  echo '_tempfile=$(mktemp -u)' >> "$USRBINFILE"
  echo 'abiword --to=ps --to-name="${_tempfile}" "${1}"' >> "$USRBINFILE"
  echo 'ps2pdf "${_tempfile}" "${1}.pdf"' >> "$USRBINFILE"
  echo 'rm "${_tempfile}"' >> "$USRBINFILE"
  chmod +x "$USRBINFILE"
}
