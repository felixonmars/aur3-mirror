# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Jamie Nguyen <dyscoria@googlemail.com>

pkgname=vim-stripped
_realname=vim
_srcver=7.3
_patchlevel=260
pkgver=${_srcver}.${_patchlevel}
pkgrel=1
pkgdesc="A bleeding edge version of vim, stripped down from extras, languages and useless deps."
url="http://www.vim.org"
license=('custom:vim')
arch=('i686' 'x86_64')
depends=('acl')
makedepends=('rsync')
conflicts=('vim' 'gvim')
provides=("vi=${pkgver}" "vim=${pkgver}")
backup=('etc/vimrc')
source=("ftp://ftp.vim.org/pub/vim/unix/vim-${_srcver}.tar.bz2"
        "fetch_patches.sh"
        "ignore_patches.list")
md5sums=('5b9510a17074e2b37d8bb38ae09edbf2'
         '65cfbbcc3ab99d9d5ceee40ecb3b2e1a'
         'b784b2abd447d0aeda89e6db977ebf4d')

_vimfolder=${_realname}$(echo ${_srcver} | sed "s/\.//")
_runtimefolder=/usr/share/vim/${_vimfolder}

build()
{
  . ${srcdir}/fetch_patches.sh
  get_patches

  cd "${srcdir}/${_vimfolder}"

  # Define system config file as /etc/vimrc
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' src/feature.h

  ./configure --prefix=/usr --localstatedir=/var/lib/vim --mandir=/usr/share/man \
              --with-global-runtime=/usr/share/vim \
              --disable-perlinterp --disable-pythoninterp --disable-tclinterp \
              --disable-rubyinterp --disable-workshop --disable-netbeans \
              --disable-multibyte --disable-gui --disable-gpm \
              --with-features=tiny --with-x=no --disable-selinux \
	      --enable-cscope
  make
}

package() {
  cd "${srcdir}/${_vimfolder}"
  make VIMRCLOC=/etc DESTDIR=${pkgdir} install

  # Update runtime files
  rsync -avzcP --delete --exclude="dos" --exclude="spell" --exclude="*.aap" ftp.nluug.nl::Vim/runtime/ ${pkgdir}/${_runtimefolder}
  chown -R root:root ${pkgdir}/${_runtimefolder}
  find ${pkgdir}/${_runtimefolder} -type f -exec chmod 644 '{}' \;
  find ${pkgdir}/${_runtimefolder} -type d -exec chmod 755 '{}' \;
  find ${pkgdir}/${_runtimefolder} -type d -exec chmod -s '{}' \;
  
  # Clean unneeded binary files and man pages
  cd ${pkgdir}/usr/bin
  rm -f ex view rview xxd vimtutor
  find ${pkgdir}/usr/share/man -type d -name 'man1' 2>/dev/null | \
  while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1 vimtutor.1 xxd.1
  done
  
  # Fix FS#17216
  sed -i 's|messages,/var|messages,/var/log/messages.log,/var|' \
          ${pkgdir}/usr/share/vim/${_vimfolder}/filetype.vim

  # Patch filetype.vim for better handling of pacman related files
  sed -i "s/rpmsave/pacsave/;s/rpmnew/pacnew/;s/,\*\.ebuild/\0,PKGBUILD*,*.install/" \
          ${pkgdir}/usr/share/vim/${_vimfolder}/filetype.vim
  sed -i "/find the end/,+3{s/changelog_date_entry_search/changelog_date_end_entry_search/}" \
          ${pkgdir}/usr/share/vim/${_vimfolder}/ftplugin/changelog.vim
  
  # Default vimrc file
  install -D -m644 ${pkgdir}/${_runtimefolder}/vimrc_example.vim ${pkgdir}/etc/vimrc

  # License
  install -Dm644 ${srcdir}/${_vimfolder}/runtime/doc/uganda.txt\
    ${pkgdir}/usr/share/licenses/${_realname}/license.txt
}
