# Contributor: Colin Shea <colin@evaryont.me>
pkgname=mutt-great-dane
pkgver=1.5.21
pkgrel=4
pkgdesc="A small but very powerful text-based mail client with sidebar, NNTP, compressed, trash folder, urlview, and much more!"
arch=('i686' 'x86_64')
license=('GPL')
url="http://lunar-linux.org/index.php?page=mutt-sidebar"
depends=('openssl' 'gdbm' 'mime-types' 'libsasl' 'slang' 'libidn' 'gnupg'
         'gpgme')
makedepends=('libxslt' 'lynx')
conflicts=('mutt')
provides=('mutt')
source=(ftp://ftp.mutt.org/mutt/devel/mutt-${pkgver}.tar.gz
        ftp://ftp.mutt.org/pub/mutt/contrib/urlview-0.9.tar.gz
        muttrc.example
        patch-${pkgver}.as.echo.2
        patch-${pkgver}.ats.date_conditional.3
        patch-${pkgver}.cd.ifdef.2
        patch-${pkgver}.cd.purge_message.8
        patch-${pkgver}.cd.source_multiple.3
        patch-${pkgver}.csev.ask_passphrase.1
        patch-${pkgver}.csev.yesnet.1
        patch-${pkgver}.dgc.deepif.2
        patch-${pkgver}.indexcolor-3+cb.diff
        patch-${pkgver}.rr.compressed
        patch-${pkgver}.sidebar.20120829.txt
        patch-${pkgver}.tamo.w3mface.3
        patch-${pkgver}.vvv.initials
        patch-${pkgver}.vvv.nntp.2
        patch-${pkgver}.vvv.quote.2
        patch-${pkgver}.csev.fix_pager_face
        mutt-resent-header-weeding.patch
        mutt-sendbox-bounce.patch
        mutt-sendbox.patch
        mutt-write_postponed.patch
        mutt-attach.patch
        trash_folder-1.5.18.patch
        mutt-xterm_title.patch.2
        patch-0.9.dw.urlview-html.3
        patch-0.9.csev.urlview-fixes.1
        patch-0.9.csev.urlview-manprefix.1
        urlview.c.qpd-patch)

md5sums=('a29db8f1d51e2f10c070bf88e8a553fd'
         '67731f73e69297ffd106b65c8aebb2ab'
         '336d1d8e290a0595dbe2cd92d720ffc9'
         '5c67c8bf89160b48cfd6a110d0c8e34a'
         '0670750f2d82a32391c842e202aae775'
         '32d1899cfea50b0d00c7ca88406cb7ee'
         '5f9d902fac287035889ffd3d4faae333'
         '1aa94164f4169e20ab66a1b531535c6c'
         'a952a79d527395e25e3c980497004327'
         '31de8c2733f87de6046cd4f3ba7690a4'
         'b3a07af278ed9c7f16310be2fe1675ea'
         '7cb9520885799d634a7aa127c37e30e6'
         '4b34b6911edd1bc7bf1c8eff33b35c08'
         'e4bb3b47ebf56da15bbd778b8e1ce002'
         '562339078f5f1be52f8f068a86a31676'
         '1e22b6f0a2a6628289baee19c37e2536'
         'de02d60c59050960cf65324f316eefe8'
         'dcdc940070d3bd0bcf7017af70cfffc3'
         '04681abbfbc364c41ff348d06189b85d'
         'eb4818622b6540770eeb81dbea8447f8'
         '0bbc48f7c0cc10e15ac9dbae7d34b82d'
         '267acfc33f6e3fc75e7f284347d9c4d6'
         '26be8adc6ba3d2f407ff1d2ed2e647b4'
         '659d26f6dae386d55a58c5311e57632e'
         'a83177bfd298fa3d2644d538cc79379b'
         'ad228999905688201e1d20a3f2756f87'
         'fe79ea2cc0c590762cd7940a1c8e2a9a'
         'b9445c1e532a2a0969fb6e3d8fbc86b5'
         'cddf01efd62c477adc8dada7d991b106'
         'babae55851e89535b9719dea76c643a1')

sha256sums=('2141f36e8d0f4f71c9ca6780001e7cc679fe313e643953fc07f001223e67c4a0'
            '74d18026e84e3cd70a3fdd1a7247a68031b0c1c1c6d761d64b7063ff71091cc3'
            '608423900a7ce6fc39a1da73d35825e9c456adfe535cb586926a53e314958942'
            '3828a9301850ddbe05218de481204cd847c422bd0e7102b100dc5cc7dafb5893'
            '611d09be48d66cf56507e9738d56b96c2c1c8d4761c231d140d8f8a21242e0ec'
            '5653ff8c12cf17e2f7eeec73c843617e2c909ff703d2fad56b3392275fc88125'
            '787c3f94b388588aca87fdeb0e12be2df09284f1300e2cc9036f3a658c8898ee'
            'a63045f332570080601d249e4c54aca4165f8f0892aa9093d881a1b810ec1d33'
            'a5747adcce833bca39121957de38620144462032a93f143a388841fe8d864636'
            'f968081a8bc51df660b3fc4bbb3df1e7687491389eba09ce59ddf9379868d53e'
            '05fd54a03f2ea2216af3cb9c34a2525d48f45d5005b510d996cadcfe69517a25'
            '9287eb7ec00a9d739dd94a9c0022d4cd5d4177894d47ca9ad9505e2a935520a4'
            'c5f31b429c9a9bb7076aa02bf848f175e53ddf6926b0982da11abc4c953c6282'
            'fe645542b30de159116a5c8770539ba5b428cb5d26df7b5c466e8eff294b257b'
            'b21ee425965666d5c876200657ca85fb6991c4c0865e5f9720b4cfe99ac656d3'
            'd3b6c95316c79796e7744ee773dec37f273d6ca0eec32add1f5858aa133cd739'
            'edeae65a482808c4762784d6583dce83e5c83f047a0a99c1420d9c9c6f9f3b3d'
            'e4f4d575dae710d03c1f2e734f91b99d48bb3171c11d6dfb35c2bb188b0e87bc'
            '53ed4f81f7073c8aad470fca5a63ddbbc9f0b545a388a69763a6fef4c2c6fcef'
            '8ecdfb01d755945cd2f37a4782d6a3d8fe3cbb00ac71594fdb3153ede4d34d24'
            'ce67fe56695af26824d8a69c9b45327366b31e4e267285e72f6c85d0dba89c41'
            'dc66c6dd546e2bb55c7df6704a4c3e1f9af8388526015ca205cc705e5130343d'
            '62311c77db5f224f5a89cd4ce1a2191ee5a1f9671b726a48ee99eab432e827a9'
            'da2c9e54a5426019b84837faef18cc51e174108f07dc7ec15968ca732880cb14'
            'e5012c018956c0848355453c308ff9e3efe7ea90a3519fadb59bd19db1f29673'
            '7a4c06d036650ae8562bce89bcd4ff3ad4f827cbe467639352c3b10dbccc97af'
            'f70c8b16486504839f7927ab601d01ef5d901647e4961d4b87c24900f6380b99'
            '7bb37975f50917b095d5f50e4f86f928f0eb8807d4649da0da57e90fdfc4024e'
            '45acb7302d1c43e302da9bbf6972ba27d098170f0a64216e88507844ba57d723'
            'f62803ef7e7d84bcd4d67e1c1ebad4f7cb5f9358e7cdbda0068946c8545f0979')

build() {
  if [ -e $srcdir/.built ] ; then
    return 0;
  fi
  #####################################
  ## mutt

  cd $srcdir/mutt-$pkgver
  msg "Patching mutt"
  msg2 'Sidebar'
  patch -p1 -Ni ../patch-${pkgver}.sidebar.20120829.txt # Sidebar == awesome
  msg2 'NNTP'
  patch -p1 -Ni ../patch-${pkgver}.vvv.nntp.2 # NNTP support. Gmane <3
  msg2 'Compression'
  patch -p1 -Nui ../patch-${pkgver}.rr.compressed # Support compressed mail
  msg2 'Initials Formatting'
  patch -p1 -Nui ../patch-${pkgver}.vvv.initials # Extra format for initials
  msg2 'Smarter Quotes'
  patch -p1 -Nui ../patch-${pkgver}.vvv.quote.2 # Smarter quote handling
  msg2 'Trash folder'
  patch -p1 -Nui ../trash_folder-1.5.18.patch # Smart trash
  msg2 'Attachment keyword alert/abort'
  patch -p1 -Nui ../mutt-attach.patch # Abort on missing attachments
  # These following were up-ported by me, manually, after applying the previous
  # patches. Most likely they will still apply, but with some fuzziness. Not
  # sure, nor do I care enough to test. I want my mutt this featureful. It's
  # awesome.
  msg2 'muttrc conditions'
  patch -p1 -Nui ../patch-${pkgver}.cd.ifdef.2 # Conditional support stuff
  msg2 'echo command'
  patch -p1 -Nui ../patch-${pkgver}.as.echo.2 # Feedback from scripts
  # Different colors for each column (e.g. author, date, subject..)
  msg2 'index color'
  patch -p1 -Nui ../patch-${pkgver}.indexcolor-3+cb.diff
  # (Required: Trash Folder) - Skip the trash folder
  msg2 'trash folder skip'
  patch -p1 -Nui ../patch-${pkgver}.cd.purge_message.8
  # Source multiple files in a single call (useful for globbing)
  msg2 'source multiple files'
  patch -p1 -Nui ../patch-${pkgver}.cd.source_multiple.3
  patch -p1 -Nui ../patch-${pkgver}.csev.ask_passphrase.1 # Fix passphrase error
  msg2 'xface support via w3m'
  patch -p1 -Nui ../patch-${pkgver}.tamo.w3mface.3 # Show X-Face in mutt
  msg2 'nested if conditions'
  patch -p1 -Nui ../patch-${pkgver}.dgc.deepif.2 # Allow nested if statements
  msg2 'date conditionals'
  patch -p1 -Nui ../patch-${pkgver}.ats.date_conditional.3 # Conditions on dates

  # Aron Griffis' sendbox patchset, updated for Mutt 1.5.21
  # Contributor: Gaetan Bisson <bisson@archlinux.org>
  # I take no credit, but sendbox is useful, so it's being added.
  msg2 'sendbox'
  patch -p1 < ../mutt-write_postponed.patch
  patch -p1 < ../mutt-resent-header-weeding.patch
  patch -p1 < ../mutt-sendbox.patch
  patch -p1 < ../mutt-sendbox-bounce.patch

  # mutt can set the xterm title! Smart lil' dog, eh?
  msg2 'xterm title'
  patch -p1 < ${srcdir}/mutt-xterm_title.patch.2

  patch -p1 -Nui ../patch-${pkgver}.csev.fix_pager_face # fix a syntax error

  # Delete all the patch-save files
  find -name \*.orig -delete

  msg2 'sed fixes'
  # Deprecated
  sed -i '/^AM_C_PROTOTYPES$/{d;q;}' configure.ac
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac

  msg "Compiling ${pkgname}-${pkgver}"

  aclocal -I m4
  autoheader
  automake --foreign
  autoconf

  # (apply this patch after automake)
  patch -p1 -i ../patch-${pkgver}.csev.yesnet.1 # Allow xslt to go online & d/l

  ./configure --prefix=/usr --sysconfdir=/etc \
  --enable-gpgme --enable-pop --enable-imap --enable-smtp --enable-nntp \
  --enable-debug --disable-warnings --enable-compressed --enable-exact-address \
  --enable-hcache --enable-sendbox  --with-slang --with-regex --with-gss \
  --with-ssl=/usr --with-sasl --with-idn || return 1

  make || return 1

  #####################################
  ## urlview

  msg "Compiling urlview-0.9"

  cd $srcdir/urlview-0.9
  patch -p1 -Nui ../patch-0.9.dw.urlview-html.3
  patch -p1 -Nui ../patch-0.9.csev.urlview-fixes.1
  patch -p1 -Nui ../urlview.c.qpd-patch

  ./configure --prefix=/usr --sysconfdir=/etc \
              --with-slang --enable-warnings || return 1

  make || return 1

  # Delete all the patch-save files
  find -name \*.orig -delete
  touch $srcdir/.built
}

package() {
  #####################################
  ## mutt
  cd $srcdir/mutt-$pkgver

  make DESTDIR=$pkgdir install || return 1
  rm -f ${pkgdir}/usr/bin/{flea,muttbug}
  rm -f ${pkgdir}/usr/share/man/man1/{flea,muttbug}.1
  rm -f ${pkgdir}/etc/mime.types*
  install -m644 -D ${srcdir}/muttrc.example ${pkgdir}/etc/muttrc.example

  #####################################
  ## urlview
  cd ../urlview-0.9
  patch -p1 -Nui ../patch-0.9.csev.urlview-manprefix.1
  mkdir -p $pkgdir/usr/man/man1/ $pkgdir/usr/bin
  make DESTDIR=$pkgdir install || return 1
  mv $pkgdir/usr/man/man1/* $pkgdir/usr/share/man/man1/
  rm -r $pkgdir/usr/man

  rm $srcdir/.built
}

