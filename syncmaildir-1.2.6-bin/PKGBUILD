#!/bin/bash
# ^ Above shabeng-line to automatically switch on syntax highlighting in some editors.

# Maintainer: dreieck
# Contributor: Thomas Jost <schnouki [at] schnouki ]dot[ net>
_pkgname=syncmaildir
_pkgver=1.2.6
pkgname="${_pkgname}-${_pkgver}-bin"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Synchronize a pair of mailboxes in Maildir format via ssh. Version ${_pkgver}, precompiled binary from debian jessie."
arch=("i686" "x86_64")
url="http://syncmaildir.sourceforge.net/"
license=('GPL3')
depends=('lua51' 'xdelta')
optdepends=()
makedepends=('dpkg') # Extract debian packages.
provides=(
          "${_pkgname}=${pkgver}"
          "syncmaildir-applet=${pkgver}"
         )
replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgver}")

options=("!emptydirs")

install="syncmaildir.install"

case "${CARCH}" in
  "i686")
    _srcfilenames=(
                'syncmaildir_1.2.6-1_i386.deb'
                'syncmaildir-applet_1.2.6-1_i386.deb'
               )
    _sha512sums=(
                 '9501f5d730edb8ccb1da65d77c2ecd0039c319d36c64569bf308ee63974be92d1ee9a00358b9e13ae6a08fa03789340f2b16a4f7f5866b993371c74c706ca612'
                 '24d13af89ee78dbd2ed52f6fe56d5d57e84fcf9cd1924aa5fa6a70213b4230e55dff9de53d832f56eaacab9f981190d127821700de6466ebe20efc42a3000765'
                )
  ;;
  "x86_64")
    _srcfilenames=(
                'syncmaildir_1.2.6-1_amd64.deb'
                'syncmaildir-applet_1.2.6-1_amd64.deb'
               )
    _sha512sums=(
                 '23e632ea2c3384cc57a5db64dd669deee40231e39a4fb3d0b81be48b28da41b9dd996355c58304b5ae514b294fe3738082994218d95293e544d3a815298a5121'
                 '5b8af277fbbc7762f2350b93983cd434af8706f87c2551458ced75dddbb4dbf99ec150cd9fec9f5dc72e3a42f7cb987bcc3aa916f1cfd70b6dd383a2a2a54b67'
                )
  ;;
  *)
    echo "Error: Build for Architecture '${CARCH}' not defined. Aborting."
    false
    exit 1
  ;;
esac

source=(
        "http://ftp.de.debian.org/debian/pool/main/s/syncmaildir/${_srcfilenames[0]}"
        "http://ftp.de.debian.org/debian/pool/main/s/syncmaildir/${_srcfilenames[1]}"
        "${install}"
       )
sha512sums=(
            "${_sha512sums[@]}"
            '8b67c208dc4bf4a6695bcc290dbdca4fbeb429b4820bdbded3f8924ebaa9c3170df02294204d2718ad5c188731a23703a4a93efff20cc175884855f8f3ea5374'
           )

package() {
  cd "${srcdir}"
  for _srcfilename in "${_srcfilenames[@]}"; do
    dpkg --extract "${_srcfilename}" "${pkgdir}"
  done
}

