# Maintainer: eqyiel <eqyiel@gmail.com>
# usage:
# fortune | cowsay -f repo-elephant-large
# fortune | cowsay -f repo-elephant-tiny

pkgname=elephantsay
pkgver=1
pkgrel=1
pkgdesc="Add some repo-elephants to cowsay."
arch=('any')
url="http://www.heartnsoul.com/ascii_art/elephants.txt"
license=('unknown')
depends=('cowsay')
optdepends=('fortune-mod')

build() {
  echo "##
## artist: mrf (Morfina)
## http://www.khimaira.net/extra/morfi/ascii/index.html
## site has been AWOL since 2005, use the wayback machine
##
\$the_cow = <<EOC;
  \$thoughts
   \$thoughts
      __
     '. \\\\
      '- \\\\
       / /_         .---.
      / | \\\\\\\,.\\\\/--.//    )
      |  \\\\//        )/  /
       \\\\  ' ^ ^    /    )____.----..  6
	'.____.    .___/            \\\._)
	   .\\\\/.                      )
	    '\\\\                       /
	    _/ \\\\/    ).        )    (
	   /#  .!    |        /\\\\    /
	   \\\\  C// #  /'-----''/ #  /
	.   'C/ |    |    |   |    |mrf  ,
	\\\\), .. .'OOO-'. ..'OOO'OOO-'. ..\\\\(,
EOC
" > repo-elephant-large.cow
  echo "##
## artist: jgs (Joan G. Stark)
## http://geocities.ucan.us/soho/7373/
##
\$the_cow = <<EOC;
  \$thoughts
   \$thoughts
       _    _
      / \\\\__/ \\\\_____
     /  /  \\\\  \\\\    \`\\\\
     )  \\\\''/  (     |\\\\
     \`\\\\__)/__/'_\\\\  /\`
	//_|_|~|_|_|
	^\"\"\'\"\' \"\"\'\"\'
EOC
" > repo-elephant-tiny.cow
  mkdir -p ${pkgdir}/usr/share/cows
  cp $srcdir/repo-elephant-{tiny,large}.cow ${pkgdir}/usr/share/cows || return 1
}

# vim:set ts=2 sw=2 et:
